// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lease_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaseModel _$LeaseModelFromJson(Map<String, dynamic> json) => _LeaseModel(
  id: json['id'] as String,
  tenantName: json['tenantName'] as String,
  tenantPhone: json['tenantPhone'] as String?,
  houseCode: json['houseCode'] as String,
  houseLabel: json['houseLabel'] as String?,
  propertyName: json['propertyName'] as String?,
  estateName: json['estateName'] as String?,
  tenure: json['tenure'] as String?,
  rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
  dueDay: (json['dueDay'] as num?)?.toInt(),
  occupiedOn: json['occupiedOn'] as String?,
  expiresOn: json['expiresOn'] as String?,
  daysToExpiry: (json['daysToExpiry'] as num?)?.toInt(),
  noticeDays: (json['noticeDays'] as num?)?.toInt(),
  documents: (json['documents'] as num?)?.toInt() ?? 0,
  term: json['term'] as String?,
);

Map<String, dynamic> _$LeaseModelToJson(_LeaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'houseCode': instance.houseCode,
      'houseLabel': instance.houseLabel,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'tenure': instance.tenure,
      'rent': instance.rent,
      'dueDay': instance.dueDay,
      'occupiedOn': instance.occupiedOn,
      'expiresOn': instance.expiresOn,
      'daysToExpiry': instance.daysToExpiry,
      'noticeDays': instance.noticeDays,
      'documents': instance.documents,
      'term': instance.term,
    };

_LeaseDetailModel _$LeaseDetailModelFromJson(
  Map<String, dynamic> json,
) => _LeaseDetailModel(
  id: json['id'] as String,
  tenantName: json['tenantName'] as String,
  tenantPhone: json['tenantPhone'] as String?,
  houseCode: json['houseCode'] as String,
  houseLabel: json['houseLabel'] as String?,
  houseId: json['houseId'] as String?,
  propertyId: json['propertyId'] as String?,
  propertyName: json['propertyName'] as String?,
  estateName: json['estateName'] as String?,
  tenure: json['tenure'] as String?,
  rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
  deposit: json['deposit'] == null ? 0 : parseDouble(json['deposit']),
  refundableDeposit: json['refundableDeposit'] == null
      ? 0
      : parseDouble(json['refundableDeposit']),
  dueDay: (json['dueDay'] as num?)?.toInt(),
  occupiedOn: json['occupiedOn'] as String?,
  expiresOn: json['expiresOn'] as String?,
  daysToExpiry: (json['daysToExpiry'] as num?)?.toInt(),
  noticeDays: (json['noticeDays'] as num?)?.toInt(),
  specialConditions: json['specialConditions'] as String?,
  term: json['term'] as String?,
  tenantCanView: json['tenantCanView'] as bool? ?? false,
  agreementApplies: json['agreementApplies'] as bool? ?? false,
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => LeaseDocumentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LeaseDocumentModel>[],
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => LeaseTermChangeModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LeaseTermChangeModel>[],
);

Map<String, dynamic> _$LeaseDetailModelToJson(_LeaseDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'houseCode': instance.houseCode,
      'houseLabel': instance.houseLabel,
      'houseId': instance.houseId,
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'tenure': instance.tenure,
      'rent': instance.rent,
      'deposit': instance.deposit,
      'refundableDeposit': instance.refundableDeposit,
      'dueDay': instance.dueDay,
      'occupiedOn': instance.occupiedOn,
      'expiresOn': instance.expiresOn,
      'daysToExpiry': instance.daysToExpiry,
      'noticeDays': instance.noticeDays,
      'specialConditions': instance.specialConditions,
      'term': instance.term,
      'tenantCanView': instance.tenantCanView,
      'agreementApplies': instance.agreementApplies,
      'documents': instance.documents,
      'history': instance.history,
    };

_LeaseDocumentModel _$LeaseDocumentModelFromJson(Map<String, dynamic> json) =>
    _LeaseDocumentModel(
      id: json['id'] as String,
      kind: json['kind'] as String?,
      title: json['title'] as String?,
      fileName: json['fileName'] as String?,
      contentType: json['contentType'] as String?,
      byteSize: json['byteSize'] == null ? 0 : parseIntOrZero(json['byteSize']),
      superseded: json['superseded'] as bool? ?? false,
      uploadedOn: json['uploadedOn'] as String?,
      uploadedBy: json['uploadedBy'] as String?,
    );

Map<String, dynamic> _$LeaseDocumentModelToJson(_LeaseDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'title': instance.title,
      'fileName': instance.fileName,
      'contentType': instance.contentType,
      'byteSize': instance.byteSize,
      'superseded': instance.superseded,
      'uploadedOn': instance.uploadedOn,
      'uploadedBy': instance.uploadedBy,
    };

_LeaseTermChangeModel _$LeaseTermChangeModelFromJson(
  Map<String, dynamic> json,
) => _LeaseTermChangeModel(
  id: json['id'] as String,
  changeType: json['changeType'] as String?,
  effectiveOn: json['effectiveOn'] as String?,
  rentBefore: parseDoubleNullable(json['rentBefore']),
  rentAfter: parseDoubleNullable(json['rentAfter']),
  dueDayBefore: (json['dueDayBefore'] as num?)?.toInt(),
  dueDayAfter: (json['dueDayAfter'] as num?)?.toInt(),
  expiresBefore: json['expiresBefore'] as String?,
  expiresAfter: json['expiresAfter'] as String?,
  reason: json['reason'] as String?,
  recordedOn: json['recordedOn'] as String?,
  recordedBy: json['recordedBy'] as String?,
);

Map<String, dynamic> _$LeaseTermChangeModelToJson(
  _LeaseTermChangeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'changeType': instance.changeType,
  'effectiveOn': instance.effectiveOn,
  'rentBefore': instance.rentBefore,
  'rentAfter': instance.rentAfter,
  'dueDayBefore': instance.dueDayBefore,
  'dueDayAfter': instance.dueDayAfter,
  'expiresBefore': instance.expiresBefore,
  'expiresAfter': instance.expiresAfter,
  'reason': instance.reason,
  'recordedOn': instance.recordedOn,
  'recordedBy': instance.recordedBy,
};
