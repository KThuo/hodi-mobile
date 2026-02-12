import 'package:dio/dio.dart';
import '../../auth/data/auth_local_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalStorage _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getAccessToken();
    final expiry = await _storage.getTokenExpiry();

    if (token != null && expiry != null) {
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(expiry);
      if (expiryTime.isAfter(DateTime.now())) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }
}
