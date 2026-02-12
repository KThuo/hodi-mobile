// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseDetailModel _$HouseDetailModelFromJson(Map<String, dynamic> json) =>
    _HouseDetailModel(
      houseName: json['houseName'] as String?,
      houseCode: json['houseCode'] as String?,
      floor: (json['floor'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      isOccupied: json['occupied'] as bool? ?? false,
      rent: (json['rent'] as num?)?.toDouble() ?? 0,
      location: json['location'] as String?,
      squareFt: (json['squareFt'] as num?)?.toDouble(),
      property: json['property'] as String?,
      category: json['category'] as String?,
      houseType: json['houseType'] as String?,
      estate: json['estate'] as String?,
      tenant: json['tenant'] == null
          ? null
          : HouseTenant.fromJson(json['tenant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HouseDetailModelToJson(_HouseDetailModel instance) =>
    <String, dynamic>{
      'houseName': instance.houseName,
      'houseCode': instance.houseCode,
      'floor': instance.floor,
      'status': instance.status,
      'occupied': instance.isOccupied,
      'rent': instance.rent,
      'location': instance.location,
      'squareFt': instance.squareFt,
      'property': instance.property,
      'category': instance.category,
      'houseType': instance.houseType,
      'estate': instance.estate,
      'tenant': instance.tenant,
    };

_HouseTenant _$HouseTenantFromJson(Map<String, dynamic> json) => _HouseTenant(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  rentOwed: (json['rentOwed'] as num?)?.toDouble() ?? 0,
  invoiceRrn: json['invoiceRrn'] as String?,
  invoiceMonth: json['invoiceMonth'] as String?,
  dueDate: json['dueDate'] as String?,
  occupiedOn: json['occupiedOn'] as String?,
  refundableAmount: (json['refundableAmount'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$HouseTenantToJson(_HouseTenant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'rentOwed': instance.rentOwed,
      'invoiceRrn': instance.invoiceRrn,
      'invoiceMonth': instance.invoiceMonth,
      'dueDate': instance.dueDate,
      'occupiedOn': instance.occupiedOn,
      'refundableAmount': instance.refundableAmount,
    };
