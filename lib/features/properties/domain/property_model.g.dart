// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    _PropertyModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      estateName: json['estateName'] as String?,
      estateId: (json['estateId'] as num?)?.toInt(),
      location: json['location'] as String?,
      floors: (json['floors'] as num?)?.toInt() ?? 0,
      units: (json['units'] as num?)?.toInt() ?? 0,
      occupied: (json['occupied'] as num?)?.toInt() ?? 0,
      categories: (json['categories'] as num?)?.toInt() ?? 0,
      features: (json['features'] as num?)?.toInt() ?? 0,
      email: json['email'] as String?,
      commission: (json['commission'] as num?)?.toDouble() ?? 0,
      createdOn: json['createdOn'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PropertyModelToJson(_PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'estateName': instance.estateName,
      'estateId': instance.estateId,
      'location': instance.location,
      'floors': instance.floors,
      'units': instance.units,
      'occupied': instance.occupied,
      'categories': instance.categories,
      'features': instance.features,
      'email': instance.email,
      'commission': instance.commission,
      'createdOn': instance.createdOn,
      'status': instance.status,
    };
