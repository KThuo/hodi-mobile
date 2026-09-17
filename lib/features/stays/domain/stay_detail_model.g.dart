// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stay_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StayDetailModel _$StayDetailModelFromJson(Map<String, dynamic> json) =>
    _StayDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      categoryName: json['categoryName'] as String?,
      description: json['description'] as String?,
      propertyName: json['propertyName'] as String?,
      area: json['area'] as String?,
      nightlyRate: parseDoubleNullable(json['nightlyRate']),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      sleeps: (json['sleeps'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => StayAmenity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StayAmenity>[],
      minNights: (json['minNights'] as num?)?.toInt() ?? 1,
      contactName: json['contactName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );

Map<String, dynamic> _$StayDetailModelToJson(_StayDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryName': instance.categoryName,
      'description': instance.description,
      'propertyName': instance.propertyName,
      'area': instance.area,
      'nightlyRate': instance.nightlyRate,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'sleeps': instance.sleeps,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'images': instance.images,
      'amenities': instance.amenities,
      'minNights': instance.minNights,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
    };

_StayAmenity _$StayAmenityFromJson(Map<String, dynamic> json) =>
    _StayAmenity(name: json['name'] as String, icon: json['icon'] as String?);

Map<String, dynamic> _$StayAmenityToJson(_StayAmenity instance) =>
    <String, dynamic>{'name': instance.name, 'icon': instance.icon};

_StayQuoteModel _$StayQuoteModelFromJson(Map<String, dynamic> json) =>
    _StayQuoteModel(
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
      nights: (json['nights'] as num?)?.toInt() ?? 0,
      nightsTotal: json['nightsTotal'] == null
          ? 0
          : parseDouble(json['nightsTotal']),
      cleaningFee: json['cleaningFee'] == null
          ? 0
          : parseDouble(json['cleaningFee']),
      total: json['total'] == null ? 0 : parseDouble(json['total']),
      currency: json['currency'] as String? ?? 'KES',
      minNights: (json['minNights'] as num?)?.toInt() ?? 1,
      available: json['available'] as bool? ?? false,
      reasons:
          (json['reasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$StayQuoteModelToJson(_StayQuoteModel instance) =>
    <String, dynamic>{
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'nights': instance.nights,
      'nightsTotal': instance.nightsTotal,
      'cleaningFee': instance.cleaningFee,
      'total': instance.total,
      'currency': instance.currency,
      'minNights': instance.minNights,
      'available': instance.available,
      'reasons': instance.reasons,
    };
