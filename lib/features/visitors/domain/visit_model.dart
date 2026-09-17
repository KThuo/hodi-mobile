import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_model.freezed.dart';
part 'visit_model.g.dart';

/// Somebody at the gate — the server's `VisitRow`.
///
/// ## The identity number is masked, and stays masked
///
/// `idNumber` arrives already masked; the real one is behind `GET /visits/{id}/id-number` and its
/// own authority, `ROLE_VISIT_REVEAL`. **Neither audience this app serves holds it**, and the app
/// does not ask — an identity document number is not something to pull onto a handset because a
/// screen had room for it. [hasIdNumber] says whether one was taken, which is the part that
/// matters at a gate.
@freezed
abstract class VisitModel with _$VisitModel {
  const VisitModel._();

  const factory VisitModel({
    required String id,
    required String visitRef,
    String? propertyName,
    String? houseCode,
    String? houseNumber,

    /// The unit as somebody reads it out — composed by the server, as everywhere else.
    String? unitLabel,
    String? tenantName,
    required String visitorName,
    String? visitorPhone,
    String? idType,

    /// **Already masked.** Never the number itself.
    String? idNumber,

    /// Whether identification was taken at all, which is the question a gate actually asks.
    @Default(false) bool hasIdNumber,
    @Default(1) int visitorCount,
    String? vehicleReg,
    String? vehicleMake,
    String? vehicleColour,
    String? purpose,
    String? purposeNotes,
    String? checkedInOn,
    String? checkedOutOn,
    int? dwellMinutes,

    /// How long they have been here, in the server's words.
    String? onSiteFor,
    @Default(false) bool onSite,

    /// `NOT_REQUIRED`, `PENDING`, `APPROVED`, `REJECTED`.
    required String approvalStatus,
    String? approvalDecidedOn,
    String? overrideReason,
    String? gateName,
    String? checkedInByName,
    String? checkedOutByName,
    @Default(0) int status,
  }) = _VisitModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) =>
      _$VisitModelFromJson(json);

  /// **The whole reason this screen exists.** Somebody is standing at the gate and the answer is
  /// yes or no.
  bool get awaitingDecision => approvalStatus == 'PENDING';

  bool get approved => approvalStatus == 'APPROVED';
  bool get rejected => approvalStatus == 'REJECTED';

  /// The unit, preferring what the server composed and never rendering an empty line.
  String get unit {
    final label = unitLabel;
    if (label != null && label.isNotEmpty) return label;
    final number = houseNumber;
    if (number != null && number.isNotEmpty) return number;
    return houseCode ?? '';
  }

  /// "2 people", or nothing where it is the one visitor a row already implies.
  String? get partyLabel =>
      visitorCount > 1 ? '$visitorCount people' : null;

  /// The vehicle in one line, or null where there is no vehicle — a gate reads a plate first and
  /// the make and colour only to confirm it.
  String? get vehicle {
    final reg = vehicleReg;
    if (reg == null || reg.isEmpty) return null;
    final rest = [
      if (vehicleColour != null && vehicleColour!.isNotEmpty) vehicleColour!,
      if (vehicleMake != null && vehicleMake!.isNotEmpty) vehicleMake!,
    ].join(' ');
    return rest.isEmpty ? reg : '$reg · $rest';
  }
}

/// What is happening on site right now.
@freezed
abstract class OnSiteSummaryModel with _$OnSiteSummaryModel {
  const OnSiteSummaryModel._();

  const factory OnSiteSummaryModel({
    @Default(0) int onSite,

    /// People waiting on somebody to say yes or no. The number this screen is for.
    @Default(0) int awaitingApproval,
  }) = _OnSiteSummaryModel;

  factory OnSiteSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OnSiteSummaryModelFromJson(json);
}


/// Somebody the gate has seen before — the server's `KnownVisitor`.
///
/// **The whole point of the check-in flow.** The first thing asked at a gate is a phone number,
/// and if that person has been here before their name, identification and vehicle are already on
/// file. Asking again is how one visitor becomes three spellings and a history that never joins
/// up — and it is a great deal of typing for somebody standing at a barrier.
///
/// Scoped like the visit list: it answers with visitors to properties the caller already holds.
/// An unscoped version would turn any phone number into a name for anybody who can open the gate
/// screen.
@freezed
abstract class KnownVisitorModel with _$KnownVisitorModel {
  const KnownVisitorModel._();

  const factory KnownVisitorModel({
    required String visitorName,
    String? visitorPhone,
    String? idType,
    String? idNumber,
    String? vehicleReg,

    /// How many times they have been. Worth showing: a regular is waved through, a first-timer
    /// is not.
    @Default(0) int visits,
    String? lastSeenOn,
  }) = _KnownVisitorModel;

  factory KnownVisitorModel.fromJson(Map<String, dynamic> json) =>
      _$KnownVisitorModelFromJson(json);
}

/// What happened when somebody was checked in — the server's `CheckInResult`.
///
/// `outcome` is the answer: admitted, waiting on the host, or barred. A barred visitor comes back
/// with a reason, and the gate needs to see it — that is the case the blocklist exists for.
@freezed
abstract class CheckInResultModel with _$CheckInResultModel {
  const CheckInResultModel._();

  const factory CheckInResultModel({
    VisitModel? visit,
    required String outcome,
    required String message,

    /// Why they are barred, where they are.
    String? barReason,
  }) = _CheckInResultModel;

  factory CheckInResultModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInResultModelFromJson(json);

  bool get barred => outcome == 'BARRED' || barReason != null;
  bool get admitted => outcome == 'ADMITTED';
  bool get awaitingHost => outcome == 'PENDING' || outcome == 'AWAITING_APPROVAL';
}
