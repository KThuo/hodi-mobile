import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/api/paged_response.dart';
import '../domain/pass_model.dart';
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

  /// Somebody the gate has seen before, by the number they just gave.
  ///
  /// Empty rather than an error when nobody matches — most visitors are new, and that is not a
  /// failure of anything.
  Future<ApiResponse<KnownVisitorModel?>> known(String phone) async {
    return _apiClient.get<KnownVisitorModel?>(
      '${ApiConstants.visits}/known',
      queryParameters: {'phone': phone},
      fromJsonT: (data) => data == null
          ? null
          : KnownVisitorModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// Lets somebody in at the gate.
  ///
  /// The answer says what happened: admitted, waiting on the host to say yes, or barred with a
  /// reason. The gate needs all three, and the difference between them is the feature.
  Future<ApiResponse<CheckInResultModel>> checkIn({
    required String visitorName,
    required String purpose,
    String? houseId,
    String? visitorPhone,
    String? idType,
    String? idNumber,
    int visitorCount = 1,
    String? vehicleReg,
    String? vehicleMake,
    String? vehicleColour,
    String? purposeNotes,
    String? gateName,
  }) async {
    return _apiClient.post<CheckInResultModel>(
      ApiConstants.visits,
      data: {
        'visitorName': visitorName,
        'purpose': purpose,
        'visitorCount': visitorCount,
        if (houseId != null && houseId.isNotEmpty) 'houseId': houseId,
        if (visitorPhone != null && visitorPhone.isNotEmpty)
          'visitorPhone': visitorPhone,
        if (idType != null && idType.isNotEmpty) 'idType': idType,
        if (idNumber != null && idNumber.isNotEmpty) 'idNumber': idNumber,
        if (vehicleReg != null && vehicleReg.trim().isNotEmpty)
          'vehicleReg': vehicleReg.trim().toUpperCase(),
        if (vehicleMake != null && vehicleMake.trim().isNotEmpty)
          'vehicleMake': vehicleMake.trim(),
        if (vehicleColour != null && vehicleColour.trim().isNotEmpty)
          'vehicleColour': vehicleColour.trim(),
        if (purposeNotes != null && purposeNotes.trim().isNotEmpty)
          'purposeNotes': purposeNotes.trim(),
        if (gateName != null && gateName.isNotEmpty) 'gateName': gateName,
      },
      fromJsonT: (data) =>
          CheckInResultModel.fromJson(data as Map<String, dynamic>),
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

  // ── Passes ────────────────────────────────────────────────────────────────

  /// The host invites somebody. `ROLE_VISIT_INVITE`. No ID number: the gate takes that, if the
  /// estate wants it. [houseId] only where the tenant has more than one unit.
  Future<ApiResponse<PassModel>> invite({
    required String visitorName,
    String? visitorPhone,
    String? vehicleReg,
    int visitorCount = 1,
    required DateTime validFrom,
    required DateTime validUntil,
    String? purpose,
    String? purposeNotes,
    String? houseId,
  }) async {
    return _apiClient.post<PassModel>(
      '${ApiConstants.visits}/passes',
      data: {
        'visitorName': visitorName.trim(),
        'visitorCount': visitorCount,
        'validFrom': _day(validFrom),
        'validUntil': _day(validUntil),
        if (visitorPhone != null && visitorPhone.trim().isNotEmpty)
          'visitorPhone': visitorPhone.trim(),
        if (vehicleReg != null && vehicleReg.trim().isNotEmpty)
          'vehicleReg': vehicleReg.trim().toUpperCase(),
        if (purpose != null && purpose.isNotEmpty) 'purpose': purpose,
        if (purposeNotes != null && purposeNotes.trim().isNotEmpty)
          'purposeNotes': purposeNotes.trim(),
        'houseId': ?houseId,
      },
      fromJsonT: (data) => PassModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The host's own passes, the ones still to use first.
  Future<ApiResponse<List<PassModel>>> myPasses() async {
    return _apiClient.get<List<PassModel>>(
      '${ApiConstants.visits}/passes/mine',
      fromJsonT: (data) => (data as List)
          .map((e) => PassModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<PassModel>> cancelPass(String id) async {
    return _apiClient.post<PassModel>(
      '${ApiConstants.visits}/passes/$id/cancel',
      fromJsonT: (data) => PassModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The gate: the pass a scanned QR or typed code names.
  Future<ApiResponse<PassModel>> passByCode(String code) async {
    return _apiClient.get<PassModel>(
      '${ApiConstants.visits}/passes/code/${Uri.encodeComponent(code)}',
      fromJsonT: (data) => PassModel.fromJson(data as Map<String, dynamic>),
    );
  }

  /// The gate: passes by number plate, phone or ID number — or the code, typed.
  Future<ApiResponse<List<PassModel>>> findPasses(String query) async {
    return _apiClient.get<List<PassModel>>(
      '${ApiConstants.visits}/passes/find',
      queryParameters: {'q': query.trim()},
      fromJsonT: (data) => (data as List)
          .map((e) => PassModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// The gate lets the pass holder in. The ID number only where the estate takes one.
  Future<ApiResponse<CheckInResultModel>> admit(
    String passId, {
    String? idNumber,
    int? visitorCount,
    String? gateName,
  }) async {
    final id = idNumber?.trim() ?? '';
    return _apiClient.post<CheckInResultModel>(
      '${ApiConstants.visits}/passes/$passId/admit',
      data: {
        if (id.isNotEmpty) 'idType': 'NATIONAL_ID',
        if (id.isNotEmpty) 'idNumber': id,
        'visitorCount': ?visitorCount,
        if (gateName != null && gateName.isNotEmpty) 'gateName': gateName,
      },
      fromJsonT: (data) =>
          CheckInResultModel.fromJson(data as Map<String, dynamic>),
    );
  }

  static String _day(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// They have left. The gate's own action — `ROLE_VISIT_NEW`.
  Future<ApiResponse<VisitModel>> checkOut(String id) async {
    return _apiClient.post<VisitModel>(
      '${ApiConstants.visits}/$id/checkout',
      fromJsonT: (data) => VisitModel.fromJson(data as Map<String, dynamic>),
    );
  }
}
