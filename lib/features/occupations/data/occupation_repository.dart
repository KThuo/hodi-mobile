import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/occupation_model.dart';
import '../domain/tenancy_balance_model.dart';

/// Tenancies — legacy's "my houses", and the staff list of who occupies what.
///
/// One endpoint answers both. `ROLE_TENANT_SELF` is accepted alongside `ROLE_TENANT_VIEW`,
/// because a tenant does not hold the right to look at other people's tenancies and should not
/// need it to look at their own.
class OccupationRepository {
  final ApiClient _apiClient;

  OccupationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// [mine] narrows to the caller's own tenancies, and whose is read from the session — never
  /// from this parameter. It exists because one person is often both a landlord and a tenant,
  /// and a superadmin is otherwise answered with everything.
  Future<ApiResponse<PagedResponse<OccupationModel>>> getOccupations({
    int page = 0,
    int pageSize = 20,
    bool mine = false,
    String? searchTerm,
    String? estateId,
    String? propertyId,
    String? tenantUserId,
  }) async {
    return _apiClient.get<PagedResponse<OccupationModel>>(
      ApiConstants.occupations,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (mine) 'mine': true,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        'tenantUserId': ?tenantUserId,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => OccupationModel.fromJson(item),
      ),
    );
  }

  /// Who lives in a unit right now.
  ///
  /// A success with no data means vacant — the server says so deliberately, so the caller can
  /// tell "nobody is here" from "the request failed". Returning an error for an empty unit would
  /// make every vacant unit look like a fault.
  Future<ApiResponse<OccupationModel?>> occupationOfHouse(String houseId) async {
    return _apiClient.get<OccupationModel?>(
      '${ApiConstants.occupations}/house/$houseId',
      fromJsonT: (data) => data == null
          ? null
          : OccupationModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Who has occupied a unit before.
  Future<ApiResponse<List<OccupationModel>>> historyOfHouse(String houseId) async {
    return _apiClient.get<List<OccupationModel>>(
      '${ApiConstants.occupations}/house/$houseId/history',
      fromJsonT: (data) => (data as List)
          .map((item) => OccupationModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// What this tenancy owes, and what credit is being held against it.
  Future<ApiResponse<TenancyBalanceModel>> balance(String occupationId) async {
    return _apiClient.get<TenancyBalanceModel>(
      '${ApiConstants.paymentBalance}/$occupationId',
      fromJsonT: (data) =>
          TenancyBalanceModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
