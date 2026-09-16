import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// One receipt — `PaymentRow` on the server.
///
/// ## Money received, and where it went
///
/// Legacy carried `rentOwed` and `rentPaid` on a *payment*, which read as though a receipt had an
/// invoice's fields. A payment has one figure of its own — [amount], what arrived — and then a
/// question the invoice cannot answer: how much of it found an invoice to sit against.
///
/// That is [allocatedAmount] and [unallocated], and the pair matters. Money can arrive before the
/// invoice it is for, or exceed it; the remainder is a credit standing on the tenancy rather than an
/// error. A screen that showed only [amount] could not tell a receipt that settled something from
/// one still waiting to.
@freezed
abstract class PaymentModel with _$PaymentModel {
  const PaymentModel._();

  const factory PaymentModel({
    /// Hashed and salted per user. Opaque.
    String? id,

    /// The receipt number, which is what a tenant quotes.
    String? rrn,
    @Default(0) int status,
    String? statusLabel,

    /// `CASH`, `STK`, `TRANSFER` — the machine-readable channel.
    String? method,

    /// The channel in words, from the server, which is what gets shown.
    String? methodLabel,

    /// What a person calls how this money arrived — "Lipa na KCB", "Cash".
    ///
    /// The configured account's own name where there was one, and the method's label otherwise.
    /// Not the same as [methodLabel]: a payer who queued at a bank counter says the bank's name,
    /// not "Bank transfer", and a receipt that argues with them is a receipt they will query.
    String? arrivedAs,

    /// The payer's own reference — an M-PESA code, a cheque number, a slip.
    String? reference,
    String? tenantName,
    String? paidBy,
    String? payerPhone,
    String? houseCode,
    String? houseNumber,
    String? houseLabel,
    String? propertyName,
    String? estateName,

    /// What arrived.
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,

    /// How much of it was put against invoices.
    @JsonKey(fromJson: parseDouble) @Default(0) double allocatedAmount,

    /// What is still standing as credit on the tenancy.
    @JsonKey(fromJson: parseDouble) @Default(0) double unallocated,

    /// How many invoices it was spread across. One payment can settle several months.
    @Default(0) int invoiceCount,

    /// The invoice it was aimed at, where it was aimed at one.
    String? invoiceRrn,
    String? receivedOn,
    String? narration,
    String? occupationId,
    String? houseId,
    String? voidReason,

    /// The unit's category — "Two bedroom", "Shop". Shown to a tenant, who knows their unit by what
    /// it is rather than by its code.
    String? categoryName,

    /// What the tenancy owed after this payment, and before it.
    ///
    /// Carried on the receipt because that is the question a tenant asks next, and answering it
    /// from a balance fetched later would show what they owe *now* rather than what this payment
    /// left them owing.
    /// Nullable, because "not recorded" is not "nothing owed" — see [parseDoubleNullable].
    @JsonKey(fromJson: parseDoubleNullable) double? rentOwed,
    @JsonKey(fromJson: parseDoubleNullable) double? rentOwedBefore,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  bool get isVoided => status == 4;

  /// Money that arrived and has nowhere to be. Worth saying out loud on a row: it is not lost, but
  /// somebody has to decide where it goes.
  bool get hasCredit => unallocated > 0;

  /// The unit as somebody would say it, falling back to the code.
  String get unitLabel => houseLabel ?? houseCode ?? '';

  String get channel => arrivedAs ?? methodLabel ?? method ?? '';

  /// True once the server has said what the tenancy owed on either side of this payment.
  ///
  /// Both are nullable on the wire — an older payment may carry neither — and a receipt that
  /// printed "Balance before: KES 0.00" where it simply does not know would be stating a fact it
  /// has not got.
  bool get showsTheArithmetic => rentOwedBefore != null || rentOwed != null;
}
