import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../domain/user_model.dart';
import '../domain/token_model.dart';

class AuthLocalStorage {
  static const _keyAccessToken = 'access_token';
  static const _keyTokenExpiry = 'token_expiry';
  static const _keyUser = 'user_data';

  final FlutterSecureStorage _storage;

  AuthLocalStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage();

  // Token operations
  Future<void> saveToken(TokenModel token) async {
    await _storage.write(key: _keyAccessToken, value: token.accessToken);
    await _storage.write(key: _keyTokenExpiry, value: token.expiry.toString());
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

  // Clear all
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
