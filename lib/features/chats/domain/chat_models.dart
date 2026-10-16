import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

/// One message or event in a conversation — the server's `ChatEntry`.
///
/// The same shape for all three conversations (a move-out notice, a repair, the office), so one
/// widget draws them. [internal] is an office note the tenant never sees; it only ever arrives in
/// the office's own view.
@freezed
abstract class ChatEntry with _$ChatEntry {
  const ChatEntry._();

  const factory ChatEntry({
    required String id,

    /// MESSAGE, or EVENT — something that happened (a status change, an assignment).
    @Default('MESSAGE') String kind,
    String? authorName,

    /// TENANT, OFFICE or SYSTEM.
    @Default('SYSTEM') String authorRole,
    @Default('') String body,

    /// ISO instant.
    String? at,
    @Default(false) bool mine,
    @Default(false) bool hasAttachment,
    String? attachmentType,
    @Default(false) bool internal,
  }) = _ChatEntry;

  factory ChatEntry.fromJson(Map<String, dynamic> json) => _$ChatEntryFromJson(json);

  bool get isEvent => kind == 'EVENT';
  bool get isPdf => attachmentType == 'application/pdf';
  DateTime? get when => at == null ? null : DateTime.tryParse(at!)?.toLocal();
}

/// A conversation as this reader sees it — the server's `ChatView`.
///
/// [open] is false once the thing it is about is finished: still readable, no new messages.
/// [myRole] is the side this reader writes as, TENANT or OFFICE.
@freezed
abstract class ChatView with _$ChatView {
  const factory ChatView({
    required String id,
    @Default('OFFICE') String kind,
    @Default('') String title,
    String? subtitle,
    @Default(<ChatEntry>[]) List<ChatEntry> entries,
    @Default(true) bool open,
    @Default('TENANT') String myRole,
    @Default(0) int unread,
  }) = _ChatView;

  factory ChatView.fromJson(Map<String, dynamic> json) => _$ChatViewFromJson(json);
}

/// One conversation in the inbox.
///
/// [kind] is VACATE, REPAIR or OFFICE, and [id] is the notice, the request or the office
/// conversation — which is what decides where tapping it goes.
@freezed
abstract class InboxItem with _$InboxItem {
  const InboxItem._();

  const factory InboxItem({
    required String kind,
    required String id,
    @Default('') String title,
    String? subtitle,
    String? lastMessage,
    String? lastAuthor,
    String? lastAt,
    @Default(0) int unread,
    @Default(true) bool open,
  }) = _InboxItem;

  factory InboxItem.fromJson(Map<String, dynamic> json) => _$InboxItemFromJson(json);

  DateTime? get when => lastAt == null ? null : DateTime.tryParse(lastAt!)?.toLocal();

  /// Where tapping it goes in the app.
  String get route => switch (kind) {
        'VACATE' => '/more/vacate-notices/$id',
        'REPAIR' => '/more/maintenance/$id',
        _ => '/more/chats/office/$id',
      };
}

@freezed
abstract class Inbox with _$Inbox {
  const factory Inbox({
    @Default(<InboxItem>[]) List<InboxItem> items,
    @Default(0) int unread,
  }) = _Inbox;

  factory Inbox.fromJson(Map<String, dynamic> json) => _$InboxFromJson(json);
}
