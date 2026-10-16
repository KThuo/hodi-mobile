// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatEntry _$ChatEntryFromJson(Map<String, dynamic> json) => _ChatEntry(
  id: json['id'] as String,
  kind: json['kind'] as String? ?? 'MESSAGE',
  authorName: json['authorName'] as String?,
  authorRole: json['authorRole'] as String? ?? 'SYSTEM',
  body: json['body'] as String? ?? '',
  at: json['at'] as String?,
  mine: json['mine'] as bool? ?? false,
  hasAttachment: json['hasAttachment'] as bool? ?? false,
  attachmentType: json['attachmentType'] as String?,
  internal: json['internal'] as bool? ?? false,
);

Map<String, dynamic> _$ChatEntryToJson(_ChatEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'authorName': instance.authorName,
      'authorRole': instance.authorRole,
      'body': instance.body,
      'at': instance.at,
      'mine': instance.mine,
      'hasAttachment': instance.hasAttachment,
      'attachmentType': instance.attachmentType,
      'internal': instance.internal,
    };

_ChatView _$ChatViewFromJson(Map<String, dynamic> json) => _ChatView(
  id: json['id'] as String,
  kind: json['kind'] as String? ?? 'OFFICE',
  title: json['title'] as String? ?? '',
  subtitle: json['subtitle'] as String?,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => ChatEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChatEntry>[],
  open: json['open'] as bool? ?? true,
  myRole: json['myRole'] as String? ?? 'TENANT',
  unread: (json['unread'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChatViewToJson(_ChatView instance) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'entries': instance.entries,
  'open': instance.open,
  'myRole': instance.myRole,
  'unread': instance.unread,
};

_InboxItem _$InboxItemFromJson(Map<String, dynamic> json) => _InboxItem(
  kind: json['kind'] as String,
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  subtitle: json['subtitle'] as String?,
  lastMessage: json['lastMessage'] as String?,
  lastAuthor: json['lastAuthor'] as String?,
  lastAt: json['lastAt'] as String?,
  unread: (json['unread'] as num?)?.toInt() ?? 0,
  open: json['open'] as bool? ?? true,
);

Map<String, dynamic> _$InboxItemToJson(_InboxItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'lastMessage': instance.lastMessage,
      'lastAuthor': instance.lastAuthor,
      'lastAt': instance.lastAt,
      'unread': instance.unread,
      'open': instance.open,
    };

_Inbox _$InboxFromJson(Map<String, dynamic> json) => _Inbox(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => InboxItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <InboxItem>[],
  unread: (json['unread'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$InboxToJson(_Inbox instance) => <String, dynamic>{
  'items': instance.items,
  'unread': instance.unread,
};
