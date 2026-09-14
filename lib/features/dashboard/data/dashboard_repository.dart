import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../payments/domain/payment_model.dart';
import '../domain/dashboard_summary.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// All time, unless a year is named. Legacy asked the one table-data endpoint with `status: 2`.
  Future<ApiResponse<DashboardSummary>> getOverallSummary({
    String? estateId,
    String? propertyId,
    int? year,
  }) async {
    return _apiClient.get<DashboardSummary>(
      ApiConstants.dashboardOverall,
      queryParameters: {
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'year': ?year,
      },
      fromJsonT: (data) => DashboardSummary.fromOverall(data as Map<String, dynamic>),
    );
  }

  /// One month. Omitting the month means the month it is now — a dashboard opens on today.
  Future<ApiResponse<DashboardSummary>> getMonthlySummary({
    String? estateId,
    String? propertyId,
    int? month,
    int? year,
  }) async {
    return _apiClient.get<DashboardSummary>(
      ApiConstants.dashboardMonthly,
      queryParameters: {
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'month': ?month,
        'year': ?year,
        // The collections table is fetched separately by the screen, so this asks for none of it
        // rather than dragging ten rows along with every figure refresh.
        'collectionsPageSize': 1,
      },
      fromJsonT: (data) => DashboardSummary.fromMonthly(data as Map<String, dynamic>),
    );
  }

  /// The year, month by month — what the collections chart draws.
  Future<ApiResponse<Map<String, dynamic>>> getCalendar({
    String? estateId,
    String? propertyId,
    int? year,
  }) async {
    return _apiClient.get<Map<String, dynamic>>(
      ApiConstants.dashboardCalendar,
      queryParameters: {
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'year': ?year,
      },
      fromJsonT: (data) => Map<String, dynamic>.from(data as Map),
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
        // The rebuilt payment list names its window `from` and `to`, inclusive at both ends.
        'from': startDate,
        'to': endDate,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        // Whose rows, read from the session rather than taken as an id — a tenant is scoped to
        // their own regardless, but a person who is both a landlord and a tenant has to say.
        if (isTenant) 'mine': true,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }
}
