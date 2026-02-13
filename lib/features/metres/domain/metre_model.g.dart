// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetreModel _$MetreModelFromJson(Map<String, dynamic> json) => _MetreModel(
  id: json['id'] as String?,
  metreNo: json['metreNo'] as String?,
  billName: json['billName'] as String?,
  houseName: json['houseName'] as String?,
  property: json['property'] as String?,
  estate: json['estate'] as String?,
  previousReading: (json['previousReading'] as num?)?.toDouble() ?? 0,
  currentReading: (json['currentReading'] as num?)?.toDouble() ?? 0,
  consumedUnits: (json['consumedUnits'] as num?)?.toDouble() ?? 0,
  charge: (json['charge'] as num?)?.toDouble() ?? 0,
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  status: (json['status'] as num?)?.toInt() ?? 1,
  updatedOn: json['updatedOn'] as String?,
  imageStatus: (json['imageStatus'] as num?)?.toInt(),
  updatable: json['updatable'] as bool? ?? false,
  month: (json['month'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  monthName: json['monthName'] as String?,
  historyId: json['historyId'] as String?,
);

Map<String, dynamic> _$MetreModelToJson(_MetreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'metreNo': instance.metreNo,
      'billName': instance.billName,
      'houseName': instance.houseName,
      'property': instance.property,
      'estate': instance.estate,
      'previousReading': instance.previousReading,
      'currentReading': instance.currentReading,
      'consumedUnits': instance.consumedUnits,
      'charge': instance.charge,
      'amount': instance.amount,
      'status': instance.status,
      'updatedOn': instance.updatedOn,
      'imageStatus': instance.imageStatus,
      'updatable': instance.updatable,
      'month': instance.month,
      'year': instance.year,
      'monthName': instance.monthName,
      'historyId': instance.historyId,
    };
