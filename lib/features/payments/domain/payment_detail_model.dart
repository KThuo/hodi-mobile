import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_detail_model.freezed.dart';
part 'payment_detail_model.g.dart';

@freezed
abstract class PaymentDetailModel with _$PaymentDetailModel {
  const PaymentDetailModel._();
  const factory PaymentDetailModel({
    String? paymentRrn,
    String? estateName,
    String? paidBy,
    @Default([]) List<PaymentLineItem> items,
  }) = _PaymentDetailModel;

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailModelFromJson(json);

  double get totalAmount => items.fold(0, (sum, item) => sum + item.value);
}

@freezed
abstract class PaymentLineItem with _$PaymentLineItem {
  const PaymentLineItem._();
  const factory PaymentLineItem({
    String? narration,
    @Default(0) double value,
  }) = _PaymentLineItem;

  factory PaymentLineItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentLineItemFromJson(json);
}
