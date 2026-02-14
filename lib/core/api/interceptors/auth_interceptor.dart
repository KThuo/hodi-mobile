import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import '../api_constants.dart';
import '../../auth/data/auth_local_storage.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthLocalStorage _storage;

  /// Bare Dio instance for refresh calls — no interceptors to avoid recursion.
  late final Dio _refreshDio;

  static const _refreshBufferSeconds = 20;

  AuthInterceptor(this._storage) {
    _refreshDio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getAccessToken();
    final expiry = await _storage.getTokenExpiry();

    if (token != null && expiry != null) {
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(expiry);
      final now = DateTime.now();
      final secondsUntilExpiry = expiryTime.difference(now).inSeconds;

      if (secondsUntilExpiry > _refreshBufferSeconds) {
        // Token still has plenty of time — use as-is.
        options.headers['Authorization'] = 'Bearer $token';
      } else if (secondsUntilExpiry > 0) {
        // Token is about to expire — proactively refresh.
        final refreshed = await _tryRefreshToken(token);
        options.headers['Authorization'] = 'Bearer $refreshed';
      } else {
        // Token already expired — attach anyway, 003 fallback will handle it.
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  Future<String> _tryRefreshToken(String currentToken) async {
    try {
      developer.log('Proactively refreshing token', name: 'AuthInterceptor');

      final response = await _refreshDio.post(
        ApiConstants.refreshToken,
        options: Options(
          headers: {'Authorization': 'Bearer $currentToken'},
        ),
      );

      final data = response.data;
      if (data is Map &&
          data['status'] == ApiConstants.statusSuccess &&
          data['data'] is Map) {
        final tokenData = data['data'] as Map;
        final newToken = tokenData['accessToken'] as String;
        final newExpiry = tokenData['expiry'] as int;

        await _storage.saveTokenRaw(newToken, newExpiry);
        developer.log('Token refreshed successfully', name: 'AuthInterceptor');
        return newToken;
      }
    } catch (e) {
      developer.log('Token refresh failed: $e', name: 'AuthInterceptor');
    }

    // Refresh failed — return old token; 003 fallback will handle expiry.
    return currentToken;
  }
}
