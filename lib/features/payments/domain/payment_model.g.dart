// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: json['id'] as String?,
      rrn: json['rrn'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
      statusLabel: json['statusLabel'] as String?,
      method: json['method'] as String?,
      methodLabel: json['methodLabel'] as String?,
      arrivedAs: json['arrivedAs'] as String?,
      reference: json['reference'] as String?,
      tenantName: json['tenantName'] as String?,
      paidBy: json['paidBy'] as String?,
      payerPhone: json['payerPhone'] as String?,
      houseCode: json['houseCode'] as String?,
      houseNumber: json['houseNumber'] as String?,
      houseLabel: json['houseLabel'] as String?,
      propertyName: json['propertyName'] as String?,
      estateName: json['estateName'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      allocatedAmount: json['allocatedAmount'] == null
          ? 0
          : parseDouble(json['allocatedAmount']),
      unallocated: json['unallocated'] == null
          ? 0
          : parseDouble(json['unallocated']),
      invoiceCount: (json['invoiceCount'] as num?)?.toInt() ?? 0,
      invoiceRrn: json['invoiceRrn'] as String?,
      receivedOn: json['receivedOn'] as String?,
      narration: json['narration'] as String?,
      occupationId: json['occupationId'] as String?,
      houseId: json['houseId'] as String?,
      voidReason: json['voidReason'] as String?,
      categoryName: json['categoryName'] as String?,
      rentOwed: parseDoubleNullable(json['rentOwed']),
      rentOwedBefore: parseDoubleNullable(json['rentOwedBefore']),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'method': instance.method,
      'methodLabel': instance.methodLabel,
      'arrivedAs': instance.arrivedAs,
      'reference': instance.reference,
      'tenantName': instance.tenantName,
      'paidBy': instance.paidBy,
      'payerPhone': instance.payerPhone,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'houseLabel': instance.houseLabel,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'amount': instance.amount,
      'allocatedAmount': instance.allocatedAmount,
      'unallocated': instance.unallocated,
      'invoiceCount': instance.invoiceCount,
      'invoiceRrn': instance.invoiceRrn,
      'receivedOn': instance.receivedOn,
      'narration': instance.narration,
      'occupationId': instance.occupationId,
      'houseId': instance.houseId,
      'voidReason': instance.voidReason,
      'categoryName': instance.categoryName,
      'rentOwed': instance.rentOwed,
      'rentOwedBefore': instance.rentOwedBefore,
    };
