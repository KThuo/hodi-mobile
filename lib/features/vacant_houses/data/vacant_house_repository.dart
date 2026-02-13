import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/vacant_house_model.dart';
import '../domain/vacant_house_detail_model.dart';

class VacantHouseRepository {
  final ApiClient _apiClient;

  VacantHouseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<VacantHouseModel>>> searchVacantHouses({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? categoryId,
    String? houseTypeId,
    String? minRent,
    String? maxRent,
  }) async {
    return _apiClient.get<PagedResponse<VacantHouseModel>>(
      '${ApiConstants.vacantHouses}/search',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'categoryId': ?categoryId,
        'houseTypeId': ?houseTypeId,
        'minRent': ?minRent,
        'maxRent': ?maxRent,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => VacantHouseModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<VacantHouseDetailModel>> getVacantHouseDetail(String id) async {
    return _apiClient.get<VacantHouseDetailModel>(
      '${ApiConstants.vacantHouses}/$id/details',
      fromJsonT: (data) => VacantHouseDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<List<FilterItem>>> getCategories() async {
    return _apiClient.get<List<FilterItem>>(
      '${ApiConstants.vacantHouses}/filters/categories',
      fromJsonT: (data) => (data as List)
          .map((item) => FilterItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<List<FilterItem>>> getHouseTypes() async {
    return _apiClient.get<List<FilterItem>>(
      '${ApiConstants.vacantHouses}/filters/house-types',
      fromJsonT: (data) => (data as List)
          .map((item) => FilterItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class FilterItem {
  final String id;
  final String name;

  const FilterItem({required this.id, required this.name});

  factory FilterItem.fromJson(Map<String, dynamic> json) {
    return FilterItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }
}
