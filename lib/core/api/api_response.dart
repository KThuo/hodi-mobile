class ApiResponse<T> {
  final String status;
  final String message;
  final T? data;

  const ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  bool get isSuccess => status == '00';
  bool get isError => status == '01';
  bool get isTokenExpired => status == '003';
  bool get isEstateOverdue => status == '002';

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    // Paginated responses come without a {status, message, data} wrapper.
    // Detect them by the presence of `numberOfElements`.
    if (json.containsKey('numberOfElements')) {
      return ApiResponse<T>(
        status: '00',
        message: '',
        data: fromJsonT != null ? fromJsonT(json) : null,
      );
    }

    // Some endpoints (e.g. dashboard table-data) wrap data in {"content": {...}}
    // without the standard {status, message, data} envelope.
    if (json.containsKey('content') &&
        json['content'] is Map<String, dynamic> &&
        !json.containsKey('status')) {
      return ApiResponse<T>(
        status: '00',
        message: '',
        data: fromJsonT != null
            ? fromJsonT(json['content'])
            : null,
      );
    }

    // Raw object response (e.g. house detail) — the response body is the
    // domain object itself without the standard {status, message, data}
    // envelope. The standard envelope always has both 'message' and 'data'.
    if (!json.containsKey('message') && !json.containsKey('data')) {
      return ApiResponse<T>(
        status: '00',
        message: '',
        data: fromJsonT != null ? fromJsonT(json) : null,
      );
    }

    return ApiResponse<T>(
      status: json['status']?.toString() ?? '01',
      message: json['message']?.toString() ?? '',
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'] as T?,
    );
  }
}
