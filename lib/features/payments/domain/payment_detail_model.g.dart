// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetailModel _$PaymentDetailModelFromJson(Map<String, dynamic> json) =>
    _PaymentDetailModel(
      payment: PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
      allocations:
          (json['allocations'] as List<dynamic>?)
              ?.map(
                (e) => PaymentAllocation.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      tenantPhone: json['tenantPhone'] as String?,
      tenantEmail: json['tenantEmail'] as String?,
      propertyLocation: json['propertyLocation'] as String?,
      voidReason: json['voidReason'] as String?,
      voidedBy: json['voidedBy'] as String?,
      voidedOn: json['voidedOn'] as String?,
    );

Map<String, dynamic> _$PaymentDetailModelToJson(_PaymentDetailModel instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'allocations': instance.allocations,
      'tenantPhone': instance.tenantPhone,
      'tenantEmail': instance.tenantEmail,
      'propertyLocation': instance.propertyLocation,
      'voidReason': instance.voidReason,
      'voidedBy': instance.voidedBy,
      'voidedOn': instance.voidedOn,
    };

_PaymentAllocation _$PaymentAllocationFromJson(Map<String, dynamic> json) =>
    _PaymentAllocation(
      invoiceId: json['invoiceId'] as String?,
      invoiceRrn: json['invoiceRrn'] as String?,
      periodLabel: json['periodLabel'] as String?,
      invoiceAmount: json['invoiceAmount'] == null
          ? 0
          : parseDouble(json['invoiceAmount']),
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
    );

Map<String, dynamic> _$PaymentAllocationToJson(_PaymentAllocation instance) =>
    <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'invoiceRrn': instance.invoiceRrn,
      'periodLabel': instance.periodLabel,
      'invoiceAmount': instance.invoiceAmount,
      'amount': instance.amount,
    };
