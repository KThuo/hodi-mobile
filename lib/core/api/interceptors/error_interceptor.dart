import 'dart:async';
import 'package:dio/dio.dart';
import '../api_constants.dart';

class ApiError {
  final String status;
  final String message;

  const ApiError({required this.status, required this.message});
}

class ErrorInterceptor extends Interceptor {
  final StreamController<ApiError> _errorController = StreamController<ApiError>.broadcast();

  Stream<ApiError> get errorStream => _errorController.stream;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _inspect(response.data);
    handler.next(response);
  }

  /// The same envelope, arriving as a failure.
  ///
  /// These codes travel in the body, and the body comes back on a 4xx as readily as on a 200 —
  /// `PasswordChangeGate` and the session checks both refuse with a status line *and* an envelope.
  /// Inspecting only successful responses meant a `003` or `004` delivered with a 401 or 403 was
  /// never noticed: the session was never cleared and the password gate never fired, so the app
  /// sat there showing whatever the screen made of a generic failure.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _inspect(err.response?.data);
    handler.next(err);
  }

  void _inspect(dynamic body) {
    if (body is Map) {
      final data = body;
      final status = data['status']?.toString();

      if (status == ApiConstants.statusTokenExpired) {
        _errorController.add(ApiError(
          status: status!,
          message: data['message']?.toString() ?? 'Session expired',
        ));
      } else if (status == ApiConstants.statusOverdueEstate) {
        _errorController.add(ApiError(
          status: status!,
          message: data['message']?.toString() ?? 'Estate overdue',
        ));
      } else if (status == ApiConstants.statusMustChangePassword) {
        /*
         * Every call answers with this until the password is changed, so it has to be acted on
         * rather than shown.
         *
         * It was declared and never read: the app surfaced a generic failure on whatever screen
         * happened to be open, signing out and in again made no difference, and there was no
         * change-password screen to reach. The listener routes to one.
         */
        _errorController.add(ApiError(
          status: status!,
          message: data['message']?.toString() ??
              'Your password must be changed before you can continue.',
        ));
      }
    }
  }

  void dispose() {
    _errorController.close();
  }
}
