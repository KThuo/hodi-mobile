import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
abstract class PaymentModel with _$PaymentModel {
  const PaymentModel._();
  const factory PaymentModel({
    int? id,
    String? paymentRrn,
    String? invoiceRrn,
    String? houseName,
    String? houseCode,
    String? estate,
    String? property,
    String? tenantName,
    String? tenantPhone,
    String? monthName,
    @Default(0) double rentOwed,
    @Default(0) double rentPaid,
    String? paidBy,
    String? paidOn,
    String? status,
    String? paymentRef,
    String? phoneNo,
    String? category,
    String? houseType,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
