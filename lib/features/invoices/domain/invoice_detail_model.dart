import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_detail_model.freezed.dart';
part 'invoice_detail_model.g.dart';

@freezed
abstract class InvoiceDetailModel with _$InvoiceDetailModel {
  const InvoiceDetailModel._();
  const factory InvoiceDetailModel({
    String? rrn,
    @Default(0) double invoiceAmount,
    @Default([]) List<InvoiceLineItem> items,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);
}

@freezed
abstract class InvoiceLineItem with _$InvoiceLineItem {
  const InvoiceLineItem._();
  const factory InvoiceLineItem({
    String? narration,
    @Default(0) double value,
  }) = _InvoiceLineItem;

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);
}
