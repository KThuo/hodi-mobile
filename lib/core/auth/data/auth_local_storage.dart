import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../domain/user_model.dart';
import '../domain/token_model.dart';

/// What this handset keeps between sessions.
///
/// ## The password is no longer one of them
///
/// "Biometric login" used to mean: store the username and the **password in plain text**, and replay
/// them after a fingerprint. That put a reusable credential for the whole account — the web included
/// — inside the app's storage, to save one screen of typing. A keystore is good, but it is not a
/// reason to hold something that never had to be held.
///
/// What replaces it is honest about what each piece does:
///
/// - **A fingerprint proves the holder**, and guards the refresh token that is already here either
///   way. Per device, because "should this phone unlock with this finger" is not a question another
///   phone can inherit an answer to.
/// - **A PIN is a credential**, and lives on the server as a hash in a row naming this handset.
///   Nothing about it is stored here but the fact that one exists.
/// - **The username is remembered** so nobody retypes it, which is all it was ever doing.
///
/// [clearLegacyCredentials] deletes what older builds wrote. It runs on every start rather than once,
/// because a build that never runs it is a build that leaves the password behind.
class AuthLocalStorage {
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyTokenExpiry = 'token_expiry';
  static const _keyUser = 'user_data';
  static const _keyBiometricEnabled = 'biometric_enabled';

  /// Who signed in last, so the sign-in screen does not ask again. Not a credential.
  static const _keyRememberedUsername = 'remembered_username';

  /// Whether the server said this handset holds a PIN, so the keypad can be drawn on the first
  /// frame rather than after a round trip.
  static const _keyPinSet = 'pin_set';

  /// Written by builds before the PIN existed. Read only to be deleted.
  static const _legacyBiometricUsername = 'biometric_username';
  static const _legacyBiometricPassword = 'biometric_password';

  final FlutterSecureStorage _storage;

  AuthLocalStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage();

  // Token operations
  Future<void> saveToken(TokenModel token) async {
    await _storage.write(key: _keyAccessToken, value: token.accessToken);
    await _storage.write(key: _keyRefreshToken, value: token.refreshToken);
    await _storage.write(key: _keyTokenExpiry, value: token.expiresAt.toString());
  }

  Future<void> saveTokenRaw(String accessToken, String refreshToken, int expiresAt) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
    await _storage.write(key: _keyTokenExpiry, value: expiresAt.toString());
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: _keyAccessToken);
  }

  /// The credential that outlives the access token — and the one biometric unlock should guard.
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _keyRefreshToken);
  }

  Future<int?> getTokenExpiry() async {
    final expiry = await _storage.read(key: _keyTokenExpiry);
    return expiry != null ? int.tryParse(expiry) : null;
  }

  Future<bool> isTokenValid() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) return false;
    return DateTime.fromMillisecondsSinceEpoch(expiry).isAfter(DateTime.now());
  }

  // User operations
  Future<void> saveUser(UserModel user) async {
    await _storage.write(key: _keyUser, value: jsonEncode(user.toJson()));
  }

  Future<UserModel?> getUser() async {
    final data = await _storage.read(key: _keyUser);
    if (data == null) return null;
    return UserModel.fromJson(jsonDecode(data));
  }

  // ── Who signed in last ──────────────────────────────────────────────────

  /// Remembered so the sign-in screen can greet somebody by name and ask only for what proves them.
  Future<void> rememberUsername(String username) async {
    await _storage.write(key: _keyRememberedUsername, value: username);
  }

  Future<String?> rememberedUsername() => _storage.read(key: _keyRememberedUsername);

  Future<void> forgetUsername() async {
    await _storage.delete(key: _keyRememberedUsername);
    await _storage.delete(key: _keyPinSet);
  }

  // ── Whether this handset holds a PIN ────────────────────────────────────

  /// The server's answer, cached only so the first frame is right.
  ///
  /// Never trusted over the server: a PIN can be removed from another phone, or spend its five
  /// tries, and this flag would not know. Every `/me` and every sign-in re-states it.
  Future<void> setPinSet(bool set) async {
    await _storage.write(key: _keyPinSet, value: set.toString());
  }

  Future<bool> isPinSet() async => (await _storage.read(key: _keyPinSet)) == 'true';

  // ── Biometrics: a preference, not a credential ──────────────────────────

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometricEnabled);
    return value == 'true';
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _keyBiometricEnabled, value: enabled.toString());
  }

  Future<void> clearBiometricData() async {
    await _storage.delete(key: _keyBiometricEnabled);
  }

  /// Deletes what older builds stored: the account password, in plain text, and the username beside
  /// it. Called on every start — a build that skips it is a build that leaves the password behind.
  Future<void> clearLegacyCredentials() async {
    await _storage.delete(key: _legacyBiometricUsername);
    await _storage.delete(key: _legacyBiometricPassword);
  }

  /// Ends the session, and keeps what is not part of it.
  ///
  /// The remembered username and the PIN survive on purpose: a session that timed out is not
  /// somebody saying "forget me", and making them retype a username and set a new PIN would be this
  /// app's answer to twenty minutes of inactivity.
  Future<void> clearSession() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyTokenExpiry);
    await _storage.delete(key: _keyUser);
  }

  /// Signing out on purpose. Takes the biometric preference with it, and forgets who was here.
  ///
  /// The PIN itself is on the server and is deliberately **not** removed: signing out is not the
  /// same as giving up the shortcut, and somebody who wants it gone says so on the profile screen,
  /// where it costs the password.
  Future<void> clearAll() async {
    await clearSession();
    await _storage.delete(key: _keyBiometricEnabled);
    await _storage.delete(key: _keyRememberedUsername);
    await _storage.delete(key: _keyPinSet);
    await clearLegacyCredentials();
  }
}
