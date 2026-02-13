import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/metre_model.dart';
import '../domain/metre_history_model.dart';

class MetreRepository {
  final ApiClient _apiClient;

  MetreRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<MetreModel>>> getMetres({
    int page = 0,
    int pageSize = 20,
    bool? currentReading,
    String? searchTerm,
  }) async {
    return _apiClient.get<PagedResponse<MetreModel>>(
      ApiConstants.metres,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (currentReading != null) 'currentReading': currentReading,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => MetreModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<PagedResponse<MetreHistoryModel>>> getMetreHistory({
    int page = 0,
    int pageSize = 20,
    required String metreId,
    int? year,
    String? searchTerm,
  }) async {
    return _apiClient.get<PagedResponse<MetreHistoryModel>>(
      ApiConstants.metreHistory,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'metreId': metreId,
        if (year != null) 'year': year,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => MetreHistoryModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<void>> updateReading({
    required String metreId,
    required String currentReading,
    String? description,
    String? image,
  }) async {
    return _apiClient.post<void>(
      ApiConstants.metreUpdateReading,
      data: {
        'metreId': metreId,
        'currentReading': currentReading,
        if (description != null && description.isNotEmpty) 'description': description,
        'image': image ?? '',
      },
    );
  }
}
