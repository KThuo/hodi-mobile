// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacant_house_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacantHouseDetailModel _$VacantHouseDetailModelFromJson(
  Map<String, dynamic> json,
) => _VacantHouseDetailModel(
  id: json['id'] as String?,
  houseName: json['houseName'] as String?,
  houseNumber: json['houseNumber'] as String?,
  houseCode: json['houseCode'] as String?,
  floor: parseIntNullable(json['floor']),
  description: json['description'] as String?,
  category: json['category'] as String?,
  houseType: json['houseType'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  property: json['property'] as String?,
  estate: json['estate'] as String?,
  rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
  squareFt: (json['squareFt'] as num?)?.toDouble(),
  featureCount: parseIntNullable(json['featureCount']),
  lastOccupied: json['lastOccupied'] as String?,
  imageUrl: json['imageUrl'] as String?,
  utilityBills:
      (json['utilityBills'] as List<dynamic>?)
          ?.map((e) => VacantHouseBill.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  onboardFees:
      (json['onboardFees'] as List<dynamic>?)
          ?.map((e) => VacantHouseBill.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalMonthlyBills: json['totalMonthlyBills'] == null
      ? 0
      : parseDouble(json['totalMonthlyBills']),
  totalOnboardFees: json['totalOnboardFees'] == null
      ? 0
      : parseDouble(json['totalOnboardFees']),
  maxRefundableAmount: json['maxRefundableAmount'] == null
      ? 0
      : parseDouble(json['maxRefundableAmount']),
  houseFeatures:
      (json['houseFeatures'] as List<dynamic>?)
          ?.map((e) => VacantHouseFeature.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  categoryImages:
      (json['categoryImages'] as List<dynamic>?)
          ?.map((e) => VacantHouseImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  contactName: json['contactName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  contactEmail: json['contactEmail'] as String?,
);

Map<String, dynamic> _$VacantHouseDetailModelToJson(
  _VacantHouseDetailModel instance,
) => <String, dynamic>{
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
  'utilityBills': instance.utilityBills,
  'onboardFees': instance.onboardFees,
  'totalMonthlyBills': instance.totalMonthlyBills,
  'totalOnboardFees': instance.totalOnboardFees,
  'maxRefundableAmount': instance.maxRefundableAmount,
  'houseFeatures': instance.houseFeatures,
  'categoryImages': instance.categoryImages,
  'contactName': instance.contactName,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
};

_VacantHouseBill _$VacantHouseBillFromJson(Map<String, dynamic> json) =>
    _VacantHouseBill(
      id: parseIntNullable(json['id']),
      name: json['name'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      isOnboard: json['isOnboard'] as bool? ?? false,
    );

Map<String, dynamic> _$VacantHouseBillToJson(_VacantHouseBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'isOnboard': instance.isOnboard,
    };

_VacantHouseFeature _$VacantHouseFeatureFromJson(Map<String, dynamic> json) =>
    _VacantHouseFeature(
      id: parseIntNullable(json['id']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$VacantHouseFeatureToJson(_VacantHouseFeature instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_VacantHouseImage _$VacantHouseImageFromJson(Map<String, dynamic> json) =>
    _VacantHouseImage(
      id: parseIntNullable(json['id']),
      filename: json['filename'] as String?,
      originalName: json['originalName'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$VacantHouseImageToJson(_VacantHouseImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'originalName': instance.originalName,
      'imageUrl': instance.imageUrl,
    };
