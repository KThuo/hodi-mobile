import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_constants.dart';
import 'api_response.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import '../auth/data/auth_local_storage.dart';

class ApiClient {
  late final Dio _dio;
  late final ErrorInterceptor _errorInterceptor;

  ApiClient({required AuthLocalStorage storage}) {
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
      AuthInterceptor(storage),
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
      developer.log('GET $path DioException: $e', name: 'API', level: 1000);
      return ApiResponse<T>(
        status: '01',
        message: _getErrorMessage(e),
      );
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
      developer.log('POST $path DioException: $e', name: 'API', level: 1000);
      return ApiResponse<T>(
        status: '01',
        message: _getErrorMessage(e),
      );
    } catch (e, stack) {
      developer.log('POST $path parse error: $e', name: 'API', level: 1000, stackTrace: stack);
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

  String _getErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
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
  return ApiClient(storage: storage);
});
