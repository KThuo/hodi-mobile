class PagedRequest {
  final int page;
  final int pageSize;
  final String? searchTerm;
  final String? startDate;
  final String? endDate;
  final String? estateId;
  final String? propertyId;
  final String? houseId;
  final String? status;
  final String? month;
  final String? year;

  const PagedRequest({
    this.page = 0,
    this.pageSize = 20,
    this.searchTerm,
    this.startDate,
    this.endDate,
    this.estateId,
    this.propertyId,
    this.houseId,
    this.status,
    this.month,
    this.year,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
    };
    if (searchTerm != null && searchTerm!.isNotEmpty) params['searchTerm'] = searchTerm;
    if (startDate != null) params['startDate'] = startDate;
    if (endDate != null) params['endDate'] = endDate;
    if (estateId != null) params['estateId'] = estateId;
    if (propertyId != null) params['propertyId'] = propertyId;
    if (houseId != null) params['houseId'] = houseId;
    if (status != null) params['status'] = status;
    if (month != null) params['month'] = month;
    if (year != null) params['year'] = year;
    return params;
  }

  PagedRequest copyWith({
    int? page,
    int? pageSize,
    String? searchTerm,
    String? startDate,
    String? endDate,
    String? estateId,
    String? propertyId,
    String? houseId,
    String? status,
    String? month,
    String? year,
  }) {
    return PagedRequest(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      searchTerm: searchTerm ?? this.searchTerm,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      estateId: estateId ?? this.estateId,
      propertyId: propertyId ?? this.propertyId,
      houseId: houseId ?? this.houseId,
      status: status ?? this.status,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }
}
