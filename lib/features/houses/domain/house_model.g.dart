// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => _HouseModel(
  id: json['id'] as String,
  houseCode: json['houseCode'] as String,
  houseNumber: json['houseNumber'] as String?,
  floor: (json['floor'] as num?)?.toInt(),
  mezzanine: json['mezzanine'] as bool? ?? false,
  floorLabel: json['floorLabel'] as String?,
  label: json['label'] as String?,
  propertyId: json['propertyId'] as String?,
  propertyName: json['propertyName'] as String?,
  estateId: json['estateId'] as String?,
  estateName: json['estateName'] as String?,
  categoryName: json['categoryName'] as String?,
  usageClassName: json['usageClassName'] as String?,
  tenure: json['tenure'] as String?,
  beds: (json['beds'] as num?)?.toInt(),
  baths: (json['baths'] as num?)?.toInt(),
  ensuite: (json['ensuite'] as num?)?.toInt(),
  dsq: json['dsq'] as bool? ?? false,
  parking: (json['parking'] as num?)?.toInt(),
  squareFt: (json['squareFt'] as num?)?.toDouble(),
  rent: (json['rent'] as num?)?.toDouble(),
  occupied: json['occupied'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt() ?? 0,
  createdOn: json['createdOn'] as String?,
);

Map<String, dynamic> _$HouseModelToJson(_HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'floor': instance.floor,
      'mezzanine': instance.mezzanine,
      'floorLabel': instance.floorLabel,
      'label': instance.label,
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'estateId': instance.estateId,
      'estateName': instance.estateName,
      'categoryName': instance.categoryName,
      'usageClassName': instance.usageClassName,
      'tenure': instance.tenure,
      'beds': instance.beds,
      'baths': instance.baths,
      'ensuite': instance.ensuite,
      'dsq': instance.dsq,
      'parking': instance.parking,
      'squareFt': instance.squareFt,
      'rent': instance.rent,
      'occupied': instance.occupied,
      'status': instance.status,
      'createdOn': instance.createdOn,
    };
