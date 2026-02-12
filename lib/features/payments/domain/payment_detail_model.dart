import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'payment_detail_model.freezed.dart';
part 'payment_detail_model.g.dart';

@freezed
abstract class PaymentDetailModel with _$PaymentDetailModel {
  const PaymentDetailModel._();
  const factory PaymentDetailModel({
    @JsonKey(name: 'rrn') String? paymentRrn,
    String? invoiceRrn,
    String? month,
    String? estateName,
    String? houseNumber,
    String? date,
    String? location,
    String? propertyName,
    @JsonKey(fromJson: parseDouble) @Default(0) double invoiceAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double rentOwed,
    String? contactNo,
    String? contactEmail,
    String? status,
    String? tenantName,
    String? tenantPhone,
    String? tenantEmail,
    String? paidBy,
    String? paymentType,
    @JsonKey(name: 'bills') @Default([]) List<PaymentLineItem> items,
    String? currency,
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
    @JsonKey(fromJson: parseDouble) @Default(0) double value,
  }) = _PaymentLineItem;

  factory PaymentLineItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentLineItemFromJson(json);
}
