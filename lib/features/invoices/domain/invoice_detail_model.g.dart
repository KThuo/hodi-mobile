// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) =>
    _InvoiceDetailModel(
      invoice: InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
      lines:
          (json['lines'] as List<dynamic>?)
              ?.map((e) => InvoiceLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map(
                (e) => InvoicePaymentLine.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      broughtForward: json['broughtForward'] == null
          ? 0
          : parseDouble(json['broughtForward']),
      totalPayable: json['totalPayable'] == null
          ? 0
          : parseDouble(json['totalPayable']),
      voidReason: json['voidReason'] as String?,
      voidedBy: json['voidedBy'] as String?,
      voidedOn: json['voidedOn'] as String?,
      paymentInstructions: json['paymentInstructions'] as String?,
      footer: json['footer'] as String?,
    );

Map<String, dynamic> _$InvoiceDetailModelToJson(_InvoiceDetailModel instance) =>
    <String, dynamic>{
      'invoice': instance.invoice,
      'lines': instance.lines,
      'payments': instance.payments,
      'broughtForward': instance.broughtForward,
      'totalPayable': instance.totalPayable,
      'voidReason': instance.voidReason,
      'voidedBy': instance.voidedBy,
      'voidedOn': instance.voidedOn,
      'paymentInstructions': instance.paymentInstructions,
      'footer': instance.footer,
    };

_InvoicePaymentLine _$InvoicePaymentLineFromJson(Map<String, dynamic> json) =>
    _InvoicePaymentLine(
      narration: json['narration'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
    );

Map<String, dynamic> _$InvoicePaymentLineToJson(_InvoicePaymentLine instance) =>
    <String, dynamic>{
      'narration': instance.narration,
      'amount': instance.amount,
    };

_InvoiceLineItem _$InvoiceLineItemFromJson(Map<String, dynamic> json) =>
    _InvoiceLineItem(
      kind: json['kind'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] == null ? 0 : parseDouble(json['quantity']),
      unitAmount: json['unitAmount'] == null
          ? 0
          : parseDouble(json['unitAmount']),
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
    );

Map<String, dynamic> _$InvoiceLineItemToJson(_InvoiceLineItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'description': instance.description,
      'quantity': instance.quantity,
      'unitAmount': instance.unitAmount,
      'amount': instance.amount,
    };
