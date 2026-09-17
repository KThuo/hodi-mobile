import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/api_client.dart';
import '../../api/api_response.dart';
import '../../filters/filter_provider.dart';
import '../../device/device_id.dart';
import '../data/auth_repository.dart';
import '../data/biometric_service.dart';
import '../domain/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storage = ref.watch(authLocalStorageProvider);
  return AuthRepository(
    apiClient: apiClient,
    storage: storage,
    device: ref.watch(deviceIdProvider),
  );
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

  /// The account cannot do anything else until its password is changed.
  ///
  /// Set from the profile's own flag at sign-in, and again by the `004` every other call answers
  /// with. Two sources because they arrive at different moments: the flag is in the sign-in
  /// response, and the status is what an already-open session discovers when somebody else sets
  /// the flag on it. The router reads this and holds the app on the change-password screen.
  final bool mustChangePassword;

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
    this.mustChangePassword = false,
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
    bool? mustChangePassword,
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
      mustChangePassword: mustChangePassword ?? this.mustChangePassword,
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
    // Whatever an older build stored — the account password, in plain text — goes now, whether or
    // not anything else here succeeds.
    await ref.read(authLocalStorageProvider).clearLegacyCredentials();

    final biometricAvailable = await _biometricService.isDeviceSupported();
    final biometricEnabled = await _biometricService.isEnabled();

    final isLoggedIn = await _repository.isLoggedIn();
    if (isLoggedIn) {
      final user = await _repository.getSavedUser();
      if (user != null) {
        state = AuthState(
          user: user,
          isAuthenticated: true,
          biometricAvailable: biometricAvailable,
          biometricEnabled: biometricEnabled,
          mustChangePassword: user.mustChangePassword,
        );
        ref.read(filterProvider.notifier).loadFilters();
        return;
      }
    }

    /*
     * No live session. The sign-in screen takes it from here.
     *
     * This used to try to re-mint one by replaying a stored password, which is why the password was
     * being stored at all. It is not stored any more: what somebody has instead is the PIN — held
     * by the server, offered by this handset — and the sign-in screen asks for it.
     */
    state = AuthState(
      biometricAvailable: biometricAvailable,
      biometricEnabled: biometricEnabled,
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
        mustChangePassword: response.data!.mustChangePassword,
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

  /// Signs in with the PIN this handset holds.
  Future<PinSignIn> loginWithPin(String pin) async {
    state = state.copyWith(isLoading: true, error: null);

    final username = await _repository.rememberedUsername();
    if (username == null || username.isEmpty) {
      state = state.copyWith(isLoading: false);
      return const PinSignIn.failed(
        'This phone does not know whose account to open. Sign in with your username once.',
        usePasswordInstead: true,
      );
    }

    final result = await _repository.loginWithPin(username, pin);
    if (result.signedIn) {
      state = AuthState(
        user: result.user,
        isAuthenticated: true,
        biometricAvailable: state.biometricAvailable,
        biometricEnabled: state.biometricEnabled,
        mustChangePassword: result.user?.mustChangePassword ?? false,
      );
      ref.read(filterProvider.notifier).loadFilters();
      return result;
    }

    state = state.copyWith(isLoading: false, error: result.message);
    return result;
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
          mustChangePassword: user.mustChangePassword,
        );
        ref.read(filterProvider.notifier).loadFilters();
        return true;
      }
    }

    /*
     * The fingerprint proved the holder. What it unlocks is the session already here.
     *
     * The refresh token is in the keystore either way; with this on, using it costs a fingerprint.
     * That is the whole of what a biometric does — it never was a credential, and the old code
     * replaying a stored password after the prompt is what made it look like one.
     */
    final response = await _repository.me();
    if (response.isSuccess && response.data != null) {
      state = AuthState(
        user: response.data,
        isAuthenticated: true,
        biometricAvailable: state.biometricAvailable,
        biometricEnabled: true,
        mustChangePassword: response.data!.mustChangePassword,
      );
      ref.read(filterProvider.notifier).loadFilters();
      return true;
    }

    // The refresh token is spent too. Nothing here can mint a session; the sign-in screen can.
    state = AuthState(
      biometricAvailable: state.biometricAvailable,
      biometricEnabled: state.biometricEnabled,
      error: 'That session has ended. Sign in again.',
    );
    return false;
  }

  /// Turning it on costs a successful prompt — a switch that claims a protection the reader cannot
  /// provide is worse than no switch.
  Future<BiometricResult> enableBiometric() async {
    final result = await _biometricService.enable();
    if (result.proved) state = state.copyWith(biometricEnabled: true);
    return result;
  }

  Future<void> disableBiometric() async {
    await _biometricService.disable();
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

  /// Raised by the `004` every call answers with while the flag is set.
  ///
  /// Idempotent on purpose: several requests in flight will each come back with it, and the first
  /// one is enough. Setting it repeatedly would rebuild the router on every reply.
  void passwordChangeRequired() {
    if (state.mustChangePassword) return;
    state = state.copyWith(mustChangePassword: true);
  }

  /// Changes the password and lets the app back in.
  ///
  /// `me()` afterwards rather than trusting the success: the flag lives on the profile, and
  /// re-reading it is what clears it here from the same place that set it. If that read fails the
  /// flag is cleared anyway — the server has accepted the new password, and holding somebody on
  /// the screen after it succeeded would be the worse of the two errors.
  Future<ApiResponse<void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final response = await _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    if (!response.isSuccess) return response;

    final refreshed = await _repository.me();
    state = state.copyWith(
      user: refreshed.isSuccess ? refreshed.data : state.user,
      mustChangePassword: false,
    );
    return response;
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
