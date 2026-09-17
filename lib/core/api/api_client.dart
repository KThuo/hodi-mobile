import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_constants.dart';
import 'api_response.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import '../auth/data/auth_local_storage.dart';
import '../device/device_id.dart';

class ApiClient {
  late final Dio _dio;
  late final ErrorInterceptor _errorInterceptor;

  ApiClient({required AuthLocalStorage storage, required DeviceId device}) {
    _errorInterceptor = ErrorInterceptor();

    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.addAll([
      AuthInterceptor(storage, device),
      _errorInterceptor,
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          logPrint: (obj) => developer.log(obj.toString(), name: 'API'),
        ),
    ]);
  }

  Dio get dio => _dio;
  Stream<ApiError> get errorStream => _errorInterceptor.errorStream;

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJsonT,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      // Some endpoints return a raw list (e.g. house-features) instead of
      // the standard {status, message, data} envelope.
      if (response.data is List) {
        return ApiResponse<T>(
          status: '00',
          message: '',
          data: fromJsonT != null ? fromJsonT(response.data) : response.data as T?,
        );
      }
      return ApiResponse.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      developer.log('GET $path failed: ${e.response?.statusCode} ${e.response?.data}',
          name: 'API', level: 1000);
      return _fromError<T>(e);
    } catch (e, stack) {
      developer.log('GET $path parse error: $e', name: 'API', level: 1000, stackTrace: stack);
      return ApiResponse<T>(
        status: '01',
        message: 'Failed to parse response',
      );
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJsonT,
  }) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return ApiResponse.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      developer.log('POST $path failed: ${e.response?.statusCode} ${e.response?.data}',
          name: 'API', level: 1000);
      return _fromError<T>(e);
    } catch (e, stack) {
      developer.log('POST $path parse error: $e', name: 'API', level: 1000, stackTrace: stack);
      return ApiResponse<T>(
        status: '01',
        message: 'Failed to parse response',
      );
    }
  }

  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJsonT,
  }) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return ApiResponse.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      developer.log('PUT $path failed: ${e.response?.statusCode} ${e.response?.data}',
          name: 'API', level: 1000);
      return _fromError<T>(e);
    } catch (e, stack) {
      developer.log('PUT $path parse error: $e', name: 'API', level: 1000, stackTrace: stack);
      return ApiResponse<T>(
        status: '01',
        message: 'Failed to parse response',
      );
    }
  }

  Future<Response> downloadFile(String path, String savePath) async {
    return _dio.download(path, savePath);
  }

  Future<Response> uploadFile(
    String path, {
    required FormData data,
  }) async {
    return _dio.post(path, data: data);
  }

  /// Turns a failed request into the answer the server actually gave.
  ///
  /// ## The server explains itself; this used to throw that away
  ///
  /// Dio raises a [DioException] for every non-2xx, and the old code answered all of them with
  /// "Server error. Please try again later." But `ApiExceptionHandler` returns a full
  /// `{status, message, data}` body on 400, 404 and 500 alike — "Your password is wrong", "That
  /// PIN is one of the first anybody would guess", the summary of a validation failure — and none
  /// of it ever reached a screen.
  ///
  /// So every refusal looked like an outage. A PIN that could not be changed because the current
  /// one was wrong, a payment declined by the gateway with a reason, and a genuine 500 were three
  /// different problems wearing one sentence, and the sentence told somebody to try again later
  /// when trying again would never work.
  ///
  /// The envelope's own `status` comes back too, so a `003` or `004` arriving as a 4xx is still
  /// the code the rest of the app tests for rather than a generic '01'.
  ApiResponse<T> _fromError<T>(DioException e) {
    final body = e.response?.data;
    if (body is Map) {
      final message = body['message']?.toString();
      if (message != null && message.trim().isNotEmpty) {
        return ApiResponse<T>(
          status: body['status']?.toString() ?? ApiConstants.statusError,
          message: message,
        );
      }
    }
    return ApiResponse<T>(status: ApiConstants.statusError, message: _fallbackMessage(e));
  }

  /// What to say when the server said nothing useful — a timeout, a dropped connection, or a
  /// response with no envelope in it (a proxy's error page, a tunnel interstitial).
  String _fallbackMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        // Distinguished because they call for different things from the person reading them:
        // signing in again, asking for access, checking the address, or waiting.
        if (code == 401) return 'Your session has ended. Sign in again.';
        if (code == 403) return 'You do not have permission to do that.';
        if (code == 404) return 'That was not found.';
        if (code != null && code >= 500) {
          return 'The server could not complete that. Please try again later.';
        }
        return 'That request was refused.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  void dispose() {
    _errorInterceptor.dispose();
  }
}

final authLocalStorageProvider = Provider<AuthLocalStorage>((ref) {
  return AuthLocalStorage();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final storage = ref.watch(authLocalStorageProvider);
  return ApiClient(storage: storage, device: ref.watch(deviceIdProvider));
});
