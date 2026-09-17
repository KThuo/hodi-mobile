// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
      userTypeName: json['userTypeName'] as String?,
      estateName: json['estateName'] as String?,
      bankName: json['bankName'] as String?,
      bankLogoUrl: json['bankLogoUrl'] as String?,
      userGroupName: json['userGroupName'] as String?,
      estateId: json['estateId'] as String?,
      bankId: json['bankId'] as String?,
      authorities:
          (json['authorities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      superadmin: json['superadmin'] as bool? ?? false,
      bankadmin: json['bankadmin'] as bool? ?? false,
      admin: json['admin'] as bool? ?? false,
      caretaker: json['caretaker'] as bool? ?? false,
      tenant: json['tenant'] as bool? ?? false,
      mustChangePassword: json['mustChangePassword'] as bool? ?? false,
      pinSet: json['pinSet'] as bool? ?? false,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
      'userTypeName': instance.userTypeName,
      'estateName': instance.estateName,
      'bankName': instance.bankName,
      'bankLogoUrl': instance.bankLogoUrl,
      'userGroupName': instance.userGroupName,
      'estateId': instance.estateId,
      'bankId': instance.bankId,
      'authorities': instance.authorities,
      'superadmin': instance.superadmin,
      'bankadmin': instance.bankadmin,
      'admin': instance.admin,
      'caretaker': instance.caretaker,
      'tenant': instance.tenant,
      'mustChangePassword': instance.mustChangePassword,
      'pinSet': instance.pinSet,
    };
