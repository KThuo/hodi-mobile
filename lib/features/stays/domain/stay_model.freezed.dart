// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StayModel {

 String get id; String get title; String? get categoryName; String? get propertyName;/// Where it is, as somebody would say it — "Kilimani", not a coordinate.
 String? get area;@JsonKey(fromJson: parseDoubleNullable) double? get nightlyRate;@JsonKey(fromJson: parseDoubleNullable) double? get stayTotal; int? get nights; int? get bedrooms; int? get bathrooms; int? get sleeps; double? get latitude; double? get longitude; double? get distanceKm; List<String> get images; int get imageCount;
/// Create a copy of StayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StayModelCopyWith<StayModel> get copyWith => _$StayModelCopyWithImpl<StayModel>(this as StayModel, _$identity);

  /// Serializes this StayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.nightlyRate, nightlyRate) || other.nightlyRate == nightlyRate)&&(identical(other.stayTotal, stayTotal) || other.stayTotal == stayTotal)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.sleeps, sleeps) || other.sleeps == sleeps)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,propertyName,area,nightlyRate,stayTotal,nights,bedrooms,bathrooms,sleeps,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(images),imageCount);

@override
String toString() {
  return 'StayModel(id: $id, title: $title, categoryName: $categoryName, propertyName: $propertyName, area: $area, nightlyRate: $nightlyRate, stayTotal: $stayTotal, nights: $nights, bedrooms: $bedrooms, bathrooms: $bathrooms, sleeps: $sleeps, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, images: $images, imageCount: $imageCount)';
}


}

/// @nodoc
abstract mixin class $StayModelCopyWith<$Res>  {
  factory $StayModelCopyWith(StayModel value, $Res Function(StayModel) _then) = _$StayModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? categoryName, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? nightlyRate,@JsonKey(fromJson: parseDoubleNullable) double? stayTotal, int? nights, int? bedrooms, int? bathrooms, int? sleeps, double? latitude, double? longitude, double? distanceKm, List<String> images, int imageCount
});




}
/// @nodoc
class _$StayModelCopyWithImpl<$Res>
    implements $StayModelCopyWith<$Res> {
  _$StayModelCopyWithImpl(this._self, this._then);

  final StayModel _self;
  final $Res Function(StayModel) _then;

/// Create a copy of StayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? propertyName = freezed,Object? area = freezed,Object? nightlyRate = freezed,Object? stayTotal = freezed,Object? nights = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? sleeps = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? images = null,Object? imageCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,nightlyRate: freezed == nightlyRate ? _self.nightlyRate : nightlyRate // ignore: cast_nullable_to_non_nullable
as double?,stayTotal: freezed == stayTotal ? _self.stayTotal : stayTotal // ignore: cast_nullable_to_non_nullable
as double?,nights: freezed == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,sleeps: freezed == sleeps ? _self.sleeps : sleeps // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StayModel].
extension StayModelPatterns on StayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StayModel value)  $default,){
final _that = this;
switch (_that) {
case _StayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StayModel value)?  $default,){
final _that = this;
switch (_that) {
case _StayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate, @JsonKey(fromJson: parseDoubleNullable)  double? stayTotal,  int? nights,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  double? distanceKm,  List<String> images,  int imageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StayModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.nightlyRate,_that.stayTotal,_that.nights,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate, @JsonKey(fromJson: parseDoubleNullable)  double? stayTotal,  int? nights,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  double? distanceKm,  List<String> images,  int imageCount)  $default,) {final _that = this;
switch (_that) {
case _StayModel():
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.nightlyRate,_that.stayTotal,_that.nights,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? nightlyRate, @JsonKey(fromJson: parseDoubleNullable)  double? stayTotal,  int? nights,  int? bedrooms,  int? bathrooms,  int? sleeps,  double? latitude,  double? longitude,  double? distanceKm,  List<String> images,  int imageCount)?  $default,) {final _that = this;
switch (_that) {
case _StayModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.nightlyRate,_that.stayTotal,_that.nights,_that.bedrooms,_that.bathrooms,_that.sleeps,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StayModel extends StayModel {
  const _StayModel({required this.id, this.title = '', this.categoryName, this.propertyName, this.area, @JsonKey(fromJson: parseDoubleNullable) this.nightlyRate, @JsonKey(fromJson: parseDoubleNullable) this.stayTotal, this.nights, this.bedrooms, this.bathrooms, this.sleeps, this.latitude, this.longitude, this.distanceKm, final  List<String> images = const [], this.imageCount = 0}): _images = images,super._();
  factory _StayModel.fromJson(Map<String, dynamic> json) => _$StayModelFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override final  String? categoryName;
@override final  String? propertyName;
/// Where it is, as somebody would say it — "Kilimani", not a coordinate.
@override final  String? area;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? nightlyRate;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? stayTotal;
@override final  int? nights;
@override final  int? bedrooms;
@override final  int? bathrooms;
@override final  int? sleeps;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  int imageCount;

/// Create a copy of StayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StayModelCopyWith<_StayModel> get copyWith => __$StayModelCopyWithImpl<_StayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StayModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.nightlyRate, nightlyRate) || other.nightlyRate == nightlyRate)&&(identical(other.stayTotal, stayTotal) || other.stayTotal == stayTotal)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.sleeps, sleeps) || other.sleeps == sleeps)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,propertyName,area,nightlyRate,stayTotal,nights,bedrooms,bathrooms,sleeps,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(_images),imageCount);

@override
String toString() {
  return 'StayModel(id: $id, title: $title, categoryName: $categoryName, propertyName: $propertyName, area: $area, nightlyRate: $nightlyRate, stayTotal: $stayTotal, nights: $nights, bedrooms: $bedrooms, bathrooms: $bathrooms, sleeps: $sleeps, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, images: $images, imageCount: $imageCount)';
}


}

/// @nodoc
abstract mixin class _$StayModelCopyWith<$Res> implements $StayModelCopyWith<$Res> {
  factory _$StayModelCopyWith(_StayModel value, $Res Function(_StayModel) _then) = __$StayModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? categoryName, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? nightlyRate,@JsonKey(fromJson: parseDoubleNullable) double? stayTotal, int? nights, int? bedrooms, int? bathrooms, int? sleeps, double? latitude, double? longitude, double? distanceKm, List<String> images, int imageCount
});




}
/// @nodoc
class __$StayModelCopyWithImpl<$Res>
    implements _$StayModelCopyWith<$Res> {
  __$StayModelCopyWithImpl(this._self, this._then);

  final _StayModel _self;
  final $Res Function(_StayModel) _then;

/// Create a copy of StayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? propertyName = freezed,Object? area = freezed,Object? nightlyRate = freezed,Object? stayTotal = freezed,Object? nights = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? sleeps = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? images = null,Object? imageCount = null,}) {
  return _then(_StayModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,nightlyRate: freezed == nightlyRate ? _self.nightlyRate : nightlyRate // ignore: cast_nullable_to_non_nullable
as double?,stayTotal: freezed == stayTotal ? _self.stayTotal : stayTotal // ignore: cast_nullable_to_non_nullable
as double?,nights: freezed == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,sleeps: freezed == sleeps ? _self.sleeps : sleeps // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
