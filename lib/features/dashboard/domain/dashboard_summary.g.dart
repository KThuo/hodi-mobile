// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) =>
    _DashboardSummary(
      totalInvoice: (json['totalInvoice'] as num?)?.toDouble() ?? 0,
      totalRent: (json['totalRent'] as num?)?.toDouble() ?? 0,
      totalPayment: (json['totalPayment'] as num?)?.toDouble() ?? 0,
      totalExpense: (json['totalExpense'] as num?)?.toDouble() ?? 0,
      totalArrears: (json['totalArrears'] as num?)?.toDouble() ?? 0,
      totalOverpayments: (json['totalOverpayments'] as num?)?.toDouble() ?? 0,
      totalTopups: (json['totalTopups'] as num?)?.toDouble() ?? 0,
      totalClearedAmount: (json['totalClearedAmount'] as num?)?.toDouble() ?? 0,
      totalCredit: (json['totalCredit'] as num?)?.toDouble() ?? 0,
      totalForfeited: (json['totalForfeited'] as num?)?.toDouble() ?? 0,
      properties: (json['properties'] as num?)?.toInt(),
      totalUnits: (json['totalUnits'] as num?)?.toInt(),
      occupiedUnits: (json['occupiedUnits'] as num?)?.toInt(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$DashboardSummaryToJson(_DashboardSummary instance) =>
    <String, dynamic>{
      'totalInvoice': instance.totalInvoice,
      'totalRent': instance.totalRent,
      'totalPayment': instance.totalPayment,
      'totalExpense': instance.totalExpense,
      'totalArrears': instance.totalArrears,
      'totalOverpayments': instance.totalOverpayments,
      'totalTopups': instance.totalTopups,
      'totalClearedAmount': instance.totalClearedAmount,
      'totalCredit': instance.totalCredit,
      'totalForfeited': instance.totalForfeited,
      'properties': instance.properties,
      'totalUnits': instance.totalUnits,
      'occupiedUnits': instance.occupiedUnits,
      'label': instance.label,
    };
