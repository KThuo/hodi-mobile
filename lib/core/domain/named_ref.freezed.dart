// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'named_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NamedRef {

 String get id; String get label;/// Secondary text: a unit count on a category, a phone number on a caretaker.
 String? get note;/// An icon key, for the things that have one. Features do; a caretaker does not.
 String? get icon;
/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedRefCopyWith<NamedRef> get copyWith => _$NamedRefCopyWithImpl<NamedRef>(this as NamedRef, _$identity);

  /// Serializes this NamedRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedRef&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.note, note) || other.note == note)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,note,icon);

@override
String toString() {
  return 'NamedRef(id: $id, label: $label, note: $note, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $NamedRefCopyWith<$Res>  {
  factory $NamedRefCopyWith(NamedRef value, $Res Function(NamedRef) _then) = _$NamedRefCopyWithImpl;
@useResult
$Res call({
 String id, String label, String? note, String? icon
});




}
/// @nodoc
class _$NamedRefCopyWithImpl<$Res>
    implements $NamedRefCopyWith<$Res> {
  _$NamedRefCopyWithImpl(this._self, this._then);

  final NamedRef _self;
  final $Res Function(NamedRef) _then;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? note = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedRef].
extension NamedRefPatterns on NamedRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedRef value)  $default,){
final _that = this;
switch (_that) {
case _NamedRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedRef value)?  $default,){
final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String? note,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
return $default(_that.id,_that.label,_that.note,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String? note,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _NamedRef():
return $default(_that.id,_that.label,_that.note,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String? note,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _NamedRef() when $default != null:
return $default(_that.id,_that.label,_that.note,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamedRef extends NamedRef {
  const _NamedRef({required this.id, required this.label, this.note, this.icon}): super._();
  factory _NamedRef.fromJson(Map<String, dynamic> json) => _$NamedRefFromJson(json);

@override final  String id;
@override final  String label;
/// Secondary text: a unit count on a category, a phone number on a caretaker.
@override final  String? note;
/// An icon key, for the things that have one. Features do; a caretaker does not.
@override final  String? icon;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedRefCopyWith<_NamedRef> get copyWith => __$NamedRefCopyWithImpl<_NamedRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedRef&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.note, note) || other.note == note)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,note,icon);

@override
String toString() {
  return 'NamedRef(id: $id, label: $label, note: $note, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$NamedRefCopyWith<$Res> implements $NamedRefCopyWith<$Res> {
  factory _$NamedRefCopyWith(_NamedRef value, $Res Function(_NamedRef) _then) = __$NamedRefCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String? note, String? icon
});




}
/// @nodoc
class __$NamedRefCopyWithImpl<$Res>
    implements _$NamedRefCopyWith<$Res> {
  __$NamedRefCopyWithImpl(this._self, this._then);

  final _NamedRef _self;
  final $Res Function(_NamedRef) _then;

/// Create a copy of NamedRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? note = freezed,Object? icon = freezed,}) {
  return _then(_NamedRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
