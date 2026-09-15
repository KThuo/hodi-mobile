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
    String? estateId,
    String? propertyId,
    int? periodMonth,
    int? periodYear,

    /// The caller's own, as a tenant. Whose rows is read from the session, never from an id here.
    bool mine = false,
  }) async {
    /*
     * "Unpaid" means anything still owed, which is not the same as status 0.
     *
     * A part-paid invoice is status 1, so a tab filtering on 0 alone hid every invoice somebody had
     * made a payment towards — exactly the ones worth chasing. The server has `outstanding` for
     * this, which is 0 and 1 together, and its own note gives the reason: one tab for what is still
     * owed. Paid and Voided are single statuses and stay as they are.
     */
    final unpaidTab = status == '0';

    return _apiClient.get<PagedResponse<InvoiceModel>>(
      ApiConstants.invoices,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        if (unpaidTab) 'outstanding': true,
        if (!unpaidTab) 'status': int.tryParse(status),
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        // Invoices belong to a billing period, not to a date range: there is no start and end date
        // to send, and the two the caller used to pass were silently ignored by the new list.
        'periodMonth': ?periodMonth,
        'periodYear': ?periodYear,
        if (mine) 'mine': true,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => InvoiceModel.fromJson(item),
      ),
    );
  }

  /// One invoice, by the reference printed on it.
  ///
  /// `/reference/{rrn}` rather than `/detail/{rrn}`. Both answer by reference and they are not the
  /// same document: `/detail` is the public one an SMS link opens, and it deliberately carries no
  /// ids — its protection is the payload, so a guessed reference reveals only what the tenant
  /// already holds on paper. That makes it unusable for recording a payment, which needs the tenancy
  /// and the invoice.
  ///
  /// This one needs `ROLE_INVOICE_VIEW`, which the seeded tenant group holds, so it serves a
  /// caretaker and a tenant alike — and the tenancy scope answers each with their own rows.
  Future<ApiResponse<InvoiceDetailModel>> getInvoiceDetail(String rrn) async {
    return _apiClient.get<InvoiceDetailModel>(
      '${ApiConstants.invoiceByReference}/$rrn',
      fromJsonT: (data) => InvoiceDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The invoice as a PDF, rendered by the server.
  ///
  /// This used to fetch `/detail/{rrn}` — the JSON document — and save the bytes under a `.pdf`
  /// name, so the file downloaded and then would not open, because it was never a PDF. The server
  /// renders one now, from the same `PublicInvoice` the screen shows, so the paper and the screen
  /// cannot disagree.
  Future<void> downloadInvoicePdf(String rrn) async {
    await _pdfDownloader.downloadAndOpen(
      '${ApiConstants.invoiceDetail}/$rrn/invoice.pdf',
      'invoice-$rrn.pdf',
    );
  }

  /// The ways this invoice may be paid, by reference alone.
  ///
  /// Legacy needed a property id and a self-managed flag and built the path from both, which meant
  /// the client had to know which account the money belongs in. The server resolves the property,
  /// the estate and the ownership from the reference now, so the app needs nothing but the number
  /// printed on the invoice — which is also why this works for somebody following a rent SMS who
  /// has no session at all.
  Future<ApiResponse<List<PaymentTypeModel>>> payMethods(String rrn) async {
    return _apiClient.get<List<PaymentTypeModel>>(
      '${ApiConstants.invoiceDetail}/$rrn/pay-methods',
      fromJsonT: (data) => (data as List)
          .map((item) => PaymentTypeModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Sends an STK prompt to a payer's handset for this invoice.
  ///
  /// The channel is checked server-side against what this invoice actually offers, so a prompt
  /// cannot be aimed at another estate's account.
  Future<ApiResponse<void>> prompt({
    required String rrn,
    required String paymentTypeId,
    required double amount,
    required String phone,
  }) async {
    return _apiClient.post<void>(
      '${ApiConstants.invoiceDetail}/$rrn/prompt',
      data: {
        'paymentTypeId': paymentTypeId,
        'amount': amount,
        'phone': phone,
      },
    );
  }

  Future<ApiResponse<void>> receivePayment({
    required Map<String, dynamic> payload,
  }) async {
    return _apiClient.post<void>(
      ApiConstants.payments,
      data: payload,
    );
  }
}
