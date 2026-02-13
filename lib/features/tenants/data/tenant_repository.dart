import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../../payments/domain/payment_model.dart';
import '../../invoices/domain/invoice_model.dart';
import '../domain/tenant_model.dart';
import '../domain/tenant_detail_model.dart';

class TenantRepository {
  final ApiClient _apiClient;

  TenantRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<TenantModel>>> getTenants({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? userId,
  }) async {
    return _apiClient.get<PagedResponse<TenantModel>>(
      ApiConstants.tenants,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'userId': ?userId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => TenantModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<TenantDetailModel>> getTenantDetail(String userId) async {
    return _apiClient.get<TenantDetailModel>(
      '${ApiConstants.tenants}/$userId/details',
      fromJsonT: (data) => TenantDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<PagedResponse<PaymentModel>>> getTenantPayments({
    int page = 0,
    int pageSize = 20,
    required String userId,
    String? startDate,
    String? endDate,
    String? searchTerm,
  }) async {
    return _apiClient.get<PagedResponse<PaymentModel>>(
      ApiConstants.payments,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'userId': userId,
        'status': '0',
        'startDate': ?startDate,
        'endDate': ?endDate,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => PaymentModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<PagedResponse<InvoiceModel>>> getTenantInvoices({
    int page = 0,
    int pageSize = 20,
    required String userId,
    required String status,
    String? searchTerm,
  }) async {
    return _apiClient.get<PagedResponse<InvoiceModel>>(
      '${ApiConstants.invoices}/$status',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'userId': userId,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => InvoiceModel.fromJson(item),
      ),
    );
  }
}
