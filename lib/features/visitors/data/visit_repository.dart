import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/visit_model.dart';

/// Visits.
///
/// Only what this app's audiences hold. `GET /visits/{id}/id-number` is not here: it needs
/// `ROLE_VISIT_REVEAL`, neither a tenant nor a gate holds it, and an identity document number is
/// not something to fetch onto a handset. `override` and the blocklist are the office's.
class VisitRepository {
  final ApiClient _apiClient;

  VisitRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// [mine] is visits to this person's own unit, read from the session.
  /// [openOnly] is anybody still on site.
  Future<ApiResponse<PagedResponse<VisitModel>>> list({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? approvalStatus,
    bool openOnly = false,
    bool mine = false,
  }) async {
    return _apiClient.get<PagedResponse<VisitModel>>(
      ApiConstants.visits,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'approvalStatus': ?approvalStatus,
        if (openOnly) 'openOnly': true,
        if (mine) 'mine': true,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => VisitModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<VisitModel>> one(String id) async {
    return _apiClient.get<VisitModel>(
      '${ApiConstants.visits}/$id',
      fromJsonT: (data) => VisitModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<OnSiteSummaryModel>> onSite() async {
    return _apiClient.get<OnSiteSummaryModel>(
      '${ApiConstants.visits}/on-site',
      fromJsonT: (data) =>
          OnSiteSummaryModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The host's answer: `APPROVED` or `REJECTED`.
  ///
  /// The server replies with a sentence naming the visitor — "Jane may be let in", "Jane has been
  /// refused. The gate has been told." — which is what the screen shows, because it says what
  /// happened next rather than that a request succeeded.
  Future<ApiResponse<VisitModel>> decide({
    required String id,
    required bool approve,
    String? notes,
  }) async {
    return _apiClient.post<VisitModel>(
      '${ApiConstants.visits}/$id/decision',
      data: {
        'decision': approve ? 'APPROVED' : 'REJECTED',
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      },
      fromJsonT: (data) => VisitModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// They have left. The gate's own action — `ROLE_VISIT_NEW`.
  Future<ApiResponse<VisitModel>> checkOut(String id) async {
    return _apiClient.post<VisitModel>(
      '${ApiConstants.visits}/$id/checkout',
      fromJsonT: (data) => VisitModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
