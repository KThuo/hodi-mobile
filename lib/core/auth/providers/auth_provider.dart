import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/api_client.dart';
import '../../filters/filter_provider.dart';
import '../data/auth_repository.dart';
import '../data/biometric_service.dart';
import '../domain/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storage = ref.watch(authLocalStorageProvider);
  return AuthRepository(apiClient: apiClient, storage: storage);
});

final biometricServiceProvider = Provider<BiometricService>((ref) {
  final storage = ref.watch(authLocalStorageProvider);
  return BiometricService(storage: storage);
});

class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;
  final bool biometricAvailable;
  final bool biometricEnabled;
  final bool pendingBiometricVerification;

  /// Whether the stored session has been looked at yet.
  ///
  /// True only for the first state, and false everywhere else — which is why it defaults to false
  /// rather than to true. A dozen places in this file build an `AuthState`, and one of them
  /// forgetting to clear a default-true flag would send a signed-in app back to the splash and leave
  /// it there. Only [AuthNotifier.build] opts in; finishing is then the absence of a decision.
  ///
  /// Without it `isAuthenticated` reads false for the moment before the keystore answers, and the
  /// router cannot tell "signed out" from "not asked yet" — so somebody with a live session was
  /// bounced to the login screen and pulled back to the dashboard a beat later.
  final bool restoring;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
    this.biometricAvailable = false,
    this.biometricEnabled = false,
    this.pendingBiometricVerification = false,
    this.restoring = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    bool? restoring,
    String? error,
    bool? isAuthenticated,
    bool? biometricAvailable,
    bool? biometricEnabled,
    bool? pendingBiometricVerification,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      biometricAvailable: biometricAvailable ?? this.biometricAvailable,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      pendingBiometricVerification:
          pendingBiometricVerification ?? this.pendingBiometricVerification,
      restoring: restoring ?? this.restoring,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState(restoring: true);

  AuthRepository get _repository => ref.read(authRepositoryProvider);
  BiometricService get _biometricService => ref.read(biometricServiceProvider);

  Future<void> checkAuth() async {
    final biometricAvailable = await _biometricService.isDeviceSupported();
    final biometricEnabled = await _biometricService.isBiometricLoginEnabled();

    final isLoggedIn = await _repository.isLoggedIn();
    if (isLoggedIn) {
      final user = await _repository.getSavedUser();
      if (user != null) {
        state = AuthState(
          user: user,
          isAuthenticated: true,
          biometricAvailable: biometricAvailable,
          biometricEnabled: biometricEnabled,
        );
        ref.read(filterProvider.notifier).loadFilters();
        return;
      }
    }

    // Token missing or expired — check if biometric re-auth is possible
    if (biometricEnabled) {
      state = AuthState(
        biometricAvailable: biometricAvailable,
        biometricEnabled: true,
        pendingBiometricVerification: true,
      );
      return;
    }

    state = AuthState(
      biometricAvailable: biometricAvailable,
      biometricEnabled: false,
    );
  }

  Future<bool> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.login(username, password);

    if (response.isSuccess && response.data != null) {
      state = AuthState(
        user: response.data,
        isAuthenticated: true,
        biometricAvailable: state.biometricAvailable,
        biometricEnabled: state.biometricEnabled,
      );
      ref.read(filterProvider.notifier).loadFilters();
      return true;
    }

    state = state.copyWith(
      isLoading: false,
      error: response.message.isNotEmpty ? response.message : 'Login failed',
    );
    return false;
  }

  Future<bool> authenticateWithBiometrics() async {
    state = state.copyWith(isLoading: true, error: null);

    final authenticated = await _biometricService.authenticate();
    if (!authenticated) {
      state = state.copyWith(
        isLoading: false,
        pendingBiometricVerification: true,
      );
      return false;
    }

    // Check if token is still valid
    final isLoggedIn = await _repository.isLoggedIn();
    if (isLoggedIn) {
      final user = await _repository.getSavedUser();
      if (user != null) {
        state = AuthState(
          user: user,
          isAuthenticated: true,
          biometricAvailable: state.biometricAvailable,
          biometricEnabled: state.biometricEnabled,
        );
        ref.read(filterProvider.notifier).loadFilters();
        return true;
      }
    }

    // Token expired — re-login with stored credentials
    final credentials = await _biometricService.getStoredCredentials();
    if (credentials == null) {
      await _biometricService.disableBiometricLogin();
      state = AuthState(
        biometricAvailable: state.biometricAvailable,
        biometricEnabled: false,
        error: 'Stored credentials not found. Please sign in manually.',
      );
      return false;
    }

    final response = await _repository.login(
      credentials.username,
      credentials.password,
    );

    if (response.isSuccess && response.data != null) {
      state = AuthState(
        user: response.data,
        isAuthenticated: true,
        biometricAvailable: state.biometricAvailable,
        biometricEnabled: true,
      );
      ref.read(filterProvider.notifier).loadFilters();
      return true;
    }

    // Stored credentials failed (password changed elsewhere)
    await _biometricService.disableBiometricLogin();
    state = AuthState(
      biometricAvailable: state.biometricAvailable,
      biometricEnabled: false,
      error: 'Stored credentials are invalid. Please sign in manually.',
    );
    return false;
  }

  Future<void> enableBiometric(String username, String password) async {
    await _biometricService.enableBiometricLogin(username, password);
    state = state.copyWith(biometricEnabled: true);
  }

  Future<void> disableBiometric() async {
    await _biometricService.disableBiometricLogin();
    state = state.copyWith(biometricEnabled: false);
  }

  Future<void> logout() async {
    final biometricAvailable = state.biometricAvailable;
    final biometricEnabled = state.biometricEnabled;

    await _repository.clearSession();
    ref.read(filterProvider.notifier).reset();

    if (biometricEnabled) {
      state = AuthState(
        biometricAvailable: biometricAvailable,
        biometricEnabled: true,
        pendingBiometricVerification: true,
      );
    } else {
      state = AuthState(
        biometricAvailable: biometricAvailable,
      );
    }
  }

  /// Handles session expiry (error 003) — preserves biometric credentials.
  Future<void> sessionExpired() async {
    final biometricAvailable = state.biometricAvailable;
    final biometricEnabled = state.biometricEnabled;

    await _repository.clearSession();
    ref.read(filterProvider.notifier).reset();

    if (biometricEnabled) {
      state = AuthState(
        biometricAvailable: biometricAvailable,
        biometricEnabled: true,
        pendingBiometricVerification: true,
      );
    } else {
      state = AuthState(
        biometricAvailable: biometricAvailable,
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
