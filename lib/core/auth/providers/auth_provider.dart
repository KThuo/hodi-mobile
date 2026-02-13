import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/api_client.dart';
import '../../filters/filter_provider.dart';
import '../data/auth_repository.dart';
import '../domain/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final storage = ref.watch(authLocalStorageProvider);
  return AuthRepository(apiClient: apiClient, storage: storage);
});

class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  AuthRepository get _repository => ref.read(authRepositoryProvider);

  Future<void> checkAuth() async {
    final isLoggedIn = await _repository.isLoggedIn();
    if (isLoggedIn) {
      final user = await _repository.getSavedUser();
      state = AuthState(user: user, isAuthenticated: user != null);
      if (user != null) {
        ref.read(filterProvider.notifier).loadFilters();
      }
    } else {
      state = const AuthState();
    }
  }

  Future<bool> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _repository.login(username, password);

    if (response.isSuccess && response.data != null) {
      state = AuthState(
        user: response.data,
        isAuthenticated: true,
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

  Future<void> logout() async {
    await _repository.logout();
    ref.read(filterProvider.notifier).reset();
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
