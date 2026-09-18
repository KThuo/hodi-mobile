// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacant_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacantHouseModel _$VacantHouseModelFromJson(Map<String, dynamic> json) =>
    _VacantHouseModel(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      categoryName: json['categoryName'] as String?,
      propertyName: json['propertyName'] as String?,
      area: json['area'] as String?,
      rent: parseDoubleNullable(json['rent']),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      squareFt: parseDoubleNullable(json['squareFt']),
      dsq: json['dsq'] as bool? ?? false,
      parkingSpaces: (json['parkingSpaces'] as num?)?.toInt(),
      floorLabel: json['floorLabel'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm: parseDoubleNullable(json['distanceKm']),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      imageCount: (json['imageCount'] as num?)?.toInt() ?? 0,
      availableFrom: json['availableFrom'] as String?,
    );

Map<String, dynamic> _$VacantHouseModelToJson(_VacantHouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryName': instance.categoryName,
      'propertyName': instance.propertyName,
      'area': instance.area,
      'rent': instance.rent,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'squareFt': instance.squareFt,
      'dsq': instance.dsq,
      'parkingSpaces': instance.parkingSpaces,
      'floorLabel': instance.floorLabel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceKm': instance.distanceKm,
      'images': instance.images,
      'imageCount': instance.imageCount,
      'availableFrom': instance.availableFrom,
    };
