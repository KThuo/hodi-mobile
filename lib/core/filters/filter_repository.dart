import '../api/api_client.dart';
import '../api/api_constants.dart';
import '../api/api_response.dart';
import 'filter_option.dart';

class FilterRepository {
  final ApiClient _apiClient;

  FilterRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<List<FilterOption>>> getEstates() async {
    return _apiClient.get<List<FilterOption>>(
      ApiConstants.estatesAll,
      fromJsonT: (data) => (data as List)
          .map((item) => FilterOption.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<List<FilterOption>>> getProperties(String estateId) async {
    return _apiClient.get<List<FilterOption>>(
      '${ApiConstants.propertiesAll}/$estateId',
      fromJsonT: (data) => (data as List)
          .map((item) => FilterOption.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
