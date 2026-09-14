import '../../api/api_client.dart';
import '../../api/api_constants.dart';
import '../../api/api_response.dart';
import '../domain/user_model.dart';
import '../domain/token_model.dart';
import 'auth_local_storage.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final AuthLocalStorage _storage;

  AuthRepository({
    required ApiClient apiClient,
    required AuthLocalStorage storage,
  })  : _apiClient = apiClient,
        _storage = storage;

  Future<ApiResponse<UserModel>> login(String username, String password) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: {'username': username, 'password': password},
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    if (response.isSuccess && response.data != null) {
      // One flat object now. Legacy nested the two halves under `userDetails` and `tokenDetails`;
      // the rebuilt `LoginResponse` carries the tokens at the top level with the profile under
      // `user`, and states a lifetime in seconds rather than an absolute expiry.
      final body = response.data!;
      final user = UserModel.fromMe(body['user'] as Map<String, dynamic>? ?? const {});
      final token = TokenModel.fromAuthResponse(body);

      await _storage.saveToken(token);
      await _storage.saveUser(user);

      return ApiResponse<UserModel>(
        status: response.status,
        message: response.message,
        data: user,
      );
    }

    return ApiResponse<UserModel>(
      status: response.status,
      message: response.message,
    );
  }

  Future<ApiResponse<void>> deleteAccount(String username, String password) async {
    return _apiClient.post<void>(
      ApiConstants.deleteAccount,
      data: {'username': username, 'password': password},
    );
  }

  Future<ApiResponse<void>> forgotPassword(String email) async {
    return _apiClient.post<void>(
      ApiConstants.forgotPassword,
      data: {'email': email},
    );
  }

  /// The caller's own profile, resolved fresh.
  ///
  /// Worth calling on resume rather than trusting what was stored: authorities come from the
  /// database rather than the token, so somebody's permissions changing is visible on the next
  /// reload instead of at their next sign-in.
  Future<ApiResponse<UserModel>> me() async {
    final response = await _apiClient.get<UserModel>(
      ApiConstants.me,
      fromJsonT: (data) => UserModel.fromMe(data as Map<String, dynamic>),
    );
    if (response.isSuccess && response.data != null) {
      await _storage.saveUser(response.data!);
    }
    return response;
  }

  /// Ends the session at the server as well as here.
  ///
  /// The refresh token is what actually ends it — revoking the family is what stops a stolen token
  /// being exchanged — so it is sent rather than merely deleted. The access token then dies on its
  /// own inside its TTL.
  Future<void> signOut() async {
    final refresh = await _storage.getRefreshToken();
    if (refresh != null && refresh.isNotEmpty) {
      await _apiClient.post<void>(ApiConstants.logout, data: {'refreshToken': refresh});
    }
    await _storage.clearAll();
  }

  Future<UserModel?> getSavedUser() => _storage.getUser();

  Future<bool> isLoggedIn() => _storage.isTokenValid();

  Future<void> logout() => _storage.clearAll();

  /// Clears session (token/user) but preserves biometric credentials.
  Future<void> clearSession() => _storage.clearSession();

  Future<bool> isBiometricEnabled() => _storage.isBiometricEnabled();
}
