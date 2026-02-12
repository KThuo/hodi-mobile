// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) =>
    _InvoiceDetailModel(
      rrn: json['rrn'] as String?,
      month: json['month'] as String?,
      estateName: json['estateName'] as String?,
      houseNumber: json['houseNumber'] as String?,
      houseCode: json['houseCode'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      propertyName: json['propertyName'] as String?,
      invoiceAmount: json['invoiceAmount'] == null
          ? 0
          : parseDouble(json['invoiceAmount']),
      rentOwed: json['rentOwed'] == null ? 0 : parseDouble(json['rentOwed']),
      paidAmount: json['paidAmount'] == null
          ? 0
          : parseDouble(json['paidAmount']),
      contactNo: json['contactNo'] as String?,
      contactEmail: json['contactEmail'] as String?,
      status: json['status'] as String?,
      flag: (json['flag'] as num?)?.toInt() ?? 0,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      tenantEmail: json['tenantEmail'] as String?,
      message: json['message'] as String?,
      items:
          (json['bills'] as List<dynamic>?)
              ?.map((e) => InvoiceLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      self: json['self'] as bool? ?? false,
      propertyId: (json['propertyId'] as num?)?.toInt(),
      estateId: (json['estateId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      paymentInstructions: json['paymentInstructions'] as String?,
      invoiceFooter: json['invoiceFooter'] as String?,
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(_InvoiceDetailModel instance) =>
    <String, dynamic>{
      'rrn': instance.rrn,
      'month': instance.month,
      'estateName': instance.estateName,
      'houseNumber': instance.houseNumber,
      'houseCode': instance.houseCode,
      'date': instance.date,
      'location': instance.location,
      'propertyName': instance.propertyName,
      'invoiceAmount': instance.invoiceAmount,
      'rentOwed': instance.rentOwed,
      'paidAmount': instance.paidAmount,
      'contactNo': instance.contactNo,
      'contactEmail': instance.contactEmail,
      'status': instance.status,
      'flag': instance.flag,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'tenantEmail': instance.tenantEmail,
      'message': instance.message,
      'bills': instance.items,
      'self': instance.self,
      'propertyId': instance.propertyId,
      'estateId': instance.estateId,
      'id': instance.id,
      'currency': instance.currency,
      'paymentInstructions': instance.paymentInstructions,
      'invoiceFooter': instance.invoiceFooter,
    };

_InvoiceLineItem _$InvoiceLineItemFromJson(Map<String, dynamic> json) =>
    _InvoiceLineItem(
      narration: json['narration'] as String?,
      value: json['value'] == null ? 0 : parseDouble(json['value']),
    );

Map<String, dynamic> _$InvoiceLineItemToJson(_InvoiceLineItem instance) =>
    <String, dynamic>{'narration': instance.narration, 'value': instance.value};
