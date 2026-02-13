// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacant_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacantHouseModel _$VacantHouseModelFromJson(Map<String, dynamic> json) =>
    _VacantHouseModel(
      id: json['id'] as String?,
      houseName: json['houseName'] as String?,
      houseNumber: json['houseNumber'] as String?,
      houseCode: json['houseCode'] as String?,
      floor: (json['floor'] as num?)?.toInt() ?? 0,
      description: json['description'] as String?,
      category: json['category'] as String?,
      houseType: json['houseType'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      property: json['property'] as String?,
      estate: json['estate'] as String?,
      rent: (json['rent'] as num?)?.toDouble() ?? 0,
      squareFt: (json['squareFt'] as num?)?.toDouble(),
      featureCount: (json['featureCount'] as num?)?.toInt() ?? 0,
      lastOccupied: json['lastOccupied'] as String?,
      imageUrl: json['imageUrl'] as String?,
      distanceText: json['distanceText'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VacantHouseModelToJson(_VacantHouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseName': instance.houseName,
      'houseNumber': instance.houseNumber,
      'houseCode': instance.houseCode,
      'floor': instance.floor,
      'description': instance.description,
      'category': instance.category,
      'houseType': instance.houseType,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'property': instance.property,
      'estate': instance.estate,
      'rent': instance.rent,
      'squareFt': instance.squareFt,
      'featureCount': instance.featureCount,
      'lastOccupied': instance.lastOccupied,
      'imageUrl': instance.imageUrl,
      'distanceText': instance.distanceText,
      'distance': instance.distance,
    };
