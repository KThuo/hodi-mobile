import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'vacate_notice_model.freezed.dart';
part 'vacate_notice_model.g.dart';

/// Somebody giving notice to leave — the server's `NoticeRow`.
///
/// The figures here are the **settlement**: what is owed, what deposit is held, what is being
/// deducted, and what is left over either way. They are nullable until a settlement has been
/// worked out, and a null is not a nought — "not yet calculated" and "nothing owed" are different
/// answers, and the screen says which.
@freezed
abstract class VacateNoticeModel with _$VacateNoticeModel {
  const VacateNoticeModel._();

  const factory VacateNoticeModel({
    required String id,
    required String reference,
    String? occupationId,
    String? houseId,
    required String houseCode,
    String? houseNumber,
    String? houseLabel,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    String? tenantUserId,
    required String tenantName,
    String? tenantPhone,
    String? tenantEmail,

    /// Who gave the notice — the tenant, or the office on their behalf.
    String? raisedBy,
    String? raisedByName,
    String? vacateDate,
    String? reason,

    /// `PENDING`, `APPROVED`, `REJECTED`, `CANCELLED`.
    required String status,
    String? decidedByName,
    String? decidedOn,
    String? decisionNotes,

    // ── The settlement ─────────────────────────────────────────────────────
    @JsonKey(fromJson: parseDoubleNullable) double? rentOwed,
    @JsonKey(fromJson: parseDoubleNullable) double? refundableDeposit,
    @JsonKey(fromJson: parseDoubleNullable) double? totalDeductions,

    /// Positive means money goes back to the tenant; negative means they still owe.
    @JsonKey(fromJson: parseDoubleNullable) double? netAmount,
    String? settlementType,
    @Default(false) bool settled,
    String? settledOn,
    String? paymentStatus,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalPaid,
    @JsonKey(fromJson: parseDouble) @Default(0) double balanceRemaining,
    @Default(false) bool refundConfirmed,
    String? refundReference,
    String? unpaidHandling,
    String? unpaidNotes,
    @JsonKey(fromJson: parseDoubleNullable) double? unpaidAmount,
    @Default(false) bool processed,
    String? processedOn,
    String? processedByName,

    /// Counted by the server. Negative means the date has passed.
    @Default(0) int daysToVacate,

    /// What happens next, in the server's words. The single most useful line on the screen, and
    /// the app does not try to work it out for itself.
    String? nextStep,
    String? createdOn,
    String? updatedOn,
  }) = _VacateNoticeModel;

  factory VacateNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$VacateNoticeModelFromJson(json);

  String get unit => (houseLabel?.isNotEmpty ?? false) ? houseLabel! : houseCode;

  bool get pending => status == 'PENDING';
  bool get approved => status == 'APPROVED';
  bool get rejected => status == 'REJECTED';
  bool get cancelled => status == 'CANCELLED';

  String get statusLabel => switch (status) {
        'PENDING' => 'Awaiting a decision',
        'APPROVED' => 'Approved',
        'REJECTED' => 'Rejected',
        'CANCELLED' => 'Cancelled',
        _ => status,
      };

  /// Whether a settlement has been worked out at all. Until it has, every money field is null and
  /// the screen should say so rather than print a column of noughts.
  bool get hasSettlement => netAmount != null;

  /// Money going back to the tenant, as opposed to money they still owe.
  bool get isRefund => (netAmount ?? 0) > 0;

  /// Already gone. A notice whose date has passed and which is not yet processed is the one worth
  /// chasing, which is why this is separate from [daysToVacate].
  bool get overdue => daysToVacate < 0 && !processed;
}
