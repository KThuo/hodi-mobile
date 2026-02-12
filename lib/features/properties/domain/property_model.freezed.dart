// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyModel {

 int get id; String? get name; String? get estateName; int? get estateId; String? get location; int get floors; int get units; int get occupied; int get categories; int get features; String? get email; double get commission; String? get createdOn; int get status;
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<PropertyModel> get copyWith => _$PropertyModelCopyWithImpl<PropertyModel>(this as PropertyModel, _$identity);

  /// Serializes this PropertyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.location, location) || other.location == location)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.features, features) || other.features == features)&&(identical(other.email, email) || other.email == email)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estateName,estateId,location,floors,units,occupied,categories,features,email,commission,createdOn,status);

@override
String toString() {
  return 'PropertyModel(id: $id, name: $name, estateName: $estateName, estateId: $estateId, location: $location, floors: $floors, units: $units, occupied: $occupied, categories: $categories, features: $features, email: $email, commission: $commission, createdOn: $createdOn, status: $status)';
}


}

/// @nodoc
abstract mixin class $PropertyModelCopyWith<$Res>  {
  factory $PropertyModelCopyWith(PropertyModel value, $Res Function(PropertyModel) _then) = _$PropertyModelCopyWithImpl;
@useResult
$Res call({
 int id, String? name, String? estateName, int? estateId, String? location, int floors, int units, int occupied, int categories, int features, String? email, double commission, String? createdOn, int status
});




}
/// @nodoc
class _$PropertyModelCopyWithImpl<$Res>
    implements $PropertyModelCopyWith<$Res> {
  _$PropertyModelCopyWithImpl(this._self, this._then);

  final PropertyModel _self;
  final $Res Function(PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? location = freezed,Object? floors = null,Object? units = null,Object? occupied = null,Object? categories = null,Object? features = null,Object? email = freezed,Object? commission = null,Object? createdOn = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyModel].
extension PropertyModelPatterns on PropertyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyModel value)  $default,){
final _that = this;
switch (_that) {
case _PropertyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  String? estateName,  int? estateId,  String? location,  int floors,  int units,  int occupied,  int categories,  int features,  String? email,  double commission,  String? createdOn,  int status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.id,_that.name,_that.estateName,_that.estateId,_that.location,_that.floors,_that.units,_that.occupied,_that.categories,_that.features,_that.email,_that.commission,_that.createdOn,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  String? estateName,  int? estateId,  String? location,  int floors,  int units,  int occupied,  int categories,  int features,  String? email,  double commission,  String? createdOn,  int status)  $default,) {final _that = this;
switch (_that) {
case _PropertyModel():
return $default(_that.id,_that.name,_that.estateName,_that.estateId,_that.location,_that.floors,_that.units,_that.occupied,_that.categories,_that.features,_that.email,_that.commission,_that.createdOn,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  String? estateName,  int? estateId,  String? location,  int floors,  int units,  int occupied,  int categories,  int features,  String? email,  double commission,  String? createdOn,  int status)?  $default,) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.id,_that.name,_that.estateName,_that.estateId,_that.location,_that.floors,_that.units,_that.occupied,_that.categories,_that.features,_that.email,_that.commission,_that.createdOn,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyModel extends PropertyModel {
  const _PropertyModel({required this.id, this.name, this.estateName, this.estateId, this.location, this.floors = 0, this.units = 0, this.occupied = 0, this.categories = 0, this.features = 0, this.email, this.commission = 0, this.createdOn, this.status = 0}): super._();
  factory _PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);

@override final  int id;
@override final  String? name;
@override final  String? estateName;
@override final  int? estateId;
@override final  String? location;
@override@JsonKey() final  int floors;
@override@JsonKey() final  int units;
@override@JsonKey() final  int occupied;
@override@JsonKey() final  int categories;
@override@JsonKey() final  int features;
@override final  String? email;
@override@JsonKey() final  double commission;
@override final  String? createdOn;
@override@JsonKey() final  int status;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyModelCopyWith<_PropertyModel> get copyWith => __$PropertyModelCopyWithImpl<_PropertyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.location, location) || other.location == location)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.features, features) || other.features == features)&&(identical(other.email, email) || other.email == email)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estateName,estateId,location,floors,units,occupied,categories,features,email,commission,createdOn,status);

@override
String toString() {
  return 'PropertyModel(id: $id, name: $name, estateName: $estateName, estateId: $estateId, location: $location, floors: $floors, units: $units, occupied: $occupied, categories: $categories, features: $features, email: $email, commission: $commission, createdOn: $createdOn, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PropertyModelCopyWith<$Res> implements $PropertyModelCopyWith<$Res> {
  factory _$PropertyModelCopyWith(_PropertyModel value, $Res Function(_PropertyModel) _then) = __$PropertyModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, String? estateName, int? estateId, String? location, int floors, int units, int occupied, int categories, int features, String? email, double commission, String? createdOn, int status
});




}
/// @nodoc
class __$PropertyModelCopyWithImpl<$Res>
    implements _$PropertyModelCopyWith<$Res> {
  __$PropertyModelCopyWithImpl(this._self, this._then);

  final _PropertyModel _self;
  final $Res Function(_PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? location = freezed,Object? floors = null,Object? units = null,Object? occupied = null,Object? categories = null,Object? features = null,Object? email = freezed,Object? commission = null,Object? createdOn = freezed,Object? status = null,}) {
  return _then(_PropertyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as int,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,commission: null == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
