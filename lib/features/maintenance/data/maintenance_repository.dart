import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/maintenance_models.dart';

/// Repairs.
///
/// Only the calls this app's audiences can make. `assign` and `cost` need `ROLE_MAINT_ASSIGN` and
/// `ROLE_MAINT_EDIT`, which neither a tenant nor a caretaker holds, so they are not here — a
/// method nobody can call successfully is a button that fails.
class MaintenanceRepository {
  final ApiClient _apiClient;

  MaintenanceRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// [mine] is the caller's own requests and [assignedToMe] is what they have been given — the
  /// two audiences of this screen, and the server reads whose from the session for both.
  Future<ApiResponse<PagedResponse<MaintenanceRequestModel>>> list({
    int page = 0,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? estateId,
    String? propertyId,
    bool openOnly = false,
    bool mine = false,
    bool assignedToMe = false,
  }) async {
    return _apiClient.get<PagedResponse<MaintenanceRequestModel>>(
      '${ApiConstants.maintenance}/requests',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (searchTerm != null && searchTerm.isNotEmpty) 'searchTerm': searchTerm,
        'status': ?status,
        'estateId': ?estateId,
        'propertyId': ?propertyId,
        if (openOnly) 'openOnly': true,
        if (mine) 'mine': true,
        if (assignedToMe) 'assignedToMe': true,
      },
      fromJsonT: (data) => PagedResponse.fromJson(
        data as Map<String, dynamic>,
        (item) => MaintenanceRequestModel.fromJson(item),
      ),
    );
  }

  Future<ApiResponse<MaintenanceDetailModel>> detail(String id) async {
    return _apiClient.get<MaintenanceDetailModel>(
      '${ApiConstants.maintenance}/requests/$id',
      fromJsonT: (data) =>
          MaintenanceDetailModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<List<MaintenanceCategoryModel>>> categories() async {
    return _apiClient.get<List<MaintenanceCategoryModel>>(
      '${ApiConstants.maintenance}/categories',
      fromJsonT: (data) => (data as List)
          .map((e) => MaintenanceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<MaintenanceWorkloadModel>> workload() async {
    return _apiClient.get<MaintenanceWorkloadModel>(
      '${ApiConstants.maintenance}/workload',
      fromJsonT: (data) =>
          MaintenanceWorkloadModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Raises one.
  ///
  /// `tenantUserId` is not sent. It exists for staff raising a request on somebody's behalf, and
  /// the server ignores it from a tenant anyway — their own request is their own.
  ///
  /// `reportedChannel` says how it arrived. MOBILE rather than the server's WEB default, because
  /// "how did this reach us" is the question the field answers and the answer here is the app.
  Future<ApiResponse<MaintenanceRequestModel>> raise({
    required String categoryId,
    required String title,
    required String description,
    String? houseId,
    String? priority,
    String? accessNotes,
  }) async {
    return _apiClient.post<MaintenanceRequestModel>(
      '${ApiConstants.maintenance}/requests',
      data: {
        'categoryId': categoryId,
        'title': title,
        'description': description,
        if (houseId != null && houseId.isNotEmpty) 'houseId': houseId,
        if (priority != null && priority.isNotEmpty) 'priority': priority,
        if (accessNotes != null && accessNotes.trim().isNotEmpty)
          'accessNotes': accessNotes.trim(),
        'reportedChannel': 'MOBILE',
      },
      fromJsonT: (data) =>
          MaintenanceRequestModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<MaintenanceUpdateModel>> comment({
    required String id,
    required String comment,
  }) async {
    return _apiClient.post<MaintenanceUpdateModel>(
      '${ApiConstants.maintenance}/requests/$id/comments',
      data: {'comment': comment},
      fromJsonT: (data) =>
          MaintenanceUpdateModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Moves it between states. Accepted for `ROLE_MAINT_EDIT` **or** `ROLE_MAINT_NEW`, which is
  /// what lets a tenant cancel their own and a caretaker pick one up.
  Future<ApiResponse<MaintenanceRequestModel>> setStatus({
    required String id,
    required String status,
    String? reason,
    String? comment,
  }) async {
    return _apiClient.post<MaintenanceRequestModel>(
      '${ApiConstants.maintenance}/requests/$id/status',
      data: {
        'status': status,
        if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim(),
        if (comment != null && comment.trim().isNotEmpty) 'comment': comment.trim(),
      },
      fromJsonT: (data) =>
          MaintenanceRequestModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Done, and what was done.
  ///
  /// The cost fields are left out: they need `ROLE_MAINT_EDIT` on the cost endpoint and belong to
  /// whoever is paying, not to the person who did the work on a phone.
  Future<ApiResponse<MaintenanceRequestModel>> resolve({
    required String id,
    required String actionsTaken,
    String? notes,
  }) async {
    return _apiClient.post<MaintenanceRequestModel>(
      '${ApiConstants.maintenance}/requests/$id/resolve',
      data: {
        'actionsTaken': actionsTaken,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      },
      fromJsonT: (data) =>
          MaintenanceRequestModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The tenant's verdict, once it is done. One to five stars.
  Future<ApiResponse<MaintenanceRequestModel>> rate({
    required String id,
    required int stars,
    String? feedback,
  }) async {
    return _apiClient.post<MaintenanceRequestModel>(
      '${ApiConstants.maintenance}/requests/$id/rate',
      data: {
        'stars': stars,
        if (feedback != null && feedback.trim().isNotEmpty)
          'feedback': feedback.trim(),
      },
      fromJsonT: (data) =>
          MaintenanceRequestModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
