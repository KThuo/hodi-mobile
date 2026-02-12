// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => _HouseModel(
  id: (json['id'] as num).toInt(),
  houseName: json['houseName'] as String?,
  houseCode: json['houseCode'] as String?,
  houseNumber: json['houseNumber'] as String?,
  floor: (json['floor'] as num?)?.toInt() ?? 0,
  rent: (json['rent'] as num?)?.toDouble() ?? 0,
  squareFt: (json['squareFt'] as num?)?.toDouble(),
  propertyName: json['property'] as String?,
  estateName: json['estate'] as String?,
  categoryName: json['category'] as String?,
  typeName: json['houseType'] as String?,
  location: json['location'] as String?,
  occupied: json['occupied'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt() ?? 0,
  featureCount: (json['features'] as num?)?.toInt() ?? 0,
  imageFilename: json['imageFilename'] as String?,
);

Map<String, dynamic> _$HouseModelToJson(_HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseName': instance.houseName,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'floor': instance.floor,
      'rent': instance.rent,
      'squareFt': instance.squareFt,
      'property': instance.propertyName,
      'estate': instance.estateName,
      'category': instance.categoryName,
      'houseType': instance.typeName,
      'location': instance.location,
      'occupied': instance.occupied,
      'status': instance.status,
      'features': instance.featureCount,
      'imageFilename': instance.imageFilename,
    };
