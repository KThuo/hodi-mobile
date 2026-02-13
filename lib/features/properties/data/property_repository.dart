import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/property_model.dart';
import '../domain/property_detail_model.dart';

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

  Future<ApiResponse<PropertyDetailModel>> getPropertyDetail(
    int id, {
    String? period,
  }) async {
    return _apiClient.get<PropertyDetailModel>(
      '${ApiConstants.properties}/$id',
      queryParameters: {
        'period': ?period,
      },
      fromJsonT: (data) =>
          PropertyDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
