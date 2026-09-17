// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceDocumentModel _$InvoiceDocumentModelFromJson(
  Map<String, dynamic> json,
) => _InvoiceDocumentModel(
  rrn: json['rrn'] as String,
  invoiceType: json['invoiceType'] as String?,
  statusLabel: json['statusLabel'] as String?,
  periodLabel: json['periodLabel'] as String?,
  tenantName: json['tenantName'] as String?,
  tenantPhone: json['tenantPhone'] as String?,
  houseLabel: json['houseLabel'] as String?,
  houseCode: json['houseCode'] as String?,
  propertyName: json['propertyName'] as String?,
  estateName: json['estateName'] as String?,
  propertyLocation: json['propertyLocation'] as String?,
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => InvoiceDocumentLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <InvoiceDocumentLine>[],
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map(
            (e) => InvoiceDocumentPayment.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <InvoiceDocumentPayment>[],
  amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
  paidAmount: json['paidAmount'] == null ? 0 : parseDouble(json['paidAmount']),
  balanceDue: json['balanceDue'] == null ? 0 : parseDouble(json['balanceDue']),
  dueDate: json['dueDate'] as String?,
  issuedOn: json['issuedOn'] as String?,
  overdue: json['overdue'] as bool? ?? false,
  payable: json['payable'] as bool? ?? false,
  paymentInstructions: json['paymentInstructions'] as String?,
  footer: json['footer'] as String?,
);

Map<String, dynamic> _$InvoiceDocumentModelToJson(
  _InvoiceDocumentModel instance,
) => <String, dynamic>{
  'rrn': instance.rrn,
  'invoiceType': instance.invoiceType,
  'statusLabel': instance.statusLabel,
  'periodLabel': instance.periodLabel,
  'tenantName': instance.tenantName,
  'tenantPhone': instance.tenantPhone,
  'houseLabel': instance.houseLabel,
  'houseCode': instance.houseCode,
  'propertyName': instance.propertyName,
  'estateName': instance.estateName,
  'propertyLocation': instance.propertyLocation,
  'lines': instance.lines,
  'payments': instance.payments,
  'amount': instance.amount,
  'paidAmount': instance.paidAmount,
  'balanceDue': instance.balanceDue,
  'dueDate': instance.dueDate,
  'issuedOn': instance.issuedOn,
  'overdue': instance.overdue,
  'payable': instance.payable,
  'paymentInstructions': instance.paymentInstructions,
  'footer': instance.footer,
};

_InvoiceDocumentLine _$InvoiceDocumentLineFromJson(Map<String, dynamic> json) =>
    _InvoiceDocumentLine(
      kind: json['kind'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] == null ? 0 : parseDouble(json['quantity']),
      unitAmount: json['unitAmount'] == null
          ? 0
          : parseDouble(json['unitAmount']),
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
    );

Map<String, dynamic> _$InvoiceDocumentLineToJson(
  _InvoiceDocumentLine instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'description': instance.description,
  'quantity': instance.quantity,
  'unitAmount': instance.unitAmount,
  'amount': instance.amount,
};

_InvoiceDocumentPayment _$InvoiceDocumentPaymentFromJson(
  Map<String, dynamic> json,
) => _InvoiceDocumentPayment(
  narration: json['narration'] as String?,
  amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
);

Map<String, dynamic> _$InvoiceDocumentPaymentToJson(
  _InvoiceDocumentPayment instance,
) => <String, dynamic>{
  'narration': instance.narration,
  'amount': instance.amount,
};
