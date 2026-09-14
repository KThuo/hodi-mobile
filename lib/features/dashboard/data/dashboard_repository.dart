import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../payments/domain/payment_model.dart';
import '../domain/dashboard_summary.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<DashboardSummary>> getOverallSummary({
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<DashboardSummary>(
      ApiConstants.dashboardMonthly,
      queryParameters: {
        'status': '2',
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => DashboardSummary.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<DashboardSummary>> getMonthlySummary({
    String? estateId,
    String? propertyId,
    String? month,
    String? year,
  }) async {
    return _apiClient.get<DashboardSummary>(
      ApiConstants.dashboardMonthly,
      queryParameters: {
        'status': '4',
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'month': ?month,
        'year': ?year,
      },
      fromJsonT: (data) => DashboardSummary.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<PagedResponse<PaymentModel>>> getCollections({
    required String startDate,
    required String endDate,
    String? searchTerm,
    bool isTenant = false,
  }) async {
    return _apiClient.get<PagedResponse<PaymentModel>>(
      ApiConstants.payments,
      queryParameters: {
        'page': 0,
        'pageSize': 100,
        'startDate': startDate,
        'endDate': endDate,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        if (isTenant) 'self': 'true',
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }
}
