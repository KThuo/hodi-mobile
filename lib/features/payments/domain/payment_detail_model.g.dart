// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetailModel _$PaymentDetailModelFromJson(Map<String, dynamic> json) =>
    _PaymentDetailModel(
      paymentRrn: json['rrn'] as String?,
      invoiceRrn: json['invoiceRrn'] as String?,
      month: json['month'] as String?,
      estateName: json['estateName'] as String?,
      houseNumber: json['houseNumber'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      propertyName: json['propertyName'] as String?,
      invoiceAmount: json['invoiceAmount'] == null
          ? 0
          : parseDouble(json['invoiceAmount']),
      paidAmount: json['paidAmount'] == null
          ? 0
          : parseDouble(json['paidAmount']),
      rentOwed: json['rentOwed'] == null ? 0 : parseDouble(json['rentOwed']),
      contactNo: json['contactNo'] as String?,
      contactEmail: json['contactEmail'] as String?,
      status: json['status'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      tenantEmail: json['tenantEmail'] as String?,
      paidBy: json['paidBy'] as String?,
      paymentType: json['paymentType'] as String?,
      items:
          (json['bills'] as List<dynamic>?)
              ?.map((e) => PaymentLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PaymentDetailModelToJson(_PaymentDetailModel instance) =>
    <String, dynamic>{
      'rrn': instance.paymentRrn,
      'invoiceRrn': instance.invoiceRrn,
      'month': instance.month,
      'estateName': instance.estateName,
      'houseNumber': instance.houseNumber,
      'date': instance.date,
      'location': instance.location,
      'propertyName': instance.propertyName,
      'invoiceAmount': instance.invoiceAmount,
      'paidAmount': instance.paidAmount,
      'rentOwed': instance.rentOwed,
      'contactNo': instance.contactNo,
      'contactEmail': instance.contactEmail,
      'status': instance.status,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'tenantEmail': instance.tenantEmail,
      'paidBy': instance.paidBy,
      'paymentType': instance.paymentType,
      'bills': instance.items,
      'currency': instance.currency,
    };

_PaymentLineItem _$PaymentLineItemFromJson(Map<String, dynamic> json) =>
    _PaymentLineItem(
      narration: json['narration'] as String?,
      value: json['value'] == null ? 0 : parseDouble(json['value']),
    );

Map<String, dynamic> _$PaymentLineItemToJson(_PaymentLineItem instance) =>
    <String, dynamic>{'narration': instance.narration, 'value': instance.value};
