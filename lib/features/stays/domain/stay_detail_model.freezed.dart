// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stay_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StayDetailModel {

 String get id; String get title; String? get categoryName; String? get description; String? get propertyName; String? get area;@JsonKey(fromJson: parseDoubleNullable) double? get nightlyRate; int? get bedrooms; int? get bathrooms; int? get sleeps; double? get latitude; double? get longitude; List<String> get images; List<StayAmenity> get amenities;/// The shortest booking this place takes. Shown before somebody picks dates, because finding
/// out after choosing is finding out too late.
 int get minNights; String? get contactName; String? get contactPhone; String? get contactEmail;
/// Create a copy of StayDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StayDetailModelCopyWith<StayDetailModel> get copyWith => _$StayDetailModelCopyWithImpl<StayDetailModel>(this as StayDetailModel, _$identity);

  /// Serializes this StayDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StayDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.nightlyRate, nightlyRate) || other.nightlyRate == nightlyRate)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.sleeps, sleeps) || other.sleeps == sleeps)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,description,propertyName,area,nightlyRate,bedrooms,bathrooms,sleeps,latitude,longitude,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(amenities),minNights,contactName,contactPhone,contactEmail);

@override
String toString() {
  return 'StayDetailModel(id: $id, title: $title, categoryName: $categoryName, description: $description, propertyName: $propertyName, area: $area, nightlyRate: $nightlyRate, bedrooms: $bedrooms, bathrooms: $bathrooms, sleeps: $sleeps, latitude: $latitude, longitude: $longitude, images: $images, amenities: $amenities, minNights: $minNights, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class $StayDetailModelCopyWith<$Res>  {
  factory $StayDetailModelCopyWith(StayDetailModel value, $Res Function(StayDetailModel) _then) = _$StayDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? categoryName, String? description, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? nightlyRate, int? bedrooms, int? bathrooms, int? sleeps, double? latitude, double? longitude, List<String> images, List<StayAmenity> amenities, int minNights, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class _$StayDetailModelCopyWithImpl<$Res>
    implements $StayDetailModelCopyWith<$Res> {
  _$StayDetailModelCopyWithImpl(this._self, this._then);

  final StayDetailModel _self;
  final $Res Function(StayDetailModel) _then;

/// Create a copy of StayDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? description = freezed,Object? propertyName = freezed,Object? area = freezed,Object? nightlyRate = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? sleeps = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? images = null,Object? amenities = null,Object? minNights = null,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,nightlyRate: freezed == nightlyRate ? _self.nightlyRate : nightlyRate // ignore: cast_nullable_to_non_nullable
as double?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,sleeps: freezed == sleeps ? _self.sleeps : sleeps // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<StayAmenity>,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StayDetailModel].
extension StayDetailModelPatterns on StayDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StayDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StayDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StayDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _StayDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StayDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _StayDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  List<String> images,  List<StayAmenity> amenities,  int minNights,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StayDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.description,_that.propertyName,_that.area,_that.nightlyRate,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.minNights,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  List<String> images,  List<StayAmenity> amenities,  int minNights,  String? contactName,  String? contactPhone,  String? contactEmail)  $default,) {final _that = this;
switch (_that) {
case _StayDetailModel():
return $default(_that.id,_that.title,_that.categoryName,_that.description,_that.propertyName,_that.area,_that.nightlyRate,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.minNights,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? categoryName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  List<String> images,  List<StayAmenity> amenities,  int minNights,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,) {final _that = this;
switch (_that) {
case _StayDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.description,_that.propertyName,_that.area,_that.nightlyRate,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.minNights,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StayDetailModel extends StayDetailModel {
  const _StayDetailModel({required this.id, required this.title, this.categoryName, this.description, this.propertyName, this.area, @JsonKey(fromJson: parseDoubleNullable) this.nightlyRate, this.bedrooms, this.bathrooms, this.sleeps, this.latitude, this.longitude, final  List<String> images = const <String>[], final  List<StayAmenity> amenities = const <StayAmenity>[], this.minNights = 1, this.contactName, this.contactPhone, this.contactEmail}): _images = images,_amenities = amenities,super._();
  factory _StayDetailModel.fromJson(Map<String, dynamic> json) => _$StayDetailModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? categoryName;
@override final  String? description;
@override final  String? propertyName;
@override final  String? area;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? nightlyRate;
@override final  int? bedrooms;
@override final  int? bathrooms;
@override final  int? sleeps;
@override final  double? latitude;
@override final  double? longitude;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<StayAmenity> _amenities;
@override@JsonKey() List<StayAmenity> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

/// The shortest booking this place takes. Shown before somebody picks dates, because finding
/// out after choosing is finding out too late.
@override@JsonKey() final  int minNights;
@override final  String? contactName;
@override final  String? contactPhone;
@override final  String? contactEmail;

/// Create a copy of StayDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StayDetailModelCopyWith<_StayDetailModel> get copyWith => __$StayDetailModelCopyWithImpl<_StayDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StayDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StayDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.description, description) || other.description == description)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.nightlyRate, nightlyRate) || other.nightlyRate == nightlyRate)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.sleeps, sleeps) || other.sleeps == sleeps)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,description,propertyName,area,nightlyRate,bedrooms,bathrooms,sleeps,latitude,longitude,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_amenities),minNights,contactName,contactPhone,contactEmail);

@override
String toString() {
  return 'StayDetailModel(id: $id, title: $title, categoryName: $categoryName, description: $description, propertyName: $propertyName, area: $area, nightlyRate: $nightlyRate, bedrooms: $bedrooms, bathrooms: $bathrooms, sleeps: $sleeps, latitude: $latitude, longitude: $longitude, images: $images, amenities: $amenities, minNights: $minNights, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class _$StayDetailModelCopyWith<$Res> implements $StayDetailModelCopyWith<$Res> {
  factory _$StayDetailModelCopyWith(_StayDetailModel value, $Res Function(_StayDetailModel) _then) = __$StayDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? categoryName, String? description, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? nightlyRate, int? bedrooms, int? bathrooms, int? sleeps, double? latitude, double? longitude, List<String> images, List<StayAmenity> amenities, int minNights, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class __$StayDetailModelCopyWithImpl<$Res>
    implements _$StayDetailModelCopyWith<$Res> {
  __$StayDetailModelCopyWithImpl(this._self, this._then);

  final _StayDetailModel _self;
  final $Res Function(_StayDetailModel) _then;

/// Create a copy of StayDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? description = freezed,Object? propertyName = freezed,Object? area = freezed,Object? nightlyRate = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? sleeps = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? images = null,Object? amenities = null,Object? minNights = null,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_StayDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,nightlyRate: freezed == nightlyRate ? _self.nightlyRate : nightlyRate // ignore: cast_nullable_to_non_nullable
as double?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,sleeps: freezed == sleeps ? _self.sleeps : sleeps // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<StayAmenity>,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StayAmenity {

 String get name; String? get icon;
/// Create a copy of StayAmenity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StayAmenityCopyWith<StayAmenity> get copyWith => _$StayAmenityCopyWithImpl<StayAmenity>(this as StayAmenity, _$identity);

  /// Serializes this StayAmenity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StayAmenity&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'StayAmenity(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $StayAmenityCopyWith<$Res>  {
  factory $StayAmenityCopyWith(StayAmenity value, $Res Function(StayAmenity) _then) = _$StayAmenityCopyWithImpl;
@useResult
$Res call({
 String name, String? icon
});




}
/// @nodoc
class _$StayAmenityCopyWithImpl<$Res>
    implements $StayAmenityCopyWith<$Res> {
  _$StayAmenityCopyWithImpl(this._self, this._then);

  final StayAmenity _self;
  final $Res Function(StayAmenity) _then;

/// Create a copy of StayAmenity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StayAmenity].
extension StayAmenityPatterns on StayAmenity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StayAmenity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StayAmenity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StayAmenity value)  $default,){
final _that = this;
switch (_that) {
case _StayAmenity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StayAmenity value)?  $default,){
final _that = this;
switch (_that) {
case _StayAmenity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StayAmenity() when $default != null:
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _StayAmenity():
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _StayAmenity() when $default != null:
return $default(_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StayAmenity extends StayAmenity {
  const _StayAmenity({required this.name, this.icon}): super._();
  factory _StayAmenity.fromJson(Map<String, dynamic> json) => _$StayAmenityFromJson(json);

@override final  String name;
@override final  String? icon;

/// Create a copy of StayAmenity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StayAmenityCopyWith<_StayAmenity> get copyWith => __$StayAmenityCopyWithImpl<_StayAmenity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StayAmenityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StayAmenity&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'StayAmenity(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$StayAmenityCopyWith<$Res> implements $StayAmenityCopyWith<$Res> {
  factory _$StayAmenityCopyWith(_StayAmenity value, $Res Function(_StayAmenity) _then) = __$StayAmenityCopyWithImpl;
@override @useResult
$Res call({
 String name, String? icon
});




}
/// @nodoc
class __$StayAmenityCopyWithImpl<$Res>
    implements _$StayAmenityCopyWith<$Res> {
  __$StayAmenityCopyWithImpl(this._self, this._then);

  final _StayAmenity _self;
  final $Res Function(_StayAmenity) _then;

/// Create a copy of StayAmenity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? icon = freezed,}) {
  return _then(_StayAmenity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StayQuoteModel {

 String? get checkIn; String? get checkOut; int get nights;@JsonKey(fromJson: parseDouble) double get nightsTotal;@JsonKey(fromJson: parseDouble) double get cleaningFee;@JsonKey(fromJson: parseDouble) double get total; String get currency; int get minNights; bool get available;/// Why not, in the server's words — "those nights are taken", "under the minimum stay".
 List<String> get reasons;
/// Create a copy of StayQuoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StayQuoteModelCopyWith<StayQuoteModel> get copyWith => _$StayQuoteModelCopyWithImpl<StayQuoteModel>(this as StayQuoteModel, _$identity);

  /// Serializes this StayQuoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StayQuoteModel&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.nightsTotal, nightsTotal) || other.nightsTotal == nightsTotal)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.available, available) || other.available == available)&&const DeepCollectionEquality().equals(other.reasons, reasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkIn,checkOut,nights,nightsTotal,cleaningFee,total,currency,minNights,available,const DeepCollectionEquality().hash(reasons));

@override
String toString() {
  return 'StayQuoteModel(checkIn: $checkIn, checkOut: $checkOut, nights: $nights, nightsTotal: $nightsTotal, cleaningFee: $cleaningFee, total: $total, currency: $currency, minNights: $minNights, available: $available, reasons: $reasons)';
}


}

/// @nodoc
abstract mixin class $StayQuoteModelCopyWith<$Res>  {
  factory $StayQuoteModelCopyWith(StayQuoteModel value, $Res Function(StayQuoteModel) _then) = _$StayQuoteModelCopyWithImpl;
@useResult
$Res call({
 String? checkIn, String? checkOut, int nights,@JsonKey(fromJson: parseDouble) double nightsTotal,@JsonKey(fromJson: parseDouble) double cleaningFee,@JsonKey(fromJson: parseDouble) double total, String currency, int minNights, bool available, List<String> reasons
});




}
/// @nodoc
class _$StayQuoteModelCopyWithImpl<$Res>
    implements $StayQuoteModelCopyWith<$Res> {
  _$StayQuoteModelCopyWithImpl(this._self, this._then);

  final StayQuoteModel _self;
  final $Res Function(StayQuoteModel) _then;

/// Create a copy of StayQuoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkIn = freezed,Object? checkOut = freezed,Object? nights = null,Object? nightsTotal = null,Object? cleaningFee = null,Object? total = null,Object? currency = null,Object? minNights = null,Object? available = null,Object? reasons = null,}) {
  return _then(_self.copyWith(
checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as String?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as String?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,nightsTotal: null == nightsTotal ? _self.nightsTotal : nightsTotal // ignore: cast_nullable_to_non_nullable
as double,cleaningFee: null == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,reasons: null == reasons ? _self.reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [StayQuoteModel].
extension StayQuoteModelPatterns on StayQuoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StayQuoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StayQuoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StayQuoteModel value)  $default,){
final _that = this;
switch (_that) {
case _StayQuoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StayQuoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _StayQuoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? checkIn,  String? checkOut,  int nights, @JsonKey(fromJson: parseDouble)  double nightsTotal, @JsonKey(fromJson: parseDouble)  double cleaningFee, @JsonKey(fromJson: parseDouble)  double total,  String currency,  int minNights,  bool available,  List<String> reasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StayQuoteModel() when $default != null:
return $default(_that.checkIn,_that.checkOut,_that.nights,_that.nightsTotal,_that.cleaningFee,_that.total,_that.currency,_that.minNights,_that.available,_that.reasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? checkIn,  String? checkOut,  int nights, @JsonKey(fromJson: parseDouble)  double nightsTotal, @JsonKey(fromJson: parseDouble)  double cleaningFee, @JsonKey(fromJson: parseDouble)  double total,  String currency,  int minNights,  bool available,  List<String> reasons)  $default,) {final _that = this;
switch (_that) {
case _StayQuoteModel():
return $default(_that.checkIn,_that.checkOut,_that.nights,_that.nightsTotal,_that.cleaningFee,_that.total,_that.currency,_that.minNights,_that.available,_that.reasons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? checkIn,  String? checkOut,  int nights, @JsonKey(fromJson: parseDouble)  double nightsTotal, @JsonKey(fromJson: parseDouble)  double cleaningFee, @JsonKey(fromJson: parseDouble)  double total,  String currency,  int minNights,  bool available,  List<String> reasons)?  $default,) {final _that = this;
switch (_that) {
case _StayQuoteModel() when $default != null:
return $default(_that.checkIn,_that.checkOut,_that.nights,_that.nightsTotal,_that.cleaningFee,_that.total,_that.currency,_that.minNights,_that.available,_that.reasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StayQuoteModel extends StayQuoteModel {
  const _StayQuoteModel({this.checkIn, this.checkOut, this.nights = 0, @JsonKey(fromJson: parseDouble) this.nightsTotal = 0, @JsonKey(fromJson: parseDouble) this.cleaningFee = 0, @JsonKey(fromJson: parseDouble) this.total = 0, this.currency = 'KES', this.minNights = 1, this.available = false, final  List<String> reasons = const <String>[]}): _reasons = reasons,super._();
  factory _StayQuoteModel.fromJson(Map<String, dynamic> json) => _$StayQuoteModelFromJson(json);

@override final  String? checkIn;
@override final  String? checkOut;
@override@JsonKey() final  int nights;
@override@JsonKey(fromJson: parseDouble) final  double nightsTotal;
@override@JsonKey(fromJson: parseDouble) final  double cleaningFee;
@override@JsonKey(fromJson: parseDouble) final  double total;
@override@JsonKey() final  String currency;
@override@JsonKey() final  int minNights;
@override@JsonKey() final  bool available;
/// Why not, in the server's words — "those nights are taken", "under the minimum stay".
 final  List<String> _reasons;
/// Why not, in the server's words — "those nights are taken", "under the minimum stay".
@override@JsonKey() List<String> get reasons {
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasons);
}


/// Create a copy of StayQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StayQuoteModelCopyWith<_StayQuoteModel> get copyWith => __$StayQuoteModelCopyWithImpl<_StayQuoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StayQuoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StayQuoteModel&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.nightsTotal, nightsTotal) || other.nightsTotal == nightsTotal)&&(identical(other.cleaningFee, cleaningFee) || other.cleaningFee == cleaningFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.minNights, minNights) || other.minNights == minNights)&&(identical(other.available, available) || other.available == available)&&const DeepCollectionEquality().equals(other._reasons, _reasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkIn,checkOut,nights,nightsTotal,cleaningFee,total,currency,minNights,available,const DeepCollectionEquality().hash(_reasons));

@override
String toString() {
  return 'StayQuoteModel(checkIn: $checkIn, checkOut: $checkOut, nights: $nights, nightsTotal: $nightsTotal, cleaningFee: $cleaningFee, total: $total, currency: $currency, minNights: $minNights, available: $available, reasons: $reasons)';
}


}

/// @nodoc
abstract mixin class _$StayQuoteModelCopyWith<$Res> implements $StayQuoteModelCopyWith<$Res> {
  factory _$StayQuoteModelCopyWith(_StayQuoteModel value, $Res Function(_StayQuoteModel) _then) = __$StayQuoteModelCopyWithImpl;
@override @useResult
$Res call({
 String? checkIn, String? checkOut, int nights,@JsonKey(fromJson: parseDouble) double nightsTotal,@JsonKey(fromJson: parseDouble) double cleaningFee,@JsonKey(fromJson: parseDouble) double total, String currency, int minNights, bool available, List<String> reasons
});




}
/// @nodoc
class __$StayQuoteModelCopyWithImpl<$Res>
    implements _$StayQuoteModelCopyWith<$Res> {
  __$StayQuoteModelCopyWithImpl(this._self, this._then);

  final _StayQuoteModel _self;
  final $Res Function(_StayQuoteModel) _then;

/// Create a copy of StayQuoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkIn = freezed,Object? checkOut = freezed,Object? nights = null,Object? nightsTotal = null,Object? cleaningFee = null,Object? total = null,Object? currency = null,Object? minNights = null,Object? available = null,Object? reasons = null,}) {
  return _then(_StayQuoteModel(
checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as String?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as String?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,nightsTotal: null == nightsTotal ? _self.nightsTotal : nightsTotal // ignore: cast_nullable_to_non_nullable
as double,cleaningFee: null == cleaningFee ? _self.cleaningFee : cleaningFee // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,minNights: null == minNights ? _self.minNights : minNights // ignore: cast_nullable_to_non_nullable
as int,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,reasons: null == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
