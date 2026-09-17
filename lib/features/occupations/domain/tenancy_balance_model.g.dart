// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenancy_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenancyBalanceModel _$TenancyBalanceModelFromJson(Map<String, dynamic> json) =>
    _TenancyBalanceModel(
      occupationId: json['occupationId'] as String?,
      houseCode: json['houseCode'] as String?,
      houseNumber: json['houseNumber'] as String?,
      tenantName: json['tenantName'] as String?,
      outstanding: json['outstanding'] == null
          ? 0
          : parseDouble(json['outstanding']),
      creditInHand: json['creditInHand'] == null
          ? 0
          : parseDouble(json['creditInHand']),
      invoices:
          (json['invoices'] as List<dynamic>?)
              ?.map(
                (e) => OutstandingInvoice.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <OutstandingInvoice>[],
    );

Map<String, dynamic> _$TenancyBalanceModelToJson(
  _TenancyBalanceModel instance,
) => <String, dynamic>{
  'occupationId': instance.occupationId,
  'houseCode': instance.houseCode,
  'houseNumber': instance.houseNumber,
  'tenantName': instance.tenantName,
  'outstanding': instance.outstanding,
  'creditInHand': instance.creditInHand,
  'invoices': instance.invoices,
};

_OutstandingInvoice _$OutstandingInvoiceFromJson(Map<String, dynamic> json) =>
    _OutstandingInvoice(
      id: json['id'] as String,
      rrn: json['rrn'] as String,
      periodLabel: json['periodLabel'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      outstanding: json['outstanding'] == null
          ? 0
          : parseDouble(json['outstanding']),
      dueDate: json['dueDate'] as String?,
      overdue: json['overdue'] as bool? ?? false,
    );

Map<String, dynamic> _$OutstandingInvoiceToJson(_OutstandingInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'periodLabel': instance.periodLabel,
      'amount': instance.amount,
      'outstanding': instance.outstanding,
      'dueDate': instance.dueDate,
      'overdue': instance.overdue,
    };
