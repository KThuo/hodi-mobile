import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../domain/user_model.dart';
import '../domain/token_model.dart';

class AuthLocalStorage {
  static const _keyAccessToken = 'access_token';
  static const _keyTokenExpiry = 'token_expiry';
  static const _keyUser = 'user_data';
  static const _keyBiometricEnabled = 'biometric_enabled';
  static const _keyBiometricUsername = 'biometric_username';
  static const _keyBiometricPassword = 'biometric_password';

  final FlutterSecureStorage _storage;

  AuthLocalStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage();

  // Token operations
  Future<void> saveToken(TokenModel token) async {
    await _storage.write(key: _keyAccessToken, value: token.accessToken);
    await _storage.write(key: _keyTokenExpiry, value: token.expiry.toString());
  }

  Future<void> saveTokenRaw(String accessToken, int expiryMs) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyTokenExpiry, value: expiryMs.toString());
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: _keyAccessToken);
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

  // Biometric operations
  Future<void> saveBiometricCredentials(String username, String password) async {
    await _storage.write(key: _keyBiometricUsername, value: username);
    await _storage.write(key: _keyBiometricPassword, value: password);
    await _storage.write(key: _keyBiometricEnabled, value: 'true');
  }

  Future<({String username, String password})?> getBiometricCredentials() async {
    final username = await _storage.read(key: _keyBiometricUsername);
    final password = await _storage.read(key: _keyBiometricPassword);
    if (username == null || password == null) return null;
    return (username: username, password: password);
  }

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometricEnabled);
    return value == 'true';
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _keyBiometricEnabled, value: enabled.toString());
  }

  Future<void> clearBiometricData() async {
    await _storage.delete(key: _keyBiometricEnabled);
    await _storage.delete(key: _keyBiometricUsername);
    await _storage.delete(key: _keyBiometricPassword);
  }

  /// Clears session data (token + user) but preserves biometric credentials.
  Future<void> clearSession() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyTokenExpiry);
    await _storage.delete(key: _keyUser);
  }

  /// Clears everything including biometric credentials (used on explicit logout).
  Future<void> clearAll() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyTokenExpiry);
    await _storage.delete(key: _keyUser);
    await _storage.delete(key: _keyBiometricEnabled);
    await _storage.delete(key: _keyBiometricUsername);
    await _storage.delete(key: _keyBiometricPassword);
  }
}
