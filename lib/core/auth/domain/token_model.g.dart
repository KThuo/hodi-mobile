// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  accessToken: json['accessToken'] as String,
  expiry: (json['expiry'] as num).toInt(),
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiry': instance.expiry,
    };
