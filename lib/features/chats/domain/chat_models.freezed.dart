// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatEntry {

 String get id;/// MESSAGE, or EVENT — something that happened (a status change, an assignment).
 String get kind; String? get authorName;/// TENANT, OFFICE or SYSTEM.
 String get authorRole; String get body;/// ISO instant.
 String? get at; bool get mine; bool get hasAttachment; String? get attachmentType; bool get internal;
/// Create a copy of ChatEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatEntryCopyWith<ChatEntry> get copyWith => _$ChatEntryCopyWithImpl<ChatEntry>(this as ChatEntry, _$identity);

  /// Serializes this ChatEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.body, body) || other.body == body)&&(identical(other.at, at) || other.at == at)&&(identical(other.mine, mine) || other.mine == mine)&&(identical(other.hasAttachment, hasAttachment) || other.hasAttachment == hasAttachment)&&(identical(other.attachmentType, attachmentType) || other.attachmentType == attachmentType)&&(identical(other.internal, internal) || other.internal == internal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,authorName,authorRole,body,at,mine,hasAttachment,attachmentType,internal);

@override
String toString() {
  return 'ChatEntry(id: $id, kind: $kind, authorName: $authorName, authorRole: $authorRole, body: $body, at: $at, mine: $mine, hasAttachment: $hasAttachment, attachmentType: $attachmentType, internal: $internal)';
}


}

/// @nodoc
abstract mixin class $ChatEntryCopyWith<$Res>  {
  factory $ChatEntryCopyWith(ChatEntry value, $Res Function(ChatEntry) _then) = _$ChatEntryCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String? authorName, String authorRole, String body, String? at, bool mine, bool hasAttachment, String? attachmentType, bool internal
});




}
/// @nodoc
class _$ChatEntryCopyWithImpl<$Res>
    implements $ChatEntryCopyWith<$Res> {
  _$ChatEntryCopyWithImpl(this._self, this._then);

  final ChatEntry _self;
  final $Res Function(ChatEntry) _then;

/// Create a copy of ChatEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? authorName = freezed,Object? authorRole = null,Object? body = null,Object? at = freezed,Object? mine = null,Object? hasAttachment = null,Object? attachmentType = freezed,Object? internal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,hasAttachment: null == hasAttachment ? _self.hasAttachment : hasAttachment // ignore: cast_nullable_to_non_nullable
as bool,attachmentType: freezed == attachmentType ? _self.attachmentType : attachmentType // ignore: cast_nullable_to_non_nullable
as String?,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatEntry].
extension ChatEntryPatterns on ChatEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatEntry value)  $default,){
final _that = this;
switch (_that) {
case _ChatEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ChatEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String? authorName,  String authorRole,  String body,  String? at,  bool mine,  bool hasAttachment,  String? attachmentType,  bool internal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatEntry() when $default != null:
return $default(_that.id,_that.kind,_that.authorName,_that.authorRole,_that.body,_that.at,_that.mine,_that.hasAttachment,_that.attachmentType,_that.internal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String? authorName,  String authorRole,  String body,  String? at,  bool mine,  bool hasAttachment,  String? attachmentType,  bool internal)  $default,) {final _that = this;
switch (_that) {
case _ChatEntry():
return $default(_that.id,_that.kind,_that.authorName,_that.authorRole,_that.body,_that.at,_that.mine,_that.hasAttachment,_that.attachmentType,_that.internal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String? authorName,  String authorRole,  String body,  String? at,  bool mine,  bool hasAttachment,  String? attachmentType,  bool internal)?  $default,) {final _that = this;
switch (_that) {
case _ChatEntry() when $default != null:
return $default(_that.id,_that.kind,_that.authorName,_that.authorRole,_that.body,_that.at,_that.mine,_that.hasAttachment,_that.attachmentType,_that.internal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatEntry extends ChatEntry {
  const _ChatEntry({required this.id, this.kind = 'MESSAGE', this.authorName, this.authorRole = 'SYSTEM', this.body = '', this.at, this.mine = false, this.hasAttachment = false, this.attachmentType, this.internal = false}): super._();
  factory _ChatEntry.fromJson(Map<String, dynamic> json) => _$ChatEntryFromJson(json);

@override final  String id;
/// MESSAGE, or EVENT — something that happened (a status change, an assignment).
@override@JsonKey() final  String kind;
@override final  String? authorName;
/// TENANT, OFFICE or SYSTEM.
@override@JsonKey() final  String authorRole;
@override@JsonKey() final  String body;
/// ISO instant.
@override final  String? at;
@override@JsonKey() final  bool mine;
@override@JsonKey() final  bool hasAttachment;
@override final  String? attachmentType;
@override@JsonKey() final  bool internal;

/// Create a copy of ChatEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatEntryCopyWith<_ChatEntry> get copyWith => __$ChatEntryCopyWithImpl<_ChatEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.body, body) || other.body == body)&&(identical(other.at, at) || other.at == at)&&(identical(other.mine, mine) || other.mine == mine)&&(identical(other.hasAttachment, hasAttachment) || other.hasAttachment == hasAttachment)&&(identical(other.attachmentType, attachmentType) || other.attachmentType == attachmentType)&&(identical(other.internal, internal) || other.internal == internal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,authorName,authorRole,body,at,mine,hasAttachment,attachmentType,internal);

@override
String toString() {
  return 'ChatEntry(id: $id, kind: $kind, authorName: $authorName, authorRole: $authorRole, body: $body, at: $at, mine: $mine, hasAttachment: $hasAttachment, attachmentType: $attachmentType, internal: $internal)';
}


}

/// @nodoc
abstract mixin class _$ChatEntryCopyWith<$Res> implements $ChatEntryCopyWith<$Res> {
  factory _$ChatEntryCopyWith(_ChatEntry value, $Res Function(_ChatEntry) _then) = __$ChatEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String? authorName, String authorRole, String body, String? at, bool mine, bool hasAttachment, String? attachmentType, bool internal
});




}
/// @nodoc
class __$ChatEntryCopyWithImpl<$Res>
    implements _$ChatEntryCopyWith<$Res> {
  __$ChatEntryCopyWithImpl(this._self, this._then);

  final _ChatEntry _self;
  final $Res Function(_ChatEntry) _then;

/// Create a copy of ChatEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? authorName = freezed,Object? authorRole = null,Object? body = null,Object? at = freezed,Object? mine = null,Object? hasAttachment = null,Object? attachmentType = freezed,Object? internal = null,}) {
  return _then(_ChatEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,hasAttachment: null == hasAttachment ? _self.hasAttachment : hasAttachment // ignore: cast_nullable_to_non_nullable
as bool,attachmentType: freezed == attachmentType ? _self.attachmentType : attachmentType // ignore: cast_nullable_to_non_nullable
as String?,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ChatView {

 String get id; String get kind; String get title; String? get subtitle; List<ChatEntry> get entries; bool get open; String get myRole; int get unread;
/// Create a copy of ChatView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatViewCopyWith<ChatView> get copyWith => _$ChatViewCopyWithImpl<ChatView>(this as ChatView, _$identity);

  /// Serializes this ChatView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatView&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.open, open) || other.open == open)&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,subtitle,const DeepCollectionEquality().hash(entries),open,myRole,unread);

@override
String toString() {
  return 'ChatView(id: $id, kind: $kind, title: $title, subtitle: $subtitle, entries: $entries, open: $open, myRole: $myRole, unread: $unread)';
}


}

/// @nodoc
abstract mixin class $ChatViewCopyWith<$Res>  {
  factory $ChatViewCopyWith(ChatView value, $Res Function(ChatView) _then) = _$ChatViewCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String title, String? subtitle, List<ChatEntry> entries, bool open, String myRole, int unread
});




}
/// @nodoc
class _$ChatViewCopyWithImpl<$Res>
    implements $ChatViewCopyWith<$Res> {
  _$ChatViewCopyWithImpl(this._self, this._then);

  final ChatView _self;
  final $Res Function(ChatView) _then;

/// Create a copy of ChatView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? subtitle = freezed,Object? entries = null,Object? open = null,Object? myRole = null,Object? unread = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ChatEntry>,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,myRole: null == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as String,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatView].
extension ChatViewPatterns on ChatView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatView value)  $default,){
final _that = this;
switch (_that) {
case _ChatView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatView value)?  $default,){
final _that = this;
switch (_that) {
case _ChatView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  String? subtitle,  List<ChatEntry> entries,  bool open,  String myRole,  int unread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatView() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.subtitle,_that.entries,_that.open,_that.myRole,_that.unread);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  String? subtitle,  List<ChatEntry> entries,  bool open,  String myRole,  int unread)  $default,) {final _that = this;
switch (_that) {
case _ChatView():
return $default(_that.id,_that.kind,_that.title,_that.subtitle,_that.entries,_that.open,_that.myRole,_that.unread);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String title,  String? subtitle,  List<ChatEntry> entries,  bool open,  String myRole,  int unread)?  $default,) {final _that = this;
switch (_that) {
case _ChatView() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.subtitle,_that.entries,_that.open,_that.myRole,_that.unread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatView implements ChatView {
  const _ChatView({required this.id, this.kind = 'OFFICE', this.title = '', this.subtitle, final  List<ChatEntry> entries = const <ChatEntry>[], this.open = true, this.myRole = 'TENANT', this.unread = 0}): _entries = entries;
  factory _ChatView.fromJson(Map<String, dynamic> json) => _$ChatViewFromJson(json);

@override final  String id;
@override@JsonKey() final  String kind;
@override@JsonKey() final  String title;
@override final  String? subtitle;
 final  List<ChatEntry> _entries;
@override@JsonKey() List<ChatEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool open;
@override@JsonKey() final  String myRole;
@override@JsonKey() final  int unread;

/// Create a copy of ChatView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatViewCopyWith<_ChatView> get copyWith => __$ChatViewCopyWithImpl<_ChatView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatView&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.open, open) || other.open == open)&&(identical(other.myRole, myRole) || other.myRole == myRole)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,subtitle,const DeepCollectionEquality().hash(_entries),open,myRole,unread);

@override
String toString() {
  return 'ChatView(id: $id, kind: $kind, title: $title, subtitle: $subtitle, entries: $entries, open: $open, myRole: $myRole, unread: $unread)';
}


}

/// @nodoc
abstract mixin class _$ChatViewCopyWith<$Res> implements $ChatViewCopyWith<$Res> {
  factory _$ChatViewCopyWith(_ChatView value, $Res Function(_ChatView) _then) = __$ChatViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String title, String? subtitle, List<ChatEntry> entries, bool open, String myRole, int unread
});




}
/// @nodoc
class __$ChatViewCopyWithImpl<$Res>
    implements _$ChatViewCopyWith<$Res> {
  __$ChatViewCopyWithImpl(this._self, this._then);

  final _ChatView _self;
  final $Res Function(_ChatView) _then;

/// Create a copy of ChatView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? subtitle = freezed,Object? entries = null,Object? open = null,Object? myRole = null,Object? unread = null,}) {
  return _then(_ChatView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ChatEntry>,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,myRole: null == myRole ? _self.myRole : myRole // ignore: cast_nullable_to_non_nullable
as String,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$InboxItem {

 String get kind; String get id; String get title; String? get subtitle; String? get lastMessage; String? get lastAuthor; String? get lastAt; int get unread; bool get open;
/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxItemCopyWith<InboxItem> get copyWith => _$InboxItemCopyWithImpl<InboxItem>(this as InboxItem, _$identity);

  /// Serializes this InboxItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastAuthor, lastAuthor) || other.lastAuthor == lastAuthor)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.open, open) || other.open == open));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,id,title,subtitle,lastMessage,lastAuthor,lastAt,unread,open);

@override
String toString() {
  return 'InboxItem(kind: $kind, id: $id, title: $title, subtitle: $subtitle, lastMessage: $lastMessage, lastAuthor: $lastAuthor, lastAt: $lastAt, unread: $unread, open: $open)';
}


}

/// @nodoc
abstract mixin class $InboxItemCopyWith<$Res>  {
  factory $InboxItemCopyWith(InboxItem value, $Res Function(InboxItem) _then) = _$InboxItemCopyWithImpl;
@useResult
$Res call({
 String kind, String id, String title, String? subtitle, String? lastMessage, String? lastAuthor, String? lastAt, int unread, bool open
});




}
/// @nodoc
class _$InboxItemCopyWithImpl<$Res>
    implements $InboxItemCopyWith<$Res> {
  _$InboxItemCopyWithImpl(this._self, this._then);

  final InboxItem _self;
  final $Res Function(InboxItem) _then;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,Object? title = null,Object? subtitle = freezed,Object? lastMessage = freezed,Object? lastAuthor = freezed,Object? lastAt = freezed,Object? unread = null,Object? open = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastAuthor: freezed == lastAuthor ? _self.lastAuthor : lastAuthor // ignore: cast_nullable_to_non_nullable
as String?,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxItem].
extension InboxItemPatterns on InboxItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxItem value)  $default,){
final _that = this;
switch (_that) {
case _InboxItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxItem value)?  $default,){
final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String id,  String title,  String? subtitle,  String? lastMessage,  String? lastAuthor,  String? lastAt,  int unread,  bool open)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that.kind,_that.id,_that.title,_that.subtitle,_that.lastMessage,_that.lastAuthor,_that.lastAt,_that.unread,_that.open);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String id,  String title,  String? subtitle,  String? lastMessage,  String? lastAuthor,  String? lastAt,  int unread,  bool open)  $default,) {final _that = this;
switch (_that) {
case _InboxItem():
return $default(_that.kind,_that.id,_that.title,_that.subtitle,_that.lastMessage,_that.lastAuthor,_that.lastAt,_that.unread,_that.open);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String id,  String title,  String? subtitle,  String? lastMessage,  String? lastAuthor,  String? lastAt,  int unread,  bool open)?  $default,) {final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that.kind,_that.id,_that.title,_that.subtitle,_that.lastMessage,_that.lastAuthor,_that.lastAt,_that.unread,_that.open);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboxItem extends InboxItem {
  const _InboxItem({required this.kind, required this.id, this.title = '', this.subtitle, this.lastMessage, this.lastAuthor, this.lastAt, this.unread = 0, this.open = true}): super._();
  factory _InboxItem.fromJson(Map<String, dynamic> json) => _$InboxItemFromJson(json);

@override final  String kind;
@override final  String id;
@override@JsonKey() final  String title;
@override final  String? subtitle;
@override final  String? lastMessage;
@override final  String? lastAuthor;
@override final  String? lastAt;
@override@JsonKey() final  int unread;
@override@JsonKey() final  bool open;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxItemCopyWith<_InboxItem> get copyWith => __$InboxItemCopyWithImpl<_InboxItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastAuthor, lastAuthor) || other.lastAuthor == lastAuthor)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.open, open) || other.open == open));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,id,title,subtitle,lastMessage,lastAuthor,lastAt,unread,open);

@override
String toString() {
  return 'InboxItem(kind: $kind, id: $id, title: $title, subtitle: $subtitle, lastMessage: $lastMessage, lastAuthor: $lastAuthor, lastAt: $lastAt, unread: $unread, open: $open)';
}


}

/// @nodoc
abstract mixin class _$InboxItemCopyWith<$Res> implements $InboxItemCopyWith<$Res> {
  factory _$InboxItemCopyWith(_InboxItem value, $Res Function(_InboxItem) _then) = __$InboxItemCopyWithImpl;
@override @useResult
$Res call({
 String kind, String id, String title, String? subtitle, String? lastMessage, String? lastAuthor, String? lastAt, int unread, bool open
});




}
/// @nodoc
class __$InboxItemCopyWithImpl<$Res>
    implements _$InboxItemCopyWith<$Res> {
  __$InboxItemCopyWithImpl(this._self, this._then);

  final _InboxItem _self;
  final $Res Function(_InboxItem) _then;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,Object? title = null,Object? subtitle = freezed,Object? lastMessage = freezed,Object? lastAuthor = freezed,Object? lastAt = freezed,Object? unread = null,Object? open = null,}) {
  return _then(_InboxItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastAuthor: freezed == lastAuthor ? _self.lastAuthor : lastAuthor // ignore: cast_nullable_to_non_nullable
as String?,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as String?,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Inbox {

 List<InboxItem> get items; int get unread;
/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxCopyWith<Inbox> get copyWith => _$InboxCopyWithImpl<Inbox>(this as Inbox, _$identity);

  /// Serializes this Inbox to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inbox&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),unread);

@override
String toString() {
  return 'Inbox(items: $items, unread: $unread)';
}


}

/// @nodoc
abstract mixin class $InboxCopyWith<$Res>  {
  factory $InboxCopyWith(Inbox value, $Res Function(Inbox) _then) = _$InboxCopyWithImpl;
@useResult
$Res call({
 List<InboxItem> items, int unread
});




}
/// @nodoc
class _$InboxCopyWithImpl<$Res>
    implements $InboxCopyWith<$Res> {
  _$InboxCopyWithImpl(this._self, this._then);

  final Inbox _self;
  final $Res Function(Inbox) _then;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? unread = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InboxItem>,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Inbox].
extension InboxPatterns on Inbox {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inbox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inbox value)  $default,){
final _that = this;
switch (_that) {
case _Inbox():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inbox value)?  $default,){
final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InboxItem> items,  int unread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that.items,_that.unread);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InboxItem> items,  int unread)  $default,) {final _that = this;
switch (_that) {
case _Inbox():
return $default(_that.items,_that.unread);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InboxItem> items,  int unread)?  $default,) {final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that.items,_that.unread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inbox implements Inbox {
  const _Inbox({final  List<InboxItem> items = const <InboxItem>[], this.unread = 0}): _items = items;
  factory _Inbox.fromJson(Map<String, dynamic> json) => _$InboxFromJson(json);

 final  List<InboxItem> _items;
@override@JsonKey() List<InboxItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int unread;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxCopyWith<_Inbox> get copyWith => __$InboxCopyWithImpl<_Inbox>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inbox&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),unread);

@override
String toString() {
  return 'Inbox(items: $items, unread: $unread)';
}


}

/// @nodoc
abstract mixin class _$InboxCopyWith<$Res> implements $InboxCopyWith<$Res> {
  factory _$InboxCopyWith(_Inbox value, $Res Function(_Inbox) _then) = __$InboxCopyWithImpl;
@override @useResult
$Res call({
 List<InboxItem> items, int unread
});




}
/// @nodoc
class __$InboxCopyWithImpl<$Res>
    implements _$InboxCopyWith<$Res> {
  __$InboxCopyWithImpl(this._self, this._then);

  final _Inbox _self;
  final $Res Function(_Inbox) _then;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? unread = null,}) {
  return _then(_Inbox(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InboxItem>,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
