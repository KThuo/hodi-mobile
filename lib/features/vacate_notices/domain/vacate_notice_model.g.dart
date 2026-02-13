// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacate_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacateNoticeModel _$VacateNoticeModelFromJson(Map<String, dynamic> json) =>
    _VacateNoticeModel(
      id: json['id'] as String?,
      rrn: json['rrn'] as String?,
      houseName: json['houseName'] as String?,
      houseCode: json['houseCode'] as String?,
      houseNumber: json['houseNumber'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      tenantEmail: json['tenantEmail'] as String?,
      propertyName: json['propertyName'] as String?,
      propertyId: parseIntNullable(json['propertyId']),
      estateName: json['estateName'] as String?,
      estateId: parseIntNullable(json['estateId']),
      vacateDate: json['vacateDate'] as String?,
      reason: json['reason'] as String?,
      flag: json['flag'] as String?,
      status: parseIntNullable(json['status']),
      initiatedBy: json['initiatedBy'] as String?,
      initiatedByName: json['initiatedByName'] as String?,
      settlementType: json['settlementType'] as String?,
      netAmount: json['netAmount'] == null ? 0 : parseDouble(json['netAmount']),
      totalPaid: json['totalPaid'] == null ? 0 : parseDouble(json['totalPaid']),
      createdOn: json['createdOn'] as String?,
    );

Map<String, dynamic> _$VacateNoticeModelToJson(_VacateNoticeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rrn': instance.rrn,
      'houseName': instance.houseName,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'tenantEmail': instance.tenantEmail,
      'propertyName': instance.propertyName,
      'propertyId': instance.propertyId,
      'estateName': instance.estateName,
      'estateId': instance.estateId,
      'vacateDate': instance.vacateDate,
      'reason': instance.reason,
      'flag': instance.flag,
      'status': instance.status,
      'initiatedBy': instance.initiatedBy,
      'initiatedByName': instance.initiatedByName,
      'settlementType': instance.settlementType,
      'netAmount': instance.netAmount,
      'totalPaid': instance.totalPaid,
      'createdOn': instance.createdOn,
    };
