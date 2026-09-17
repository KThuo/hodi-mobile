// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseDetailModel _$HouseDetailModelFromJson(Map<String, dynamic> json) =>
    _HouseDetailModel(
      id: json['id'] as String,
      houseCode: json['houseCode'] as String,
      houseNumber: json['houseNumber'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
      mezzanine: json['mezzanine'] as bool? ?? false,
      floorLabel: json['floorLabel'] as String?,
      propertyId: json['propertyId'] as String?,
      propertyName: json['propertyName'] as String?,
      estateId: json['estateId'] as String?,
      estateName: json['estateName'] as String?,
      location: json['location'] as String?,
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
      lastOccupied: json['lastOccupied'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdOn: json['createdOn'] as String?,
      features:
          (json['features'] as List<dynamic>?)
              ?.map((e) => NamedRef.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <NamedRef>[],
      pending:
          (json['pending'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$HouseDetailModelToJson(_HouseDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'floor': instance.floor,
      'mezzanine': instance.mezzanine,
      'floorLabel': instance.floorLabel,
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'estateId': instance.estateId,
      'estateName': instance.estateName,
      'location': instance.location,
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
      'lastOccupied': instance.lastOccupied,
      'status': instance.status,
      'createdOn': instance.createdOn,
      'features': instance.features,
      'pending': instance.pending,
    };
