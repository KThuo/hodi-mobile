import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/house_model.dart';
import '../domain/house_detail_model.dart';
import '../domain/house_feature_model.dart';

class HouseRepository {
  final ApiClient _apiClient;

  HouseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<HouseModel>>> getHouses({
    int page = 0,
    int pageSize = 20,
    String? propertyId,
    String? occupied,
    String? searchTerm,
    String? categoryId,
    String? estateId,
  }) async {
    return _apiClient.get<PagedResponse<HouseModel>>(
      ApiConstants.houses,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'propertyId': ?propertyId,
        'occupied': ?occupied,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'categoryId': ?categoryId,
        'estateId': ?estateId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => HouseModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<HouseDetailModel>> getHouseDetail(int id) async {
    return _apiClient.get<HouseDetailModel>(
      '${ApiConstants.houseDetail}/$id',
      fromJsonT: (data) => HouseDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<List<HouseFeatureModel>>> getHouseFeatures(int houseId) async {
    return _apiClient.get<List<HouseFeatureModel>>(
      '${ApiConstants.houseFeatures}/$houseId',
      fromJsonT: (data) => (data as List)
          .map((item) => HouseFeatureModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
