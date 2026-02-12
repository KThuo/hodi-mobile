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
  floor: json['floor'] as String?,
  rent: (json['rent'] as num?)?.toDouble() ?? 0,
  squareFt: json['squareFt'] as String?,
  propertyName: json['propertyName'] as String?,
  estateName: json['estateName'] as String?,
  categoryName: json['categoryName'] as String?,
  typeName: json['typeName'] as String?,
  location: json['location'] as String?,
  occupied: json['occupied'] as bool? ?? false,
  status: json['status'] as String?,
  featureCount: (json['featureCount'] as num?)?.toInt() ?? 0,
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
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'categoryName': instance.categoryName,
      'typeName': instance.typeName,
      'location': instance.location,
      'occupied': instance.occupied,
      'status': instance.status,
      'featureCount': instance.featureCount,
      'imageFilename': instance.imageFilename,
    };
