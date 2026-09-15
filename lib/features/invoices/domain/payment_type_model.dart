import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_model.freezed.dart';
part 'payment_type_model.g.dart';

/// A way to pay this invoice — `OfferedMethod` on the server.
///
/// ## The client stops deciding what a channel is called
///
/// This used to map type ids to names in a switch: `1` was Cash, `2` Cheque, `11` Bank Slip, `12`
/// the bank's own name. Every new channel meant editing the app, a channel the app did not know
/// read "Unknown", and the numbers meant whatever the database happened to say that week.
///
/// The server sends [name] — what to call it — and [renderAs] — which form to show. That is the
/// whole contract, and adding a channel is now a configuration change rather than a release.
@freezed
abstract class PaymentTypeModel with _$PaymentTypeModel {
  const PaymentTypeModel._();

  const factory PaymentTypeModel({
    /// Hashed. It goes back on the prompt, and is checked against what this invoice actually offers.
    String? id,
    String? name,

    /// `STK`, `VALIDATE`, `CASH`, `CHEQUE` or `TRANSFER`. Which form the pay screen should show.
    @Default('') String renderAs,
    String? bankName,
    String? bankLogoUrl,
    String? payBillNo,
    String? accountNo,
  }) = _PaymentTypeModel;

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeModelFromJson(json);

  String get displayName => name ?? bankName ?? 'Payment';

  /// A prompt to the payer's own handset: they type a number and approve with their own PIN.
  ///
  /// The only method open to somebody who is not signed in, which is why it is worth asking about
  /// by name — recording cash means saying it is in the drawer, and only somebody standing at the
  /// drawer can say that.
  bool get isPrompt => renderAs == 'STK';

  /// Shown rather than collected: the payer sends money themselves and quotes the account.
  bool get isTransfer => renderAs == 'TRANSFER' || renderAs == 'VALIDATE';

  IconData get icon {
    switch (renderAs) {
      case 'STK':
        return Icons.phone_iphone;
      case 'CASH':
        return Icons.payments_outlined;
      case 'CHEQUE':
        return Icons.receipt_long_outlined;
      case 'VALIDATE':
      case 'TRANSFER':
        return Icons.account_balance_outlined;
      default:
        return Icons.credit_card;
    }
  }

  /// The paybill and account, where there is one, as a line somebody can read down a phone.
  String? get accountLine {
    if (payBillNo == null || payBillNo!.isEmpty) return null;
    final account = accountNo == null || accountNo!.isEmpty ? '' : ' · Acct $accountNo';
    return 'Paybill $payBillNo$account';
  }
}
