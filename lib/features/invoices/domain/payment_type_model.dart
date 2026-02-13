import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_model.freezed.dart';
part 'payment_type_model.g.dart';

@freezed
abstract class PaymentTypeModel with _$PaymentTypeModel {
  const PaymentTypeModel._();
  const factory PaymentTypeModel({
    String? typeId,
    String? bankId,
    String? name,
  }) = _PaymentTypeModel;

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeModelFromJson(json);

  String get displayName {
    switch (typeId) {
      case '1':
        return 'Cash';
      case '2':
        return 'Cheque';
      case '11':
        return 'Bank Slip';
      case '12':
        return _bankName;
      default:
        return name ?? 'Unknown';
    }
  }

  IconLabel get iconLabel {
    switch (typeId) {
      case '1':
        return IconLabel.cash;
      case '2':
        return IconLabel.cheque;
      case '11':
        return IconLabel.bankSlip;
      case '12':
        return IconLabel.bank;
      default:
        return IconLabel.cash;
    }
  }

  String get _bankName {
    switch (bankId) {
      case '1':
        return 'KCB';
      case '2':
        return 'Equity';
      case '3':
        return 'Absa';
      case '4':
        return 'Co-op';
      case '5':
        return 'Family';
      default:
        return 'Bank Deposit';
    }
  }
}

enum IconLabel { cash, cheque, bankSlip, bank }
