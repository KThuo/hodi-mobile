import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import '../api_constants.dart';
import '../../auth/data/auth_local_storage.dart';
import '../../device/device_id.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthLocalStorage _storage;
  final DeviceId _device;

  /// Bare Dio instance for refresh calls — no interceptors to avoid recursion.
  late final Dio _refreshDio;

  static const _refreshBufferSeconds = 20;

  AuthInterceptor(this._storage, this._device) {
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

    options.headers[ApiConstants.clientHeader] = ApiConstants.clientMobile;

    /*
     * Which handset this is.
     *
     * On every request, not only the PIN ones: `/me` answers `pinSet` per device, and the sign-in
     * screen draws a keypad or a password field from that answer. A request that forgot to say
     * which phone it came from would be told there is no PIN here, and the keypad would quietly
     * stop appearing.
     *
     * Not a credential, and the server does not treat it as one — what makes a PIN row trustworthy
     * is that the account password created it.
     */
    options.headers[ApiConstants.deviceHeader] = await _device.get();

    handler.next(options);
  }

  /// Exchanges the refresh token for a fresh pair.
  ///
  /// ## Two things changed from legacy
  ///
  /// Legacy refreshed by posting the **access** token back as a bearer, which meant an expired
  /// session could not be refreshed at all — the thing you needed to present was the thing that had
  /// died. The rebuilt endpoint takes the **refresh** token in the body and is public, so it works
  /// precisely when the access token no longer does.
  ///
  /// It also rotates: the response carries a new refresh token as well as a new access token, and
  /// storing only half of the pair would leave the next refresh presenting a token the server has
  /// already retired.
  Future<String> _tryRefreshToken(String currentToken) async {
    try {
      final refresh = await _storage.getRefreshToken();
      if (refresh == null || refresh.isEmpty) return currentToken;

      developer.log('Proactively refreshing token', name: 'AuthInterceptor');

      final response = await _refreshDio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refresh},
      );

      final data = response.data;
      if (data is Map &&
          data['status'] == ApiConstants.statusSuccess &&
          data['data'] is Map) {
        final body = Map<String, dynamic>.from(data['data'] as Map);
        final newToken = body['accessToken']?.toString() ?? '';
        final newRefresh = body['refreshToken']?.toString() ?? refresh;
        final seconds = (body['expiresIn'] as num?)?.toInt() ?? 0;
        if (newToken.isEmpty) return currentToken;

        await _storage.saveTokenRaw(
          newToken,
          newRefresh,
          DateTime.now().millisecondsSinceEpoch + seconds * 1000,
        );
        developer.log('Token refreshed successfully', name: 'AuthInterceptor');
        return newToken;
      }
    } catch (e) {
      developer.log('Token refresh failed: $e', name: 'AuthInterceptor');
    }

    // Refresh failed — return old token; the 003 fallback will handle expiry.
    return currentToken;
  }
}
