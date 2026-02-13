// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantModel _$TenantModelFromJson(Map<String, dynamic> json) => _TenantModel(
  id: (json['id'] as num?)?.toInt(),
  houseCode: json['houseCode'] as String?,
  houseName: json['houseName'] as String?,
  tenantName: json['tenantName'] as String?,
  tenantPhone: json['tenantPhone'] as String?,
  category: json['category'] as String?,
  estate: json['estate'] as String?,
  property: json['property'] as String?,
  houseType: json['houseType'] as String?,
  rentOwed: (json['rentOwed'] as num?)?.toDouble() ?? 0,
  dueDate: json['dueDate'] as String?,
  houseId: (json['houseId'] as num?)?.toInt(),
  propertyId: (json['propertyId'] as num?)?.toInt(),
  rent: (json['rent'] as num?)?.toDouble() ?? 0,
  payDate: json['payDate'] as String?,
  userId: json['userId'] as String?,
  self: json['self'] as bool? ?? false,
);

Map<String, dynamic> _$TenantModelToJson(_TenantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseCode': instance.houseCode,
      'houseName': instance.houseName,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'category': instance.category,
      'estate': instance.estate,
      'property': instance.property,
      'houseType': instance.houseType,
      'rentOwed': instance.rentOwed,
      'dueDate': instance.dueDate,
      'houseId': instance.houseId,
      'propertyId': instance.propertyId,
      'rent': instance.rent,
      'payDate': instance.payDate,
      'userId': instance.userId,
      'self': instance.self,
    };
