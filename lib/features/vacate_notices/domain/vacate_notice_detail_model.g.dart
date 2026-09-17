// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacate_notice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacateNoticeDetailModel _$VacateNoticeDetailModelFromJson(
  Map<String, dynamic> json,
) => _VacateNoticeDetailModel(
  notice: VacateNoticeModel.fromJson(json['notice'] as Map<String, dynamic>),
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => SettlementLineModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SettlementLineModel>[],
  nextStep: json['nextStep'] as String?,
  shortNotice: json['shortNotice'] == null
      ? null
      : ShortNoticeModel.fromJson(json['shortNotice'] as Map<String, dynamic>),
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PaymentModel>[],
);

Map<String, dynamic> _$VacateNoticeDetailModelToJson(
  _VacateNoticeDetailModel instance,
) => <String, dynamic>{
  'notice': instance.notice,
  'lines': instance.lines,
  'nextStep': instance.nextStep,
  'shortNotice': instance.shortNotice,
  'payments': instance.payments,
};

_SettlementLineModel _$SettlementLineModelFromJson(Map<String, dynamic> json) =>
    _SettlementLineModel(
      id: json['id'] as String?,
      source: json['source'] as String?,
      description: json['description'] as String,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      utilityBillId: json['utilityBillId'] as String?,
      reading: parseDoubleNullable(json['reading']),
    );

Map<String, dynamic> _$SettlementLineModelToJson(
  _SettlementLineModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'source': instance.source,
  'description': instance.description,
  'amount': instance.amount,
  'utilityBillId': instance.utilityBillId,
  'reading': instance.reading,
};

_ShortNoticeModel _$ShortNoticeModelFromJson(Map<String, dynamic> json) =>
    _ShortNoticeModel(
      required: (json['required'] as num?)?.toInt(),
      given: (json['given'] as num?)?.toInt() ?? 0,
      shortBy: (json['shortBy'] as num?)?.toInt() ?? 0,
      isShort: json['isShort'] as bool? ?? false,
      chargeable: json['chargeable'] as bool? ?? false,
      penalty: json['penalty'] as String?,
      suggestedAmount: json['suggestedAmount'] == null
          ? 0
          : parseDouble(json['suggestedAmount']),
      description: json['description'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$ShortNoticeModelToJson(_ShortNoticeModel instance) =>
    <String, dynamic>{
      'required': instance.required,
      'given': instance.given,
      'shortBy': instance.shortBy,
      'isShort': instance.isShort,
      'chargeable': instance.chargeable,
      'penalty': instance.penalty,
      'suggestedAmount': instance.suggestedAmount,
      'description': instance.description,
      'explanation': instance.explanation,
    };
