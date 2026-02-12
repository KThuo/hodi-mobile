// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  username: json['username'] as String,
  usertype: json['usertype'] as String,
  estate: json['estate'] as String?,
  estateId: json['estateId'] as String?,
  email: json['email'] as String?,
  firstName: json['firstName'] as String?,
  userGroup: json['userGroup'] as String?,
  groupId: json['groupId'] as String?,
  propertyIds:
      (json['propertyIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  authorities:
      (json['authorities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'usertype': instance.usertype,
      'estate': instance.estate,
      'estateId': instance.estateId,
      'email': instance.email,
      'firstName': instance.firstName,
      'userGroup': instance.userGroup,
      'groupId': instance.groupId,
      'propertyIds': instance.propertyIds,
      'authorities': instance.authorities,
    };
