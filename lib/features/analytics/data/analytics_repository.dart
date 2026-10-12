import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../domain/analytics_models.dart';

/// The three analytics reads the dashboard makes.
///
/// No window is sent, so each answers for the server's default — the twelve months ending this
/// one, which is what the web page opens on. The estate and property are the dashboard's filter.
class AnalyticsRepository {
  final ApiClient _apiClient;

  AnalyticsRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// The bottom of the ranked league: sorted by rank descending, the unranked land last.
  Future<ApiResponse<TenantsToChase>> tenantsToChase({
    String? estateId,
    String? propertyId,
    int count = 5,
  }) {
    return _apiClient.get<TenantsToChase>(
      ApiConstants.analyticsLeague,
      queryParameters: {
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'sort': 'rank',
        'desc': true,
        'page': 0,
        'pageSize': count,
      },
      fromJsonT: (data) => TenantsToChase.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResponse<RentRealised>> rentRealised({String? estateId, String? propertyId}) {
    return _apiClient.get<RentRealised>(
      ApiConstants.analyticsProperties,
      queryParameters: {'estateId': ?estateId, 'propertyId': ?propertyId},
      fromJsonT: (data) => RentRealised.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResponse<StaysSummary>> stays({String? estateId, String? propertyId}) {
    return _apiClient.get<StaysSummary>(
      ApiConstants.analyticsStays,
      queryParameters: {'estateId': ?estateId, 'propertyId': ?propertyId},
      fromJsonT: (data) => StaysSummary.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }
}
