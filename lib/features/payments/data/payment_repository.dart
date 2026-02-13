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
  }) async {
    return _apiClient.get<PagedResponse<PaymentModel>>(
      ApiConstants.payments,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        if (isTenant) 'self': 'true',
        'startDate': ?startDate,
        'endDate': ?endDate,
        'status': status,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<PaymentDetailModel>> getPaymentDetail(String rrn) async {
    return _apiClient.get<PaymentDetailModel>(
      '${ApiConstants.paymentDetail}/$rrn',
      fromJsonT: (data) => PaymentDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<void> downloadReceiptPdf(String rrn) async {
    await _pdfDownloader.downloadAndOpen(
      '${ApiConstants.paymentPrint}/$rrn',
      'receipt_$rrn.pdf',
    );
  }
}
