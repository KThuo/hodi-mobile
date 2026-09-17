import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/property_model.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';

class PropertyRepository {
  final ApiClient _apiClient;

  PropertyRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<PropertyModel>>> getProperties({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<PropertyModel>>(
      ApiConstants.properties,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PropertyModel.fromJson(item),
      ),
    );
  }

  /// The property itself — what it is, who to call, how it is set up.
  ///
  /// No `period` parameter. It used to take one, to move a set of money columns backwards and
  /// forwards a month; the rebuilt endpoint has neither the parameter nor the columns, because a
  /// property's month is a report. See [getPropertyReport].
  Future<ApiResponse<PropertyDetailModel>> getPropertyDetail(String id) async {
    return _apiClient.get<PropertyDetailModel>(
      '${ApiConstants.properties}/$id',
      fromJsonT: (data) =>
          PropertyDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// One property's month.
  ///
  /// Behind `ROLE_REPORT_VIEW`, which is a narrower gate than the property page itself — a
  /// caretaker can be allowed to see the block without being allowed to see what it collects. The
  /// caller checks the authority before asking; this returns the server's refusal otherwise.
  ///
  /// Omitting [year] and [month] asks for the month just ended, which is what the report opens on:
  /// a report of a month three days in is a report of three days.
  Future<ApiResponse<PropertyReportModel?>> getPropertyReport({
    required String propertyId,
    int? year,
    int? month,
  }) async {
    return _apiClient.get<PropertyReportModel?>(
      ApiConstants.propertyReports,
      queryParameters: {
        'propertyId': propertyId,
        'year': ?year,
        'month': ?month,
        'page': 0,
        'pageSize': 1,
      },
      fromJsonT: (data) {
        final rows = (data as Map<String, dynamic>)['content'] as List?;
        if (rows == null || rows.isEmpty) return null;
        return PropertyReportModel.fromJson(rows.first as Map<String, dynamic>);
      },
    );
  }
}
