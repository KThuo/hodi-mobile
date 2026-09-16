// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StayModel _$StayModelFromJson(Map<String, dynamic> json) => _StayModel(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  categoryName: json['categoryName'] as String?,
  propertyName: json['propertyName'] as String?,
  area: json['area'] as String?,
  nightlyRate: parseDoubleNullable(json['nightlyRate']),
  stayTotal: parseDoubleNullable(json['stayTotal']),
  nights: (json['nights'] as num?)?.toInt(),
  bedrooms: (json['bedrooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  sleeps: (json['sleeps'] as num?)?.toInt(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  distanceKm: (json['distanceKm'] as num?)?.toDouble(),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  imageCount: (json['imageCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$StayModelToJson(_StayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryName': instance.categoryName,
      'propertyName': instance.propertyName,
      'area': instance.area,
      'nightlyRate': instance.nightlyRate,
      'stayTotal': instance.stayTotal,
      'nights': instance.nights,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'sleeps': instance.sleeps,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceKm': instance.distanceKm,
      'images': instance.images,
      'imageCount': instance.imageCount,
    };
