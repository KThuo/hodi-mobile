import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../domain/lease_models.dart';

/// Tenancy agreements.
///
/// ## Two doors to the same document
///
/// Every read here has a staff path behind `ROLE_LEASE_VIEW` and a tenant path under `/mine` with
/// no authority at all — the server scopes those to the caller and honours the property's
/// `tenantCanViewLease` setting. Which one to use is decided by what the caller holds, in
/// [LeaseRepository.detail] and [LeaseRepository.downloadAgreement], rather than by trying the
/// staff path and reading a 403 as an answer.
///
/// Uploading and deleting documents are not here. They need `ROLE_LEASE_DOCUMENT_EDIT`, which is
/// the office's, and a lease document is not a thing to attach from a phone between other jobs.
class LeaseRepository {
  final ApiClient _apiClient;
  final PdfDownloader _pdfDownloader;

  LeaseRepository({
    required ApiClient apiClient,
    required PdfDownloader pdfDownloader,
  })  : _apiClient = apiClient,
        _pdfDownloader = pdfDownloader;

  Future<ApiResponse<PagedResponse<LeaseModel>>> list({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? estateId,
    String? propertyId,
    String? term,
  }) async {
    return _apiClient.get<PagedResponse<LeaseModel>>(
      ApiConstants.leases,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'term': ?term,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => LeaseModel.fromJson(item),
      ),
    );
  }

  /// What needs renewing.
  ///
  /// Its own endpoint rather than a filter, and the server's comment says why: it is a question
  /// somebody asks, not a filter they have to remember to set.
  Future<ApiResponse<PagedResponse<LeaseModel>>> expiring({
    int days = 60,
    int page = 0,
    int pageSize = 20,
  }) async {
    return _apiClient.get<PagedResponse<LeaseModel>>(
      '${ApiConstants.leases}/expiring',
      queryParameters: {'days': days, 'page': page, 'pageSize': pageSize},
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => LeaseModel.fromJson(item),
      ),
    );
  }

  /// One agreement. [mine] picks the tenant's own path.
  Future<ApiResponse<LeaseDetailModel>> detail(String id, {bool mine = false}) async {
    return _apiClient.get<LeaseDetailModel>(
      mine ? '${ApiConstants.leases}/mine/$id' : '${ApiConstants.leases}/$id',
      fromJsonT: (data) =>
          LeaseDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The agreement itself, rendered by the server.
  ///
  /// The same `PdfDocuments` machinery behind the invoice and the receipt, so the copy a tenant
  /// downloads and the copy the office prints are the same bytes.
  Future<void> downloadAgreement(String id, {bool mine = false}) async {
    await _pdfDownloader.downloadAndOpen(
      mine
          ? '${ApiConstants.leases}/mine/$id/agreement.pdf'
          : '${ApiConstants.leases}/$id/agreement.pdf',
      'agreement-$id.pdf',
    );
  }

  /// An attached file — a signed scan, an inventory.
  Future<void> downloadDocument(
    LeaseDocumentModel document, {
    bool mine = false,
  }) async {
    await _pdfDownloader.downloadAndOpen(
      mine
          ? '${ApiConstants.leases}/mine/documents/${document.id}/file'
          : '${ApiConstants.leases}/documents/${document.id}/file',
      document.fileName ?? 'document-${document.id}',
    );
  }
}
