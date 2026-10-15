// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PassModel _$PassModelFromJson(Map<String, dynamic> json) => _PassModel(
  id: json['id'] as String,
  passCode: json['passCode'] as String,
  state: json['state'] as String,
  stateLabel: json['stateLabel'] as String,
  validFrom: json['validFrom'] as String,
  validUntil: json['validUntil'] as String,
  visitorName: json['visitorName'] as String,
  visitorPhone: json['visitorPhone'] as String?,
  idType: json['idType'] as String?,
  idNumber: json['idNumber'] as String?,
  hasIdNumber: json['hasIdNumber'] as bool? ?? false,
  visitorCount: (json['visitorCount'] as num?)?.toInt() ?? 1,
  vehicleReg: json['vehicleReg'] as String?,
  purpose: json['purpose'] as String? ?? 'SOCIAL',
  purposeNotes: json['purposeNotes'] as String?,
  estateName: json['estateName'] as String?,
  propertyName: json['propertyName'] as String?,
  houseId: json['houseId'] as String?,
  unitLabel: json['unitLabel'] as String? ?? '',
  tenantName: json['tenantName'] as String?,
  cancelledOn: json['cancelledOn'] as String?,
  createdOn: json['createdOn'] as String?,
  admissions: (json['admissions'] as num?)?.toInt() ?? 0,
  openVisitId: json['openVisitId'] as String?,
  onSiteSince: json['onSiteSince'] as String?,
  admissible: json['admissible'] as bool? ?? false,
);

Map<String, dynamic> _$PassModelToJson(_PassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'passCode': instance.passCode,
      'state': instance.state,
      'stateLabel': instance.stateLabel,
      'validFrom': instance.validFrom,
      'validUntil': instance.validUntil,
      'visitorName': instance.visitorName,
      'visitorPhone': instance.visitorPhone,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
      'hasIdNumber': instance.hasIdNumber,
      'visitorCount': instance.visitorCount,
      'vehicleReg': instance.vehicleReg,
      'purpose': instance.purpose,
      'purposeNotes': instance.purposeNotes,
      'estateName': instance.estateName,
      'propertyName': instance.propertyName,
      'houseId': instance.houseId,
      'unitLabel': instance.unitLabel,
      'tenantName': instance.tenantName,
      'cancelledOn': instance.cancelledOn,
      'createdOn': instance.createdOn,
      'admissions': instance.admissions,
      'openVisitId': instance.openVisitId,
      'onSiteSince': instance.onSiteSince,
      'admissible': instance.admissible,
    };
