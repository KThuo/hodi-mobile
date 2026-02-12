import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'invoice_detail_model.freezed.dart';
part 'invoice_detail_model.g.dart';

@freezed
abstract class InvoiceDetailModel with _$InvoiceDetailModel {
  const InvoiceDetailModel._();
  const factory InvoiceDetailModel({
    String? rrn,
    String? month,
    String? estateName,
    String? houseNumber,
    String? houseCode,
    String? date,
    String? location,
    String? propertyName,
    @JsonKey(fromJson: parseDouble) @Default(0) double invoiceAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double rentOwed,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,
    String? contactNo,
    String? contactEmail,
    String? status,
    @Default(0) int flag,
    String? tenantName,
    String? tenantPhone,
    String? tenantEmail,
    String? message,
    @JsonKey(name: 'bills') @Default([]) List<InvoiceLineItem> items,
    @Default(false) bool self,
    int? propertyId,
    int? estateId,
    int? id,
    String? currency,
    String? paymentInstructions,
    String? invoiceFooter,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);

  double get balance => rentOwed - paidAmount;
  bool get isPaid => status == 'PAID';
  bool get isVoided => status == 'VOIDED';
}

@freezed
abstract class InvoiceLineItem with _$InvoiceLineItem {
  const InvoiceLineItem._();
  const factory InvoiceLineItem({
    String? narration,
    @JsonKey(fromJson: parseDouble) @Default(0) double value,
  }) = _InvoiceLineItem;

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);
}
