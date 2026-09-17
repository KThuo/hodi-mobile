import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../domain/vacate_notice_detail_model.dart';
import '../domain/vacate_notice_model.dart';

/// Notices to vacate.
///
/// **There is one decision endpoint, not three.** The app posted to `/approve`, `/reject` and
/// `/cancel`; the server has `POST /{id}/decision` taking an `action` of `APPROVE`, `REJECT` or
/// `CANCEL`. All three calls were 404s.
///
/// Raising and deciding both accept `ROLE_TENANT_SELF` alongside the staff authority, which is the
/// shape of the feature: a tenant gives their own notice and may withdraw it; the office approves
/// or refuses.
class VacateNoticeRepository {
  final ApiClient _apiClient;
  final PdfDownloader _pdfDownloader;

  VacateNoticeRepository({
    required ApiClient apiClient,
    required PdfDownloader pdfDownloader,
  })  : _apiClient = apiClient,
        _pdfDownloader = pdfDownloader;

  Future<ApiResponse<PagedResponse<VacateNoticeModel>>> getVacateNotices({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<VacateNoticeModel>>(
      ApiConstants.vacateNotices,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'status': ?status,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => VacateNoticeModel.fromJson(item),
      ),
    );
  }

  /// One notice and its settlement.
  ///
  /// The answer is `{notice, lines, nextStep, shortNotice, payments}` — nested. Reading it as a
  /// flat object, which is what this used to do, resolves every field to null and renders a page
  /// with nothing on it and no error to explain why.
  Future<ApiResponse<VacateNoticeDetailModel>> getVacateNoticeDetail(String id) async {
    return _apiClient.get<VacateNoticeDetailModel>(
      '${ApiConstants.vacateNotices}/$id',
      fromJsonT: (data) =>
          VacateNoticeDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Approve, refuse, or withdraw.
  ///
  /// [action] is `APPROVE`, `REJECT` or `CANCEL` — the server validates against exactly those.
  Future<ApiResponse<VacateNoticeModel>> decide({
    required String id,
    required String action,
    String? notes,
  }) async {
    return _apiClient.post<VacateNoticeModel>(
      '${ApiConstants.vacateNotices}/$id/decision',
      data: {
        'action': action,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      },
      fromJsonT: (data) => VacateNoticeModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The settlement statement, rendered by the server — the same machinery behind the invoice,
  /// the receipt and the lease agreement.
  Future<void> downloadStatement(String id) async {
    await _pdfDownloader.downloadAndOpen(
      '${ApiConstants.vacateNotices}/$id/statement.pdf',
      'settlement-$id.pdf',
    );
  }
}
