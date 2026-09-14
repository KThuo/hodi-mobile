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
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<MetreModel>>(
      ApiConstants.meters,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'currentReading': ?currentReading,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
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
      ApiConstants.meterReadings(metreId),
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'year': ?year,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => MetreHistoryModel.fromJson(item),
      ),
    );
  }

  /// Takes a reading. The meter is in the path and the number is the whole body.
  ///
  /// **No image.** Legacy carried the photograph base64-encoded in this same request, which cost a
  /// third again on the wire and lost the reading whenever the photo failed to arrive. The rebuilt
  /// backend has no image field to send it to, and the plan is for the photograph to follow as its
  /// own multipart upload once there is somewhere to put it — so the reading now posts alone, which
  /// is a few hundred bytes and survives a weak signal. See docs/MOBILE_UPGRADE_PLAN.md §4.
  Future<ApiResponse<void>> updateReading({
    required String metreId,
    required String currentReading,
    String? note,
  }) async {
    return _apiClient.post<void>(
      ApiConstants.meterReadings(metreId),
      data: {
        'currentReading': currentReading,
        if (note != null && note.isNotEmpty) 'note': note,
      },
    );
  }
}
