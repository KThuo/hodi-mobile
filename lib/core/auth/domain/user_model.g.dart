// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  username: json['username'] as String,
  fullName: json['fullName'] as String,
  firstName: json['firstName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  userType: json['userType'] as String,
  userTypeName: json['userTypeName'] as String?,
  estateName: json['estateName'] as String?,
  estateId: json['estateId'] as String?,
  bankName: json['bankName'] as String?,
  bankId: json['bankId'] as String?,
  bankLogoUrl: json['bankLogoUrl'] as String?,
  userGroupName: json['userGroupName'] as String?,
  authorities:
      (json['authorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  superadmin: json['superadmin'] as bool? ?? false,
  bankadmin: json['bankadmin'] as bool? ?? false,
  admin: json['admin'] as bool? ?? false,
  caretaker: json['caretaker'] as bool? ?? false,
  tenant: json['tenant'] as bool? ?? false,
  mustChangePassword: json['mustChangePassword'] as bool? ?? false,
  pinSet: json['pinSet'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
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
      'estateId': instance.estateId,
      'bankName': instance.bankName,
      'bankId': instance.bankId,
      'bankLogoUrl': instance.bankLogoUrl,
      'userGroupName': instance.userGroupName,
      'authorities': instance.authorities,
      'superadmin': instance.superadmin,
      'bankadmin': instance.bankadmin,
      'admin': instance.admin,
      'caretaker': instance.caretaker,
      'tenant': instance.tenant,
      'mustChangePassword': instance.mustChangePassword,
      'pinSet': instance.pinSet,
    };
