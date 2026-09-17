// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacant_house_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VacantHouseDetailModel _$VacantHouseDetailModelFromJson(
  Map<String, dynamic> json,
) => _VacantHouseDetailModel(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  categoryName: json['categoryName'] as String?,
  usageClassName: json['usageClassName'] as String?,
  description: json['description'] as String?,
  propertyName: json['propertyName'] as String?,
  area: json['area'] as String?,
  rent: parseDoubleNullable(json['rent']),
  deposit: parseDoubleNullable(json['deposit']),
  moveInCosts:
      (json['moveInCosts'] as List<dynamic>?)
          ?.map((e) => MoveInCostModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MoveInCostModel>[],
  bedrooms: (json['bedrooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  ensuiteBathrooms: (json['ensuiteBathrooms'] as num?)?.toInt(),
  squareFt: parseDoubleNullable(json['squareFt']),
  floorLabel: json['floorLabel'] as String?,
  dsq: json['dsq'] as bool? ?? false,
  parkingSpaces: (json['parkingSpaces'] as num?)?.toInt(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  amenities:
      (json['amenities'] as List<dynamic>?)
          ?.map((e) => ListingAmenity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ListingAmenity>[],
  availableFrom: json['availableFrom'] as String?,
  contactName: json['contactName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  contactEmail: json['contactEmail'] as String?,
);

Map<String, dynamic> _$VacantHouseDetailModelToJson(
  _VacantHouseDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'categoryName': instance.categoryName,
  'usageClassName': instance.usageClassName,
  'description': instance.description,
  'propertyName': instance.propertyName,
  'area': instance.area,
  'rent': instance.rent,
  'deposit': instance.deposit,
  'moveInCosts': instance.moveInCosts,
  'bedrooms': instance.bedrooms,
  'bathrooms': instance.bathrooms,
  'ensuiteBathrooms': instance.ensuiteBathrooms,
  'squareFt': instance.squareFt,
  'floorLabel': instance.floorLabel,
  'dsq': instance.dsq,
  'parkingSpaces': instance.parkingSpaces,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'images': instance.images,
  'amenities': instance.amenities,
  'availableFrom': instance.availableFrom,
  'contactName': instance.contactName,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
};

_MoveInCostModel _$MoveInCostModelFromJson(Map<String, dynamic> json) =>
    _MoveInCostModel(
      name: json['name'] as String,
      amount: parseDoubleNullable(json['amount']),
      refundable: json['refundable'] as bool? ?? false,
      months: (json['months'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoveInCostModelToJson(_MoveInCostModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'refundable': instance.refundable,
      'months': instance.months,
    };

_ListingAmenity _$ListingAmenityFromJson(Map<String, dynamic> json) =>
    _ListingAmenity(
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ListingAmenityToJson(_ListingAmenity instance) =>
    <String, dynamic>{'name': instance.name, 'icon': instance.icon};

_ListingChoice _$ListingChoiceFromJson(Map<String, dynamic> json) =>
    _ListingChoice(
      value: json['value'] as String,
      label: json['label'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ListingChoiceToJson(_ListingChoice instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'count': instance.count,
    };

_ListingFilters _$ListingFiltersFromJson(Map<String, dynamic> json) =>
    _ListingFilters(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => ListingChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ListingChoice>[],
      areas:
          (json['areas'] as List<dynamic>?)
              ?.map((e) => ListingChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ListingChoice>[],
      minRent: parseDoubleNullable(json['minRent']),
      maxRent: parseDoubleNullable(json['maxRent']),
      maxBedrooms: (json['maxBedrooms'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ListingFiltersToJson(_ListingFilters instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'areas': instance.areas,
      'minRent': instance.minRent,
      'maxRent': instance.maxRent,
      'maxBedrooms': instance.maxBedrooms,
      'total': instance.total,
    };
