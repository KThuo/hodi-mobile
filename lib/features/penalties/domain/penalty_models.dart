import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'penalty_models.freezed.dart';
part 'penalty_models.g.dart';

/// A late-payment charge somebody has to decide about — the server's `ChargeRow`.
///
/// **Waived and reversed are not the same thing, and the model keeps them apart.** Waiving
/// forgives a charge that was correctly raised; reversing says it should never have been raised at
/// all. The server has two endpoints, two reasons and two sets of timestamps for exactly that
/// reason, and a screen that collapsed them into "cancelled" would lose the distinction the
/// records exist to preserve.
@freezed
abstract class PenaltyChargeModel with _$PenaltyChargeModel {
  const PenaltyChargeModel._();

  const factory PenaltyChargeModel({
    required String id,
    required String reference,
    String? ruleName,
    String? triggerOn,
    String? estateName,
    String? propertyName,
    String? houseCode,

    /// What the charge hangs off — an invoice, a vacate notice.
    String? sourceType,
    String? sourceRef,
    String? subjectName,

    /// What the rate was applied to.
    @JsonKey(fromJson: parseDouble) @Default(0) double baseAmount,

    /// `PERCENT` or `FIXED` — how [rate] should be read.
    String? basis,
    @JsonKey(fromJson: parseDouble) @Default(0) double rate,

    /// How many times this has happened. A third late month is a different conversation from a
    /// first, which is why the server counts rather than leaving it to be inferred.
    @Default(1) int occurrence,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    String? periodStart,
    String? periodEnd,

    /// How the figure was arrived at, in the server's words. Shown rather than recomputed — the
    /// arithmetic belongs to whoever set the rule.
    String? calculationNote,

    /// `PENDING`, `APPLIED`, `WAIVED`, `REVERSED`.
    required String status,

    /// Still awaiting a decision. Sent rather than derived from [status].
    @Default(false) bool open,
    @Default(false) bool waived,
    String? invoiceId,
    String? appliedOn,
    String? waivedBy,
    String? waivedOn,
    String? waiverReason,
    String? reversedBy,
    String? reversedOn,
    String? reversalReason,
    String? createdOn,
    String? createdBy,
  }) = _PenaltyChargeModel;

  factory PenaltyChargeModel.fromJson(Map<String, dynamic> json) =>
      _$PenaltyChargeModelFromJson(json);

  bool get pending => status == 'PENDING';
  bool get applied => status == 'APPLIED';
  bool get reversed => status == 'REVERSED';

  /// The status in words this screen owns, because the server sends a code here rather than a
  /// label. Unknown codes read as themselves rather than as a guess.
  String get statusLabel => switch (status) {
        'PENDING' => 'Awaiting a decision',
        'APPLIED' => 'On the invoice',
        'WAIVED' => 'Waived',
        'REVERSED' => 'Reversed',
        _ => status,
      };

  /// "5% of KES 45,000", or the flat figure where the rule is a fixed one.
  String get workingOut {
    final note = calculationNote;
    if (note != null && note.isNotEmpty) return note;
    if (basis == 'PERCENT' && baseAmount > 0) {
      return '${rate.toStringAsFixed(rate % 1 == 0 ? 0 : 1)}% of the balance';
    }
    return 'Fixed charge';
  }

  /// Why it was cancelled, whichever way it was. Null while it still stands.
  String? get decisionReason => waiverReason ?? reversalReason;
}
