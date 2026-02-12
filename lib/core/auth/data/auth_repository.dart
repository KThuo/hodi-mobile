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
      final user = UserModel.fromLoginResponse(response.data!);
      final tokenData = response.data!['tokenDetails'] as Map<String, dynamic>? ?? {};
      final token = TokenModel(
        accessToken: tokenData['accessToken']?.toString() ?? '',
        expiry: (tokenData['expiry'] as num?)?.toInt() ?? 0,
      );

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

  Future<ApiResponse<void>> forgotPassword(String username) async {
    return _apiClient.post<void>(
      ApiConstants.forgotPassword,
      data: {'username': username},
    );
  }

  Future<UserModel?> getSavedUser() => _storage.getUser();

  Future<bool> isLoggedIn() => _storage.isTokenValid();

  Future<void> logout() => _storage.clearAll();
}
