import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../domain/payment_model.dart';
import '../domain/payment_detail_model.dart';

class PaymentRepository {
  final ApiClient _apiClient;
  final PdfDownloader _pdfDownloader;

  PaymentRepository({
    required ApiClient apiClient,
    required PdfDownloader pdfDownloader,
  })  : _apiClient = apiClient,
        _pdfDownloader = pdfDownloader;

  Future<ApiResponse<PagedResponse<PaymentModel>>> getPayments({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    bool isTenant = false,
    String? startDate,
    String? endDate,
    required String status,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<PaymentModel>>(
      ApiConstants.payments,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        // Whose rows, read from the session rather than taken as an id. A tenant is scoped to
        // their own regardless; this is for somebody who is both a landlord and a tenant.
        if (isTenant) 'mine': true,
        // Inclusive at both ends, and either may be omitted — `from` alone reads "since".
        'from': ?startDate,
        'to': ?endDate,
        'status': status,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<PaymentDetailModel>> getPaymentDetail(String rrn) async {
    return _apiClient.get<PaymentDetailModel>(
      '${ApiConstants.paymentReceipt}/$rrn',
      fromJsonT: (data) => PaymentDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The receipt as a PDF, rendered by the server.
  ///
  /// This fetched the JSON and saved it under a `.pdf` name, so the file arrived and would not open
  /// — the same fault the invoice download had. The server renders one now, from the same
  /// `PaymentDetail` the screen shows.
  Future<void> downloadReceiptPdf(String rrn) async {
    await _pdfDownloader.downloadAndOpen(
      '${ApiConstants.paymentReceipt}/$rrn/receipt.pdf',
      'receipt-$rrn.pdf',
    );
  }
}
