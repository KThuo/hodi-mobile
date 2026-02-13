// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantDetailModel _$TenantDetailModelFromJson(Map<String, dynamic> json) =>
    _TenantDetailModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      content: json['content'] == null
          ? null
          : TenantFinancialSummary.fromJson(
              json['content'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TenantDetailModelToJson(_TenantDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'content': instance.content,
    };

_TenantFinancialSummary _$TenantFinancialSummaryFromJson(
  Map<String, dynamic> json,
) => _TenantFinancialSummary(
  totalRent: json['totalRent'] == null ? 0 : _parseDouble(json['totalRent']),
  totalPayment: json['totalPayment'] == null
      ? 0
      : _parseDouble(json['totalPayment']),
  totalArrears: json['totalArrears'] == null
      ? 0
      : _parseDouble(json['totalArrears']),
  occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
  totalTopups: json['totalTopups'] == null
      ? 0
      : _parseDouble(json['totalTopups']),
  totalOverpayments: json['totalOverpayments'] == null
      ? 0
      : _parseDouble(json['totalOverpayments']),
);

Map<String, dynamic> _$TenantFinancialSummaryToJson(
  _TenantFinancialSummary instance,
) => <String, dynamic>{
  'totalRent': instance.totalRent,
  'totalPayment': instance.totalPayment,
  'totalArrears': instance.totalArrears,
  'occupiedUnits': instance.occupiedUnits,
  'totalTopups': instance.totalTopups,
  'totalOverpayments': instance.totalOverpayments,
};
