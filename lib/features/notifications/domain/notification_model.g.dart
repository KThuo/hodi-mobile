// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      template: json['template'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String,
      route: json['route'] as String?,
      actionLabel: json['actionLabel'] as String?,
      read: json['read'] as bool? ?? false,
      readOn: json['readOn'] as String?,
      createdOn: json['createdOn'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'template': instance.template,
      'title': instance.title,
      'body': instance.body,
      'route': instance.route,
      'actionLabel': instance.actionLabel,
      'read': instance.read,
      'readOn': instance.readOn,
      'createdOn': instance.createdOn,
    };
