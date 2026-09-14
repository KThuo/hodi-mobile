// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresAt: (json['expiresAt'] as num).toInt(),
  sessionTimeoutSeconds: (json['sessionTimeoutSeconds'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresAt': instance.expiresAt,
      'sessionTimeoutSeconds': instance.sessionTimeoutSeconds,
    };
