// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantModel _$TenantModelFromJson(Map<String, dynamic> json) => _TenantModel(
  id: json['id'] as String,
  kind: json['kind'] as String?,
  organisation: json['organisation'] as bool? ?? false,
  displayName: json['displayName'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  idNumber: json['idNumber'] as String?,
  registeredName: json['registeredName'] as String?,
  kraPin: json['kraPin'] as String?,
  contactName: json['contactName'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  username: json['username'] as String?,
  invited: json['invited'] as bool? ?? false,
  estateId: json['estateId'] as String?,
  occupying:
      (json['occupying'] as List<dynamic>?)
          ?.map((e) => OccupiedUnitModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OccupiedUnitModel>[],
  status: (json['status'] as num?)?.toInt() ?? 0,
  createdOn: json['createdOn'] as String?,
);

Map<String, dynamic> _$TenantModelToJson(_TenantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'organisation': instance.organisation,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'idNumber': instance.idNumber,
      'registeredName': instance.registeredName,
      'kraPin': instance.kraPin,
      'contactName': instance.contactName,
      'phone': instance.phone,
      'email': instance.email,
      'username': instance.username,
      'invited': instance.invited,
      'estateId': instance.estateId,
      'occupying': instance.occupying,
      'status': instance.status,
      'createdOn': instance.createdOn,
    };

_OccupiedUnitModel _$OccupiedUnitModelFromJson(Map<String, dynamic> json) =>
    _OccupiedUnitModel(
      houseId: json['houseId'] as String,
      houseCode: json['houseCode'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$OccupiedUnitModelToJson(_OccupiedUnitModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'houseCode': instance.houseCode,
      'label': instance.label,
    };
