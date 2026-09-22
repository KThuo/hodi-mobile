// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slip_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SlipResultModel _$SlipResultModelFromJson(Map<String, dynamic> json) =>
    _SlipResultModel(
      valid: json['valid'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      statementId: json['statementId'] as String?,
      reference: json['reference'] as String?,
      amount: parseDoubleNullable(json['amount']),
      paidOn: json['paidOn'] as String?,
      payerName: json['payerName'] as String?,
      confirmedBy: json['confirmedBy'] as String?,
      paymentTypeId: json['paymentTypeId'] as String?,
      paymentTypeName: json['paymentTypeName'] as String?,
    );

Map<String, dynamic> _$SlipResultModelToJson(_SlipResultModel instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'message': instance.message,
      'statementId': instance.statementId,
      'reference': instance.reference,
      'amount': instance.amount,
      'paidOn': instance.paidOn,
      'payerName': instance.payerName,
      'confirmedBy': instance.confirmedBy,
      'paymentTypeId': instance.paymentTypeId,
      'paymentTypeName': instance.paymentTypeName,
    };
