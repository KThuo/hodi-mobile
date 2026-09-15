// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) =>
    _InvoiceModel(
      id: json['id'] as String?,
      rrn: json['rrn'] as String?,
      invoiceType: json['invoiceType'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
      statusLabel: json['statusLabel'] as String?,
      periodLabel: json['periodLabel'] as String?,
      periodMonth: (json['periodMonth'] as num?)?.toInt() ?? 0,
      periodYear: (json['periodYear'] as num?)?.toInt() ?? 0,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      houseCode: json['houseCode'] as String?,
      houseNumber: json['houseNumber'] as String?,
      houseLabel: json['houseLabel'] as String?,
      propertyName: json['propertyName'] as String?,
      estateName: json['estateName'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      paidAmount: json['paidAmount'] == null
          ? 0
          : parseDouble(json['paidAmount']),
      outstanding: json['outstanding'] == null
          ? 0
          : parseDouble(json['outstanding']),
      dueDate: json['dueDate'] as String?,
      issuedOn: json['issuedOn'] as String?,
      paidOn: json['paidOn'] as String?,
      overdue: json['overdue'] as bool? ?? false,
      occupationId: json['occupationId'] as String?,
      houseId: json['houseId'] as String?,
    );

Map<String, dynamic> _$InvoiceModelToJson(_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'invoiceType': instance.invoiceType,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'periodLabel': instance.periodLabel,
      'periodMonth': instance.periodMonth,
      'periodYear': instance.periodYear,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'houseLabel': instance.houseLabel,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'amount': instance.amount,
      'paidAmount': instance.paidAmount,
      'outstanding': instance.outstanding,
      'dueDate': instance.dueDate,
      'issuedOn': instance.issuedOn,
      'paidOn': instance.paidOn,
      'overdue': instance.overdue,
      'occupationId': instance.occupationId,
      'houseId': instance.houseId,
    };
