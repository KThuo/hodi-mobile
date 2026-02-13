import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../domain/invoice_model.dart';
import '../domain/invoice_detail_model.dart';
import '../domain/payment_type_model.dart';

class InvoiceRepository {
  final ApiClient _apiClient;
  final PdfDownloader _pdfDownloader;

  InvoiceRepository({
    required ApiClient apiClient,
    required PdfDownloader pdfDownloader,
  })  : _apiClient = apiClient,
        _pdfDownloader = pdfDownloader;

  Future<ApiResponse<PagedResponse<InvoiceModel>>> getInvoices({
    required String status,
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? startDate,
    String? endDate,
  }) async {
    return _apiClient.get<PagedResponse<InvoiceModel>>(
      '${ApiConstants.invoices}/$status',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'startDate': ?startDate,
        'endDate': ?endDate,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => InvoiceModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<InvoiceDetailModel>> getInvoiceDetail(String rrn) async {
    return _apiClient.get<InvoiceDetailModel>(
      '${ApiConstants.invoiceDetail}/$rrn',
      fromJsonT: (data) => InvoiceDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<void> downloadInvoicePdf(String rrn) async {
    await _pdfDownloader.downloadAndOpen(
      '${ApiConstants.invoicePrint}/$rrn',
      'invoice_$rrn.pdf',
    );
  }

  Future<ApiResponse<List<PaymentTypeModel>>> getPaymentTypes({
    required int propertyId,
    required bool isSelf,
  }) async {
    final selfParam = isSelf ? 1 : 0;
    return _apiClient.get<List<PaymentTypeModel>>(
      '${ApiConstants.paymentTypes}/property/$selfParam/$propertyId',
      fromJsonT: (data) => (data as List)
          .map((item) => PaymentTypeModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<void>> receivePayment({
    required Map<String, dynamic> payload,
  }) async {
    return _apiClient.post<void>(
      ApiConstants.receivePayments,
      data: payload,
    );
  }
}
