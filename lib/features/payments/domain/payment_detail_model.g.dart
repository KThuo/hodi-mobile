// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetailModel _$PaymentDetailModelFromJson(Map<String, dynamic> json) =>
    _PaymentDetailModel(
      paymentRrn: json['paymentRrn'] as String?,
      estateName: json['estateName'] as String?,
      paidBy: json['paidBy'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => PaymentLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PaymentDetailModelToJson(_PaymentDetailModel instance) =>
    <String, dynamic>{
      'paymentRrn': instance.paymentRrn,
      'estateName': instance.estateName,
      'paidBy': instance.paidBy,
      'items': instance.items,
    };

_PaymentLineItem _$PaymentLineItemFromJson(Map<String, dynamic> json) =>
    _PaymentLineItem(
      narration: json['narration'] as String?,
      value: (json['value'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PaymentLineItemToJson(_PaymentLineItem instance) =>
    <String, dynamic>{'narration': instance.narration, 'value': instance.value};
