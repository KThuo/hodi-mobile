// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentTypeModel _$PaymentTypeModelFromJson(Map<String, dynamic> json) =>
    _PaymentTypeModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      renderAs: json['renderAs'] as String? ?? '',
      bankName: json['bankName'] as String?,
      bankLogoUrl: json['bankLogoUrl'] as String?,
      payBillNo: json['payBillNo'] as String?,
      accountNo: json['accountNo'] as String?,
    );

Map<String, dynamic> _$PaymentTypeModelToJson(_PaymentTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'renderAs': instance.renderAs,
      'bankName': instance.bankName,
      'bankLogoUrl': instance.bankLogoUrl,
      'payBillNo': instance.payBillNo,
      'accountNo': instance.accountNo,
    };
