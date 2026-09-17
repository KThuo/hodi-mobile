import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/penalty_models.dart';

/// Late-payment charges.
///
/// Reading, and the three decisions. Creating a charge by hand and editing the rules are not here:
/// a rule decides what every tenancy is charged for being late, which is a policy decision made
/// once at a desk, and raising one by hand outside a rule is the exception the office handles.
class PenaltyRepository {
  final ApiClient _apiClient;

  PenaltyRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<ApiResponse<PagedResponse<PenaltyChargeModel>>> charges({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? estateId,
    String? propertyId,
  }) async {
    return _apiClient.get<PagedResponse<PenaltyChargeModel>>(
      '${ApiConstants.penalties}/charges',
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
        (item) => PenaltyChargeModel.fromJson(item),
      ),
    );
  }

  /// Every charge raised against one invoice.
  Future<ApiResponse<List<PenaltyChargeModel>>> forInvoice(String invoiceId) async {
    return _apiClient.get<List<PenaltyChargeModel>>(
      '${ApiConstants.penalties}/charges/invoice/$invoiceId',
      fromJsonT: (data) => (data as List)
          .map((e) => PenaltyChargeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Puts a charge held for review onto its invoice. Takes no body.
  Future<ApiResponse<PenaltyChargeModel>> apply(String id) async {
    return _apiClient.post<PenaltyChargeModel>(
      '${ApiConstants.penalties}/charges/$id/apply',
      fromJsonT: (data) => PenaltyChargeModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Forgives a charge that was correctly raised.
  ///
  /// The reason is required — the server's message says why: *"Say why. It is recorded against
  /// your name."* Both decisions below carry one for the same reason.
  Future<ApiResponse<PenaltyChargeModel>> waive({
    required String id,
    required String reason,
  }) async {
    return _apiClient.post<PenaltyChargeModel>(
      '${ApiConstants.penalties}/charges/$id/waive',
      data: {'reason': reason},
      fromJsonT: (data) => PenaltyChargeModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Says a charge should never have been raised, which is **not** the same as forgiving one.
  Future<ApiResponse<PenaltyChargeModel>> reverse({
    required String id,
    required String reason,
  }) async {
    return _apiClient.post<PenaltyChargeModel>(
      '${ApiConstants.penalties}/charges/$id/reverse',
      data: {'reason': reason},
      fromJsonT: (data) => PenaltyChargeModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
