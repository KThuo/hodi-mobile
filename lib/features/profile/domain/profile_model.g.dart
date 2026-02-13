// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: (json['id'] as num?)?.toInt(),
      fullNames: json['fullNames'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userGroup: json['userGroup'] as String?,
      usertype: json['usertype'] as String?,
      estate: json['estate'] as String?,
      passwordExpiry: json['passwordExpiry'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullNames': instance.fullNames,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'userGroup': instance.userGroup,
      'usertype': instance.usertype,
      'estate': instance.estate,
      'passwordExpiry': instance.passwordExpiry,
      'photoUrl': instance.photoUrl,
    };
