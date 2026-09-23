// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metre_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetreHistoryModel _$MetreHistoryModelFromJson(Map<String, dynamic> json) =>
    _MetreHistoryModel(
      id: json['id'] as String?,
      meterId: json['meterId'] as String?,
      meterNo: json['meterNo'] as String?,
      chargeName: json['chargeName'] as String?,
      unitLabel: json['unitLabel'] as String?,
      previousReading: json['previousReading'] == null
          ? 0
          : parseDouble(json['previousReading']),
      currentReading: json['currentReading'] == null
          ? 0
          : parseDouble(json['currentReading']),
      consumedUnits: json['consumedUnits'] == null
          ? 0
          : parseDouble(json['consumedUnits']),
      rate: json['rate'] == null ? 0 : parseDouble(json['rate']),
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      periodLabel: json['periodLabel'] as String?,
      readOn: json['readOn'] as String?,
      note: json['note'] as String?,
      invoiceRrn: json['invoiceRrn'] as String?,
      billed: json['billed'] as bool? ?? false,
      hasPhoto: json['hasPhoto'] as bool? ?? false,
    );

Map<String, dynamic> _$MetreHistoryModelToJson(_MetreHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meterId': instance.meterId,
      'meterNo': instance.meterNo,
      'chargeName': instance.chargeName,
      'unitLabel': instance.unitLabel,
      'previousReading': instance.previousReading,
      'currentReading': instance.currentReading,
      'consumedUnits': instance.consumedUnits,
      'rate': instance.rate,
      'amount': instance.amount,
      'periodLabel': instance.periodLabel,
      'readOn': instance.readOn,
      'note': instance.note,
      'invoiceRrn': instance.invoiceRrn,
      'billed': instance.billed,
      'hasPhoto': instance.hasPhoto,
    };

_MetreHistoryPage _$MetreHistoryPageFromJson(Map<String, dynamic> json) =>
    _MetreHistoryPage(
      year: (json['year'] as num?)?.toInt() ?? 0,
      years:
          (json['years'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      readings:
          (json['readings'] as List<dynamic>?)
              ?.map(
                (e) => MetreHistoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <MetreHistoryModel>[],
    );

Map<String, dynamic> _$MetreHistoryPageToJson(_MetreHistoryPage instance) =>
    <String, dynamic>{
      'year': instance.year,
      'years': instance.years,
      'readings': instance.readings,
    };
