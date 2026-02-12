import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/dashboard_summary.dart';
import '../domain/calendar_data.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<DashboardSummary>> getOverallSummary({
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<DashboardSummary>(
      ApiConstants.dashboardTableData,
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
      ApiConstants.dashboardTableData,
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

  Future<ApiResponse<CalendarData>> getCalendarData({
    String? estateId,
    String? propertyId,
    String? year,
  }) async {
    return _apiClient.get<CalendarData>(
      ApiConstants.dashboardTableData,
      queryParameters: {
        'status': '3',
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'year': ?year,
      },
      fromJsonT: (data) => CalendarData.fromJson(data as Map<String, dynamic>),
    );
  }
}
