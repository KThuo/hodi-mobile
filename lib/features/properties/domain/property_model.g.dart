// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    _PropertyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      estateId: json['estateId'] as String?,
      estateName: json['estateName'] as String?,
      location: json['location'] as String?,
      contactName: json['contactName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      floors: (json['floors'] as num?)?.toInt(),
      units: (json['units'] as num?)?.toInt() ?? 0,
      occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
      vacantUnits: (json['vacantUnits'] as num?)?.toInt() ?? 0,
      invoiceGenerationDay: (json['invoiceGenerationDay'] as num?)?.toInt(),
      commission: parseDoubleNullable(json['commission']),
      bankId: json['bankId'] as String?,
      bankName: json['bankName'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdOn: json['createdOn'] as String?,
    );

Map<String, dynamic> _$PropertyModelToJson(_PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'estateId': instance.estateId,
      'estateName': instance.estateName,
      'location': instance.location,
      'contactName': instance.contactName,
      'phone': instance.phone,
      'email': instance.email,
      'floors': instance.floors,
      'units': instance.units,
      'occupiedUnits': instance.occupiedUnits,
      'vacantUnits': instance.vacantUnits,
      'invoiceGenerationDay': instance.invoiceGenerationDay,
      'commission': instance.commission,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'status': instance.status,
      'createdOn': instance.createdOn,
    };
