import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/vacate_notice_model.dart';
import '../domain/vacate_notice_detail_model.dart';

class VacateNoticeRepository {
  final ApiClient _apiClient;

  VacateNoticeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<VacateNoticeModel>>> getVacateNotices({
    int page = 0,
    int pageSize = 20,
    String? status,
    String? searchTerm,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<VacateNoticeModel>>(
      ApiConstants.vacateNotices,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'status': ?status,
        if (searchTerm != null && searchTerm.isNotEmpty) 'search': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => VacateNoticeModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<VacateNoticeDetailModel>> getVacateNoticeDetail(String id) async {
    return _apiClient.get<VacateNoticeDetailModel>(
      '${ApiConstants.vacateNotices}/$id',
      fromJsonT: (data) => VacateNoticeDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<void>> approveNotice(String id, {String? comments}) async {
    return _apiClient.put<void>(
      '${ApiConstants.vacateNotices}/$id/approve',
      data: {
        if (comments != null && comments.isNotEmpty) 'approvalComments': comments,
      },
    );
  }

  Future<ApiResponse<void>> rejectNotice(String id, {required String reason}) async {
    return _apiClient.put<void>(
      '${ApiConstants.vacateNotices}/$id/reject',
      data: {
        'rejectionReason': reason,
      },
    );
  }

  Future<ApiResponse<void>> cancelNotice(String id) async {
    return _apiClient.put<void>(
      '${ApiConstants.vacateNotices}/$id/cancel',
    );
  }
}
