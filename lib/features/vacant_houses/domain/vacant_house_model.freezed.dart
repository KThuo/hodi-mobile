// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacant_house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacantHouseModel {

 String get id;/// What to call it, composed by the server. There is no `houseName`.
 String get title; String? get categoryName; String? get propertyName;/// Where it is, as somebody would say it — "Kilimani", not a coordinate.
 String? get area;@JsonKey(fromJson: parseDoubleNullable) double? get rent; int? get bedrooms; int? get bathrooms;@JsonKey(fromJson: parseDoubleNullable) double? get squareFt; bool get dsq; int? get parkingSpaces; double? get latitude; double? get longitude;/// How far from where somebody searched, when they searched by location.
@JsonKey(fromJson: parseDoubleNullable) double? get distanceKm; List<String> get images; int get imageCount; String? get availableFrom;
/// Create a copy of VacantHouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseModelCopyWith<VacantHouseModel> get copyWith => _$VacantHouseModelCopyWithImpl<VacantHouseModel>(this as VacantHouseModel, _$identity);

  /// Serializes this VacantHouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,propertyName,area,rent,bedrooms,bathrooms,squareFt,dsq,parkingSpaces,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(images),imageCount,availableFrom);

@override
String toString() {
  return 'VacantHouseModel(id: $id, title: $title, categoryName: $categoryName, propertyName: $propertyName, area: $area, rent: $rent, bedrooms: $bedrooms, bathrooms: $bathrooms, squareFt: $squareFt, dsq: $dsq, parkingSpaces: $parkingSpaces, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, images: $images, imageCount: $imageCount, availableFrom: $availableFrom)';
}


}

/// @nodoc
abstract mixin class $VacantHouseModelCopyWith<$Res>  {
  factory $VacantHouseModelCopyWith(VacantHouseModel value, $Res Function(VacantHouseModel) _then) = _$VacantHouseModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? categoryName, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? rent, int? bedrooms, int? bathrooms,@JsonKey(fromJson: parseDoubleNullable) double? squareFt, bool dsq, int? parkingSpaces, double? latitude, double? longitude,@JsonKey(fromJson: parseDoubleNullable) double? distanceKm, List<String> images, int imageCount, String? availableFrom
});




}
/// @nodoc
class _$VacantHouseModelCopyWithImpl<$Res>
    implements $VacantHouseModelCopyWith<$Res> {
  _$VacantHouseModelCopyWithImpl(this._self, this._then);

  final VacantHouseModel _self;
  final $Res Function(VacantHouseModel) _then;

/// Create a copy of VacantHouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? propertyName = freezed,Object? area = freezed,Object? rent = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? squareFt = freezed,Object? dsq = null,Object? parkingSpaces = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? images = null,Object? imageCount = null,Object? availableFrom = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parkingSpaces: freezed == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacantHouseModel].
extension VacantHouseModelPatterns on VacantHouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacantHouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacantHouseModel value)  $default,){
final _that = this;
switch (_that) {
case _VacantHouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacantHouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent,  int? bedrooms,  int? bathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude, @JsonKey(fromJson: parseDoubleNullable)  double? distanceKm,  List<String> images,  int imageCount,  String? availableFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.rent,_that.bedrooms,_that.bathrooms,_that.squareFt,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount,_that.availableFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent,  int? bedrooms,  int? bathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude, @JsonKey(fromJson: parseDoubleNullable)  double? distanceKm,  List<String> images,  int imageCount,  String? availableFrom)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseModel():
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.rent,_that.bedrooms,_that.bathrooms,_that.squareFt,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount,_that.availableFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? categoryName,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent,  int? bedrooms,  int? bathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude, @JsonKey(fromJson: parseDoubleNullable)  double? distanceKm,  List<String> images,  int imageCount,  String? availableFrom)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.propertyName,_that.area,_that.rent,_that.bedrooms,_that.bathrooms,_that.squareFt,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.distanceKm,_that.images,_that.imageCount,_that.availableFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseModel extends VacantHouseModel {
  const _VacantHouseModel({required this.id, this.title = '', this.categoryName, this.propertyName, this.area, @JsonKey(fromJson: parseDoubleNullable) this.rent, this.bedrooms, this.bathrooms, @JsonKey(fromJson: parseDoubleNullable) this.squareFt, this.dsq = false, this.parkingSpaces, this.latitude, this.longitude, @JsonKey(fromJson: parseDoubleNullable) this.distanceKm, final  List<String> images = const <String>[], this.imageCount = 0, this.availableFrom}): _images = images,super._();
  factory _VacantHouseModel.fromJson(Map<String, dynamic> json) => _$VacantHouseModelFromJson(json);

@override final  String id;
/// What to call it, composed by the server. There is no `houseName`.
@override@JsonKey() final  String title;
@override final  String? categoryName;
@override final  String? propertyName;
/// Where it is, as somebody would say it — "Kilimani", not a coordinate.
@override final  String? area;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? rent;
@override final  int? bedrooms;
@override final  int? bathrooms;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? squareFt;
@override@JsonKey() final  bool dsq;
@override final  int? parkingSpaces;
@override final  double? latitude;
@override final  double? longitude;
/// How far from where somebody searched, when they searched by location.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? distanceKm;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  int imageCount;
@override final  String? availableFrom;

/// Create a copy of VacantHouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacantHouseModelCopyWith<_VacantHouseModel> get copyWith => __$VacantHouseModelCopyWithImpl<_VacantHouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacantHouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryName,propertyName,area,rent,bedrooms,bathrooms,squareFt,dsq,parkingSpaces,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(_images),imageCount,availableFrom);

@override
String toString() {
  return 'VacantHouseModel(id: $id, title: $title, categoryName: $categoryName, propertyName: $propertyName, area: $area, rent: $rent, bedrooms: $bedrooms, bathrooms: $bathrooms, squareFt: $squareFt, dsq: $dsq, parkingSpaces: $parkingSpaces, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, images: $images, imageCount: $imageCount, availableFrom: $availableFrom)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseModelCopyWith<$Res> implements $VacantHouseModelCopyWith<$Res> {
  factory _$VacantHouseModelCopyWith(_VacantHouseModel value, $Res Function(_VacantHouseModel) _then) = __$VacantHouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? categoryName, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? rent, int? bedrooms, int? bathrooms,@JsonKey(fromJson: parseDoubleNullable) double? squareFt, bool dsq, int? parkingSpaces, double? latitude, double? longitude,@JsonKey(fromJson: parseDoubleNullable) double? distanceKm, List<String> images, int imageCount, String? availableFrom
});




}
/// @nodoc
class __$VacantHouseModelCopyWithImpl<$Res>
    implements _$VacantHouseModelCopyWith<$Res> {
  __$VacantHouseModelCopyWithImpl(this._self, this._then);

  final _VacantHouseModel _self;
  final $Res Function(_VacantHouseModel) _then;

/// Create a copy of VacantHouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? propertyName = freezed,Object? area = freezed,Object? rent = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? squareFt = freezed,Object? dsq = null,Object? parkingSpaces = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? images = null,Object? imageCount = null,Object? availableFrom = freezed,}) {
  return _then(_VacantHouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parkingSpaces: freezed == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
