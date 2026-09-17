import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'maintenance_models.freezed.dart';
part 'maintenance_models.g.dart';

/// A repair, as it appears in a list — the server's `RequestRow`, cut down.
///
/// **`RequestRow` has fifty fields and this carries about half.** The rest is the office's: SLA
/// timers, cost splits, assignee contact details, the expense a job became. Those belong on a
/// screen somebody works at, and putting them on a handset would be a worse copy of one that
/// already exists in the browser.
///
/// What is here is what this app's two audiences act on. A **tenant** raises a request, watches
/// it, comments and rates it. A **caretaker** sees what is theirs, comments and resolves.
@freezed
abstract class MaintenanceRequestModel with _$MaintenanceRequestModel {
  const MaintenanceRequestModel._();

  const factory MaintenanceRequestModel({
    required String id,

    /// The reference somebody quotes on the phone.
    required String requestRef,
    String? propertyName,
    String? houseCode,
    String? houseNumber,
    String? reporterName,
    String? categoryName,
    required String title,
    String? description,

    /// `LOW`, `NORMAL`, `HIGH`, `URGENT`.
    String? priority,

    /// The code — `SUBMITTED`, `ACKNOWLEDGED`, `ASSIGNED`, `IN_PROGRESS`, `ON_HOLD`, `RESOLVED`,
    /// `CLOSED`, `REJECTED`, `CANCELLED`.
    required String status,

    /// The same thing in the server's words, which is what gets shown. The app does not keep its
    /// own table of nine status names to fall out of step with.
    String? statusLabel,
    String? statusReason,
    String? assigneeName,
    String? submittedOn,
    String? acknowledgedOn,
    String? resolvedOn,
    String? closedOn,
    String? dueOn,

    /// Past its target and still open. The server works this out; a client comparing `dueOn` to
    /// its own clock would disagree with the office over a timezone.
    @Default(false) bool slaBreached,
    @Default(false) bool late,
    String? dueLabel,
    String? actionsTaken,
    String? resolutionNotes,
    int? tenantRating,
    String? tenantFeedback,

    /// Whether it is still live. Sent rather than derived from [status], so a status added on the
    /// server does not silently read as closed here.
    @Default(false) bool open,
  }) = _MaintenanceRequestModel;

  factory MaintenanceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRequestModelFromJson(json);

  /// The unit, as somebody would say it.
  String get unitLabel {
    final number = houseNumber;
    if (number != null && number.isNotEmpty) return number;
    return houseCode ?? '';
  }

  String get statusText =>
      (statusLabel?.isNotEmpty ?? false) ? statusLabel! : status;

  bool get isResolved => status == 'RESOLVED';
  bool get isClosed => status == 'CLOSED';

  /// A resolved job the tenant has not rated. The one prompt worth putting in front of them.
  bool get awaitingRating => (isResolved || isClosed) && tenantRating == null;
}

/// One request with everything said about it since it was raised.
@freezed
abstract class MaintenanceDetailModel with _$MaintenanceDetailModel {
  const MaintenanceDetailModel._();

  const factory MaintenanceDetailModel({
    required MaintenanceRequestModel request,

    /// Oldest first, as the server sends it — a repair reads forwards.
    @Default(<MaintenanceUpdateModel>[]) List<MaintenanceUpdateModel> timeline,
  }) = _MaintenanceDetailModel;

  factory MaintenanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceDetailModelFromJson(json);
}

/// One entry on a request's timeline: a comment, or a move between states.
@freezed
abstract class MaintenanceUpdateModel with _$MaintenanceUpdateModel {
  const MaintenanceUpdateModel._();

  const factory MaintenanceUpdateModel({
    required String id,

    /// `COMMENT`, `STATUS`, `ASSIGNMENT` — what kind of entry this is.
    String? updateType,
    String? fromLabel,
    String? toLabel,
    String? comment,

    /// Whether the tenant may see it. The server already withholds what they may not, so this is
    /// for labelling a staff-only note as one — not for deciding whether to render it.
    @Default(true) bool visibleToTenant,
    String? performedByName,
    String? performedOn,
  }) = _MaintenanceUpdateModel;

  factory MaintenanceUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceUpdateModelFromJson(json);

  bool get isStatusChange => updateType == 'STATUS' || toLabel != null;
}

/// What a request can be about.
@freezed
abstract class MaintenanceCategoryModel with _$MaintenanceCategoryModel {
  const MaintenanceCategoryModel._();

  const factory MaintenanceCategoryModel({
    required String id,
    required String name,
    String? defaultPriority,
    String? estateName,

    /// A category the platform ships, as opposed to one an estate added.
    @Default(false) bool platform,
    @Default(0) int status,
  }) = _MaintenanceCategoryModel;

  factory MaintenanceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceCategoryModelFromJson(json);
}

/// The counts a worklist header shows.
@freezed
abstract class MaintenanceWorkloadModel with _$MaintenanceWorkloadModel {
  const MaintenanceWorkloadModel._();

  const factory MaintenanceWorkloadModel({
    @JsonKey(fromJson: parseIntOrZero) @Default(0) int open,
    @JsonKey(fromJson: parseIntOrZero) @Default(0) int unassigned,
    @JsonKey(fromJson: parseIntOrZero) @Default(0) int late,
    @JsonKey(fromJson: parseIntOrZero) @Default(0) int awaitingClosure,
  }) = _MaintenanceWorkloadModel;

  factory MaintenanceWorkloadModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWorkloadModelFromJson(json);
}
