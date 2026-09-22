import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'slip_result_model.freezed.dart';
part 'slip_result_model.g.dart';

/// What the bank says about a reference somebody is holding.
///
/// ## Confirming is the record
///
/// There is no payment to post afterwards. The confirmation writes the credit, and the estate
/// applies it from its statements screen — the same thing the web does, and the reason this sheet
/// stops at "Confirmed" rather than going on to take an amount. A tenant confirming their own slip
/// has told the office it exists, which is all they are in a position to do.
///
/// [paymentTypeName] is the answer to the question the form used to ask. Nobody picks which of an
/// estate's accounts the money went into any more; the confirmation establishes it.
@freezed
abstract class SlipResultModel with _$SlipResultModel {
  const SlipResultModel._();

  const factory SlipResultModel({
    @Default(false) bool valid,
    @Default('') String message,
    String? statementId,
    String? reference,
    @JsonKey(fromJson: parseDoubleNullable) double? amount,
    String? paidOn,
    String? payerName,

    /// `LOCAL` when the credit was already here, `GATEWAY` when the bank confirmed it just now.
    String? confirmedBy,
    String? paymentTypeId,
    String? paymentTypeName,
  }) = _SlipResultModel;

  factory SlipResultModel.fromJson(Map<String, dynamic> json) =>
      _$SlipResultModelFromJson(json);
}
