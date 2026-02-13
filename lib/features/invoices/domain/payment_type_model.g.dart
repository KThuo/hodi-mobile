// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentTypeModel _$PaymentTypeModelFromJson(Map<String, dynamic> json) =>
    _PaymentTypeModel(
      typeId: json['typeId'] as String?,
      bankId: json['bankId'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PaymentTypeModelToJson(_PaymentTypeModel instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'bankId': instance.bankId,
      'name': instance.name,
    };
