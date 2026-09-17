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
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
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

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  void dispose() {
    _errorController.close();
  }
}
