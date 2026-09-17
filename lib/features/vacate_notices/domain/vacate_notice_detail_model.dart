import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';
import '../../payments/domain/payment_model.dart';
import 'vacate_notice_model.dart';

part 'vacate_notice_detail_model.freezed.dart';
part 'vacate_notice_detail_model.g.dart';

/// One notice, with the settlement behind it — the server's `NoticeDetail`.
///
/// **It nests the row.** The server sends `{notice, lines, nextStep, shortNotice, payments}`, and
/// the model here expected all of that flattened into one object with legacy field names — so
/// every field resolved to null and the page rendered empty. No error, nothing on screen.
@freezed
abstract class VacateNoticeDetailModel with _$VacateNoticeDetailModel {
  const VacateNoticeDetailModel._();

  const factory VacateNoticeDetailModel({
    required VacateNoticeModel notice,

    /// The settlement, line by line — the deposit held, and everything coming off it.
    @Default(<SettlementLineModel>[]) List<SettlementLineModel> lines,

    /// What happens next, in the server's words.
    String? nextStep,

    /// Whether they gave enough notice, and what that costs if not.
    ShortNoticeModel? shortNotice,

    /// What has been paid against the settlement.
    @Default(<PaymentModel>[]) List<PaymentModel> payments,
  }) = _VacateNoticeDetailModel;

  factory VacateNoticeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VacateNoticeDetailModelFromJson(json);

  /// The deposit and anything else credited to the tenant.
  List<SettlementLineModel> get credits =>
      lines.where((l) => l.amount >= 0).toList();

  /// Everything coming off it.
  List<SettlementLineModel> get deductions =>
      lines.where((l) => l.amount < 0).toList();
}

/// One line of the settlement.
@freezed
abstract class SettlementLineModel with _$SettlementLineModel {
  const SettlementLineModel._();

  const factory SettlementLineModel({
    String? id,

    /// Where it came from — the deposit, a meter reading, rent owed, damage.
    String? source,
    required String description,

    /// Negative for a deduction, positive for something credited back.
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    String? utilityBillId,

    /// The meter reading behind a utility line, where there is one. Shown so a tenant can check
    /// the figure against the dial rather than take it on trust.
    @JsonKey(fromJson: parseDoubleNullable) double? reading,
  }) = _SettlementLineModel;

  factory SettlementLineModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementLineModelFromJson(json);

  bool get isDeduction => amount < 0;
}

/// Whether enough notice was given — the server's `ShortNoticeView`.
///
/// The server does the judging and the arithmetic, including whether a penalty applies at all and
/// what it would come to. It also sends an [explanation] in plain words, which is the thing to put
/// on screen: a tenant disputing a charge wants the reasoning, not the number.
@freezed
abstract class ShortNoticeModel with _$ShortNoticeModel {
  const ShortNoticeModel._();

  const factory ShortNoticeModel({
    /// Days the tenancy required. Null where none was agreed.
    int? required,

    /// Days actually given.
    @Default(0) int given,
    @Default(0) int shortBy,
    @Default(false) bool isShort,

    /// Whether the shortfall carries a charge. Short notice is not automatically chargeable —
    /// that is a property setting, and the server has read it.
    @Default(false) bool chargeable,
    String? penalty,
    @JsonKey(fromJson: parseDouble) @Default(0) double suggestedAmount,
    String? description,

    /// Why, in plain words. Shown rather than paraphrased.
    String? explanation,
  }) = _ShortNoticeModel;

  factory ShortNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$ShortNoticeModelFromJson(json);
}
