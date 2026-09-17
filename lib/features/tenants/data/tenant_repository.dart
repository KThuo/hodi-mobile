import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../invoices/domain/invoice_model.dart';
import '../../payments/domain/payment_model.dart';
import '../domain/tenant_detail_model.dart';
import '../domain/tenant_model.dart';

/// Tenants.
///
/// Three of the four calls here were wrong before this was rewritten, and each in its own way:
///
/// - the detail asked `/tenants/{id}/details`; the path is `/tenants/{id}`
/// - the invoice list asked `/invoices/{status}`, which is the by-id path, so a status of `0`
///   asked for the invoice whose HashId is "0"
/// - both money lists filtered on `userId`, a parameter neither endpoint has. Unknown query
///   parameters are ignored, so they came back unfiltered — every invoice and every payment in
///   scope, shown under one tenant's name
///
/// The last of those is the dangerous one. It did not fail; it answered, with somebody else's rows.
class TenantRepository {
  final ApiClient _apiClient;

  TenantRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// [kind] narrows to `PERSON` or `ORGANISATION`. There is no estate or property filter here —
  /// the tenancy scope decides what comes back, from the caller's identity.
  Future<ApiResponse<PagedResponse<TenantModel>>> getTenants({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? kind,
  }) async {
    return _apiClient.get<PagedResponse<TenantModel>>(
      ApiConstants.tenants,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'kind': ?kind,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => TenantModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<TenantDetailModel>> getTenantDetail(String id) async {
    return _apiClient.get<TenantDetailModel>(
      '${ApiConstants.tenants}/$id',
      fromJsonT: (data) =>
          TenantDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// This tenant's payments.
  ///
  /// `tenantUserId` is the parameter both money lists actually have — the same one the occupations
  /// list uses. It narrows within the caller's scope and cannot widen it.
  Future<ApiResponse<PagedResponse<PaymentModel>>> getTenantPayments({
    int page = 0,
    int pageSize = 20,
    required String tenantUserId,
  }) async {
    return _apiClient.get<PagedResponse<PaymentModel>>(
      ApiConstants.payments,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'tenantUserId': tenantUserId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }

  /// This tenant's invoices. An empty [status] asks for every status, which is what a tenant's
  /// own page wants — the question here is what they have been billed, not what is outstanding.
  Future<ApiResponse<PagedResponse<InvoiceModel>>> getTenantInvoices({
    int page = 0,
    int pageSize = 20,
    required String tenantUserId,
    String status = '',
  }) async {
    final unpaidTab = status == '0';
    final allStatuses = status.isEmpty;

    return _apiClient.get<PagedResponse<InvoiceModel>>(
      ApiConstants.invoices,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'tenantUserId': tenantUserId,
        if (unpaidTab) 'outstanding': true,
        if (!unpaidTab && !allStatuses) 'status': int.tryParse(status),
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => InvoiceModel.fromJson(item),
      ),
    );
  }
}
