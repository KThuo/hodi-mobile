import '../../api/api_client.dart';
import '../../api/api_constants.dart';
import '../../api/api_response.dart';
import '../domain/user_model.dart';
import '../domain/token_model.dart';
import '../../device/device_id.dart';
import 'auth_local_storage.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final AuthLocalStorage _storage;
  final DeviceId _device;

  AuthRepository({
    required ApiClient apiClient,
    required AuthLocalStorage storage,
    required DeviceId device,
  })  : _apiClient = apiClient,
        _storage = storage,
        _device = device;

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

      await _keep(token, user, username);

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

  /// Signs in with the PIN this handset holds.
  ///
  /// The username is still sent, from what was remembered — a PIN says nothing on its own about
  /// whose account it is. Nobody types it, which is the point.
  ///
  /// A failure here is not always "wrong digits": the server distinguishes a handset with no PIN and
  /// one whose PIN was switched off after five wrong tries, and both mean **fall back to the
  /// password** rather than try again. [PinSignIn.usePasswordInstead] is that distinction, and the
  /// local flag is cleared with it so the keypad stops being offered.
  Future<PinSignIn> loginWithPin(String username, String pin) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.loginWithPin,
      data: {
        'username': username,
        'pin': pin,
        'deviceId': await _device.get(),
      },
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    if (response.isSuccess && response.data != null) {
      final body = response.data!;
      final user = UserModel.fromMe(body['user'] as Map<String, dynamic>? ?? const {});
      await _keep(TokenModel.fromAuthResponse(body), user, username);
      return PinSignIn.ok(user);
    }

    final message = response.message;
    final spent = message.contains('No PIN is set') || message.contains('switched off');
    if (spent) await _storage.setPinSet(false);
    return PinSignIn.failed(
      message.isNotEmpty ? message : 'That PIN was not accepted.',
      usePasswordInstead: spent,
    );
  }

  /// Sets or replaces the PIN on this handset. Costs the account password.
  Future<ApiResponse<void>> setPin({
    required String currentPassword,
    required String pin,
    String? deviceLabel,
  }) async {
    final response = await _apiClient.post<void>(
      ApiConstants.pin,
      data: {
        'currentPassword': currentPassword,
        'pin': pin,
        'deviceId': await _device.get(),
        if (deviceLabel != null && deviceLabel.isNotEmpty) 'deviceLabel': deviceLabel,
      },
    );
    if (response.isSuccess) await _storage.setPinSet(true);
    return response;
  }

  /// Rotates it, proved with the current one.
  ///
  /// A wrong answer here counts toward the same five tries the sign-in screen has — the server has
  /// no endpoint whose job is to check a PIN, precisely so that this cannot be used as one.
  Future<ApiResponse<void>> changePin({
    required String currentPin,
    required String pin,
  }) async {
    return _apiClient.post<void>(
      ApiConstants.changePin,
      data: {
        'currentPin': currentPin,
        'pin': pin,
        'deviceId': await _device.get(),
      },
    );
  }

  /// Takes it off. The password, not the PIN — the person doing this has usually forgotten the PIN.
  ///
  /// [everywhere] reaches handsets that are no longer in their hand, which is the case somebody
  /// needs when a phone is lost and the only one they cannot solve from the phone itself.
  Future<ApiResponse<void>> removePin({
    required String currentPassword,
    bool everywhere = false,
  }) async {
    final response = await _apiClient.post<void>(
      ApiConstants.removePin,
      data: {
        'currentPassword': currentPassword,
        if (!everywhere) 'deviceId': await _device.get(),
      },
    );
    if (response.isSuccess) await _storage.setPinSet(false);
    return response;
  }

  /// One session, kept in the three places that need it.
  Future<void> _keep(TokenModel token, UserModel user, String username) async {
    await _storage.saveToken(token);
    await _storage.saveUser(user);
    await _storage.rememberUsername(username);
    await _storage.setPinSet(user.pinSet);
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

  /// Who signed in last, so the sign-in screen asks only for what proves them.
  Future<String?> rememberedUsername() => _storage.rememberedUsername();

  /// Whether this handset can offer a PIN. The server's answer, cached for the first frame.
  Future<bool> isPinSet() => _storage.isPinSet();

  /// Forgets who was here — for "not you?" on the sign-in screen.
  Future<void> forgetUsername() => _storage.forgetUsername();
}

/// What came of offering a PIN.
///
/// Three outcomes, not two. "Wrong digits" means try again; "no PIN on this phone" and "switched
/// off after too many tries" both mean stop offering the keypad and ask for the password — and an
/// app that could not tell them apart would leave somebody tapping at a pad that can never work.
class PinSignIn {
  const PinSignIn.ok(this.user)
      : signedIn = true,
        message = null,
        usePasswordInstead = false;

  const PinSignIn.failed(this.message, {this.usePasswordInstead = false})
      : signedIn = false,
        user = null;

  final bool signedIn;
  final UserModel? user;
  final String? message;

  /// The PIN is not a way in on this handset any more. Show the password field.
  final bool usePasswordInstead;
}
