import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/tenant_report_model.dart';

/// Reports.
///
/// Reading only. `/export` returns a spreadsheet, and a phone is not where somebody builds one —
/// the browser has that button and this app does not pretend to.
class ReportRepository {
  final ApiClient _apiClient;

  ReportRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Where every tenancy stands.
  ///
  /// [lens] is `OWING`, `CREDIT`, `CLEAR`, or null for everybody, and the controller's own note
  /// says why it matters: *four hundred tenancies is not a decision, "who owes, oldest first"
  /// is.* So the screen leads with the lens rather than with a list.
  Future<ApiResponse<TenantReportPageModel>> tenants({
    int page = 0,
    int pageSize = 20,
    String? lens,
    String? estateId,
    String? propertyId,
    String? searchTerm,
    String? sort,
    bool desc = false,
  }) async {
    return _apiClient.get<TenantReportPageModel>(
      ApiConstants.tenantReports,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'lens': ?lens,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'sort': ?sort,
        if (desc) 'desc': true,
      },
      fromJsonT: (data) =>
          TenantReportPageModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
