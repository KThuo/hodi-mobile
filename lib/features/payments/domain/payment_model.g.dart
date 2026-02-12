// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: (json['id'] as num?)?.toInt(),
      paymentRrn: json['paymentRrn'] as String?,
      invoiceRrn: json['invoiceRrn'] as String?,
      houseName: json['houseName'] as String?,
      houseCode: json['houseCode'] as String?,
      estate: json['estate'] as String?,
      property: json['property'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      monthName: json['monthName'] as String?,
      rentOwed: (json['rentOwed'] as num?)?.toDouble() ?? 0,
      rentPaid: (json['rentPaid'] as num?)?.toDouble() ?? 0,
      paidBy: json['paidBy'] as String?,
      paidOn: json['paidOn'] as String?,
      status: json['status'] as String?,
      paymentRef: json['paymentRef'] as String?,
      phoneNo: json['phoneNo'] as String?,
      category: json['category'] as String?,
      houseType: json['houseType'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentRrn': instance.paymentRrn,
      'invoiceRrn': instance.invoiceRrn,
      'houseName': instance.houseName,
      'houseCode': instance.houseCode,
      'estate': instance.estate,
      'property': instance.property,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'monthName': instance.monthName,
      'rentOwed': instance.rentOwed,
      'rentPaid': instance.rentPaid,
      'paidBy': instance.paidBy,
      'paidOn': instance.paidOn,
      'status': instance.status,
      'paymentRef': instance.paymentRef,
      'phoneNo': instance.phoneNo,
      'category': instance.category,
      'houseType': instance.houseType,
    };
