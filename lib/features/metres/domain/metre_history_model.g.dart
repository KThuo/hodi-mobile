// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metre_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetreHistoryModel _$MetreHistoryModelFromJson(Map<String, dynamic> json) =>
    _MetreHistoryModel(
      id: json['id'] as String?,
      rrn: json['rrn'] as String?,
      monthName: json['monthName'] as String?,
      property: json['property'] as String?,
      estate: json['estate'] as String?,
      previousReading: (json['previousReading'] as num?)?.toDouble() ?? 0,
      currentReading: (json['currentReading'] as num?)?.toDouble() ?? 0,
      consumedUnits: (json['consumedUnits'] as num?)?.toDouble() ?? 0,
      charge: (json['charge'] as num?)?.toDouble() ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      updatedOn: json['updatedOn'] as String?,
      imageStatus: (json['imageStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetreHistoryModelToJson(_MetreHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'monthName': instance.monthName,
      'property': instance.property,
      'estate': instance.estate,
      'previousReading': instance.previousReading,
      'currentReading': instance.currentReading,
      'consumedUnits': instance.consumedUnits,
      'charge': instance.charge,
      'amount': instance.amount,
      'updatedOn': instance.updatedOn,
      'imageStatus': instance.imageStatus,
    };
