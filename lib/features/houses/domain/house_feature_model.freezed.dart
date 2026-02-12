// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseFeatureModel {

 String? get name; String? get description;
/// Create a copy of HouseFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseFeatureModelCopyWith<HouseFeatureModel> get copyWith => _$HouseFeatureModelCopyWithImpl<HouseFeatureModel>(this as HouseFeatureModel, _$identity);

  /// Serializes this HouseFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'HouseFeatureModel(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $HouseFeatureModelCopyWith<$Res>  {
  factory $HouseFeatureModelCopyWith(HouseFeatureModel value, $Res Function(HouseFeatureModel) _then) = _$HouseFeatureModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? description
});




}
/// @nodoc
class _$HouseFeatureModelCopyWithImpl<$Res>
    implements $HouseFeatureModelCopyWith<$Res> {
  _$HouseFeatureModelCopyWithImpl(this._self, this._then);

  final HouseFeatureModel _self;
  final $Res Function(HouseFeatureModel) _then;

/// Create a copy of HouseFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseFeatureModel].
extension HouseFeatureModelPatterns on HouseFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _HouseFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _HouseFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseFeatureModel() when $default != null:
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _HouseFeatureModel():
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _HouseFeatureModel() when $default != null:
return $default(_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseFeatureModel extends HouseFeatureModel {
  const _HouseFeatureModel({this.name, this.description}): super._();
  factory _HouseFeatureModel.fromJson(Map<String, dynamic> json) => _$HouseFeatureModelFromJson(json);

@override final  String? name;
@override final  String? description;

/// Create a copy of HouseFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseFeatureModelCopyWith<_HouseFeatureModel> get copyWith => __$HouseFeatureModelCopyWithImpl<_HouseFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseFeatureModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'HouseFeatureModel(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$HouseFeatureModelCopyWith<$Res> implements $HouseFeatureModelCopyWith<$Res> {
  factory _$HouseFeatureModelCopyWith(_HouseFeatureModel value, $Res Function(_HouseFeatureModel) _then) = __$HouseFeatureModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description
});




}
/// @nodoc
class __$HouseFeatureModelCopyWithImpl<$Res>
    implements _$HouseFeatureModelCopyWith<$Res> {
  __$HouseFeatureModelCopyWithImpl(this._self, this._then);

  final _HouseFeatureModel _self;
  final $Res Function(_HouseFeatureModel) _then;

/// Create a copy of HouseFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,}) {
  return _then(_HouseFeatureModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
