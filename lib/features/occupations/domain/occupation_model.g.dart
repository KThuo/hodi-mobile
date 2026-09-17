// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OccupationModel _$OccupationModelFromJson(Map<String, dynamic> json) =>
    _OccupationModel(
      id: json['id'] as String,
      tenantUserId: json['tenantUserId'] as String?,
      tenantName: json['tenantName'] as String?,
      tenantPhone: json['tenantPhone'] as String?,
      tenantIsOrganisation: json['tenantIsOrganisation'] as bool? ?? false,
      houseId: json['houseId'] as String,
      houseCode: json['houseCode'] as String,
      houseNumber: json['houseNumber'] as String?,
      houseLabel: json['houseLabel'] as String?,
      propertyId: json['propertyId'] as String?,
      propertyName: json['propertyName'] as String?,
      estateId: json['estateId'] as String?,
      estateName: json['estateName'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      usageClassName: json['usageClassName'] as String?,
      tenure: json['tenure'] as String?,
      rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
      deposit: json['deposit'] == null ? 0 : parseDouble(json['deposit']),
      refundableDeposit: json['refundableDeposit'] == null
          ? 0
          : parseDouble(json['refundableDeposit']),
      rentOwed: json['rentOwed'] == null ? 0 : parseDouble(json['rentOwed']),
      dueDay: (json['dueDay'] as num?)?.toInt(),
      nextDueOn: json['nextDueOn'] as String?,
      occupiedOn: json['occupiedOn'] as String?,
      expiresOn: json['expiresOn'] as String?,
      daysToExpiry: (json['daysToExpiry'] as num?)?.toInt(),
      noticeDays: (json['noticeDays'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdOn: json['createdOn'] as String?,
    );

Map<String, dynamic> _$OccupationModelToJson(_OccupationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantUserId': instance.tenantUserId,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'tenantIsOrganisation': instance.tenantIsOrganisation,
      'houseId': instance.houseId,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'houseLabel': instance.houseLabel,
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'estateId': instance.estateId,
      'estateName': instance.estateName,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'usageClassName': instance.usageClassName,
      'tenure': instance.tenure,
      'rent': instance.rent,
      'deposit': instance.deposit,
      'refundableDeposit': instance.refundableDeposit,
      'rentOwed': instance.rentOwed,
      'dueDay': instance.dueDay,
      'nextDueOn': instance.nextDueOn,
      'occupiedOn': instance.occupiedOn,
      'expiresOn': instance.expiresOn,
      'daysToExpiry': instance.daysToExpiry,
      'noticeDays': instance.noticeDays,
      'status': instance.status,
      'createdOn': instance.createdOn,
    };
