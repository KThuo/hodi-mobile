// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) =>
    _InvoiceDetailModel(
      rrn: json['rrn'] as String?,
      invoiceAmount: (json['invoiceAmount'] as num?)?.toDouble() ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => InvoiceLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(_InvoiceDetailModel instance) =>
    <String, dynamic>{
      'rrn': instance.rrn,
      'invoiceAmount': instance.invoiceAmount,
      'items': instance.items,
    };

_InvoiceLineItem _$InvoiceLineItemFromJson(Map<String, dynamic> json) =>
    _InvoiceLineItem(
      narration: json['narration'] as String?,
      value: (json['value'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$InvoiceLineItemToJson(_InvoiceLineItem instance) =>
    <String, dynamic>{'narration': instance.narration, 'value': instance.value};
