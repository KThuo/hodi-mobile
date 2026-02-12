// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) =>
    _InvoiceModel(
      id: (json['id'] as num?)?.toInt(),
      rrn: json['rrn'] as String?,
      houseName: json['houseName'] as String?,
      houseCode: json['houseCode'] as String?,
      estate: json['estate'] as String?,
      property: json['property'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      monthName: json['monthName'] as String?,
      rentOwed: (json['rentOwed'] as num?)?.toDouble() ?? 0,
      rentPaid: (json['rentPaid'] as num?)?.toDouble() ?? 0,
      category: json['category'] as String?,
      houseType: json['houseType'] as String?,
      dueDate: json['dueDate'] as String?,
      paidOn: json['paidOn'] as String?,
      voidedOn: json['voidedOn'] as String?,
      status: json['status'] as String?,
      overdueEstate: json['overdueEstate'] as String?,
    );

Map<String, dynamic> _$InvoiceModelToJson(_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'houseName': instance.houseName,
      'houseCode': instance.houseCode,
      'estate': instance.estate,
      'property': instance.property,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'monthName': instance.monthName,
      'rentOwed': instance.rentOwed,
      'rentPaid': instance.rentPaid,
      'category': instance.category,
      'houseType': instance.houseType,
      'dueDate': instance.dueDate,
      'paidOn': instance.paidOn,
      'voidedOn': instance.voidedOn,
      'status': instance.status,
      'overdueEstate': instance.overdueEstate,
    };
