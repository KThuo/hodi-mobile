class PagedResponse<T> {
  final List<T> content;
  final int page;
  final int totalElements;
  final int pageSize;

  const PagedResponse({
    required this.content,
    required this.page,
    required this.totalElements,
    required this.pageSize,
  });

  bool get hasMore => (page + 1) * pageSize < totalElements;
  int get totalPages => (totalElements / pageSize).ceil();

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final content = (json['content'] as List?)
            ?.map((item) => fromJsonT(item as Map<String, dynamic>))
            .toList() ??
        [];
    return PagedResponse<T>(
      content: content,
      page: (json['number'] as num?)?.toInt() ??
          (json['page'] as num?)?.toInt() ??
          0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      pageSize: (json['size'] as num?)?.toInt() ??
          (json['pageSize'] as num?)?.toInt() ??
          20,
    );
  }

  factory PagedResponse.empty() => const PagedResponse(
        content: [],
        page: 0,
        totalElements: 0,
        pageSize: 20,
      );
}
