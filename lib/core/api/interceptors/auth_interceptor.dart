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

  /*
   * Everything here is wrapped, and `handler.next` is reached on every path.
   *
   * This is a QueuedInterceptor: Dio runs one request's `onRequest` at a time and advances the
   * queue only when the handler is called. `onRequest` returns void, so an exception thrown in
   * here is an unhandled async error that Dio never sees — the handler is never called, the queue
   * never advances, and **every subsequent request hangs forever**. No timeout fires either,
   * because the request was never sent. The screen sits on its loading state for good.
   *
   * That is not hypothetical: every await below touches the platform keystore, and
   * flutter_secure_storage throws on Android when the keystore has been invalidated — an OS
   * upgrade, or app data restored from a backup. One such throw, at any point in a session, and
   * the app stops talking to the server until it is killed.
   *
   * So the headers are best-effort. A request that goes out without an Authorization header comes
   * back 401 and is handled; a request that never goes out is a screen nobody can leave.
   */
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      await _attachAuthorization(options);
    } catch (e) {
      developer.log('Could not read the stored session: $e',
          name: 'AuthInterceptor', level: 900);
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
     * Not a credential, and the server does not treat it as one — what makes a PIN row
     * trustworthy is that the account password created it. Which is also why a request may go
     * out without it: the worst case is being told this handset has no PIN.
     */
    try {
      options.headers[ApiConstants.deviceHeader] = await _device.get();
    } catch (e) {
      developer.log('Could not read the device id: $e',
          name: 'AuthInterceptor', level: 900);
    }

    handler.next(options);
  }

  Future<void> _attachAuthorization(RequestOptions options) async {
    final token = await _storage.getAccessToken();
    final expiry = await _storage.getTokenExpiry();
    if (token == null || expiry == null) return;

    final expiryTime = DateTime.fromMillisecondsSinceEpoch(expiry);
    final secondsUntilExpiry = expiryTime.difference(DateTime.now()).inSeconds;

    if (secondsUntilExpiry > _refreshBufferSeconds) {
      // Token still has plenty of time — use as-is.
      options.headers['Authorization'] = 'Bearer $token';
    } else if (secondsUntilExpiry > 0) {
      // Token is about to expire — proactively refresh.
      options.headers['Authorization'] = 'Bearer ${await _tryRefreshToken(token)}';
    } else {
      // Token already expired — attach anyway, the 003 fallback will handle it.
      options.headers['Authorization'] = 'Bearer $token';
    }
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
