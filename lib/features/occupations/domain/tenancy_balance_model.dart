import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'tenancy_balance_model.freezed.dart';
part 'tenancy_balance_model.g.dart';

/// What a tenancy owes — the server's `TenancyBalance`.
///
/// *What do I owe* is the question somebody opens their tenancy to answer, so it is answered
/// above the tabs rather than left to be worked out from a list of invoices.
@freezed
abstract class TenancyBalanceModel with _$TenancyBalanceModel {
  const TenancyBalanceModel._();
  const factory TenancyBalanceModel({
    String? occupationId,
    String? houseCode,
    String? houseNumber,
    String? tenantName,
    @JsonKey(fromJson: parseDouble) @Default(0) double outstanding,

    /// Credit already received and not yet applied. Held separately from [outstanding] rather
    /// than netted off, because "you owe 4,000 and we are holding 1,000" is two facts and
    /// showing only the difference loses one of them.
    @JsonKey(fromJson: parseDouble) @Default(0) double creditInHand,
    @Default(<OutstandingInvoice>[]) List<OutstandingInvoice> invoices,
  }) = _TenancyBalanceModel;

  factory TenancyBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TenancyBalanceModelFromJson(json);

  bool get settled => outstanding <= 0;
}

@freezed
abstract class OutstandingInvoice with _$OutstandingInvoice {
  const OutstandingInvoice._();
  const factory OutstandingInvoice({
    required String id,
    required String rrn,
    String? periodLabel,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    @JsonKey(fromJson: parseDouble) @Default(0) double outstanding,
    String? dueDate,
    @Default(false) bool overdue,
  }) = _OutstandingInvoice;

  factory OutstandingInvoice.fromJson(Map<String, dynamic> json) =>
      _$OutstandingInvoiceFromJson(json);
}
