// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetreModel _$MetreModelFromJson(Map<String, dynamic> json) => _MetreModel(
  id: json['id'] as String?,
  meterNo: json['meterNo'] as String?,
  utilityChargeId: json['utilityChargeId'] as String?,
  chargeName: json['chargeName'] as String?,
  unitLabel: json['unitLabel'] as String?,
  rate: json['rate'] == null ? 0 : parseDouble(json['rate']),
  houseId: json['houseId'] as String?,
  houseCode: json['houseCode'] as String?,
  houseNumber: json['houseNumber'] as String?,
  houseLabel: json['houseLabel'] as String?,
  propertyName: json['propertyName'] as String?,
  estateName: json['estateName'] as String?,
  currentReading: json['currentReading'] == null
      ? 0
      : parseDouble(json['currentReading']),
  previousReading: json['previousReading'] == null
      ? 0
      : parseDouble(json['previousReading']),
  consumedUnits: json['consumedUnits'] == null
      ? 0
      : parseDouble(json['consumedUnits']),
  lastRate: json['lastRate'] == null ? 0 : parseDouble(json['lastRate']),
  lastAmount: json['lastAmount'] == null ? 0 : parseDouble(json['lastAmount']),
  lastReadPeriod: json['lastReadPeriod'] as String?,
  lastReadOn: json['lastReadOn'] as String?,
  readingDue: json['readingDue'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt() ?? 1,
  deactivationReason: json['deactivationReason'] as String?,
);

Map<String, dynamic> _$MetreModelToJson(_MetreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meterNo': instance.meterNo,
      'utilityChargeId': instance.utilityChargeId,
      'chargeName': instance.chargeName,
      'unitLabel': instance.unitLabel,
      'rate': instance.rate,
      'houseId': instance.houseId,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'houseLabel': instance.houseLabel,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'currentReading': instance.currentReading,
      'previousReading': instance.previousReading,
      'consumedUnits': instance.consumedUnits,
      'lastRate': instance.lastRate,
      'lastAmount': instance.lastAmount,
      'lastReadPeriod': instance.lastReadPeriod,
      'lastReadOn': instance.lastReadOn,
      'readingDue': instance.readingDue,
      'status': instance.status,
      'deactivationReason': instance.deactivationReason,
    };
