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

 String? get id; String? get houseName; String? get houseNumber; String? get houseCode; int get floor; String? get description; String? get category; String? get houseType; String? get location; double? get latitude; double? get longitude; String? get property; String? get estate; double get rent; double? get squareFt; int get featureCount; String? get lastOccupied; String? get imageUrl; String? get distanceText; double? get distance;
/// Create a copy of VacantHouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseModelCopyWith<VacantHouseModel> get copyWith => _$VacantHouseModelCopyWithImpl<VacantHouseModel>(this as VacantHouseModel, _$identity);

  /// Serializes this VacantHouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.distanceText, distanceText) || other.distanceText == distanceText)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseName,houseNumber,houseCode,floor,description,category,houseType,location,latitude,longitude,property,estate,rent,squareFt,featureCount,lastOccupied,imageUrl,distanceText,distance]);

@override
String toString() {
  return 'VacantHouseModel(id: $id, houseName: $houseName, houseNumber: $houseNumber, houseCode: $houseCode, floor: $floor, description: $description, category: $category, houseType: $houseType, location: $location, latitude: $latitude, longitude: $longitude, property: $property, estate: $estate, rent: $rent, squareFt: $squareFt, featureCount: $featureCount, lastOccupied: $lastOccupied, imageUrl: $imageUrl, distanceText: $distanceText, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $VacantHouseModelCopyWith<$Res>  {
  factory $VacantHouseModelCopyWith(VacantHouseModel value, $Res Function(VacantHouseModel) _then) = _$VacantHouseModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? houseName, String? houseNumber, String? houseCode, int floor, String? description, String? category, String? houseType, String? location, double? latitude, double? longitude, String? property, String? estate, double rent, double? squareFt, int featureCount, String? lastOccupied, String? imageUrl, String? distanceText, double? distance
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? houseName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? floor = null,Object? description = freezed,Object? category = freezed,Object? houseType = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? property = freezed,Object? estate = freezed,Object? rent = null,Object? squareFt = freezed,Object? featureCount = null,Object? lastOccupied = freezed,Object? imageUrl = freezed,Object? distanceText = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,featureCount: null == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,distanceText: freezed == distanceText ? _self.distanceText : distanceText // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode,  int floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate,  double rent,  double? squareFt,  int featureCount,  String? lastOccupied,  String? imageUrl,  String? distanceText,  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.distanceText,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode,  int floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate,  double rent,  double? squareFt,  int featureCount,  String? lastOccupied,  String? imageUrl,  String? distanceText,  double? distance)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseModel():
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.distanceText,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode,  int floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate,  double rent,  double? squareFt,  int featureCount,  String? lastOccupied,  String? imageUrl,  String? distanceText,  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.distanceText,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseModel extends VacantHouseModel {
  const _VacantHouseModel({this.id, this.houseName, this.houseNumber, this.houseCode, this.floor = 0, this.description, this.category, this.houseType, this.location, this.latitude, this.longitude, this.property, this.estate, this.rent = 0, this.squareFt, this.featureCount = 0, this.lastOccupied, this.imageUrl, this.distanceText, this.distance}): super._();
  factory _VacantHouseModel.fromJson(Map<String, dynamic> json) => _$VacantHouseModelFromJson(json);

@override final  String? id;
@override final  String? houseName;
@override final  String? houseNumber;
@override final  String? houseCode;
@override@JsonKey() final  int floor;
@override final  String? description;
@override final  String? category;
@override final  String? houseType;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? property;
@override final  String? estate;
@override@JsonKey() final  double rent;
@override final  double? squareFt;
@override@JsonKey() final  int featureCount;
@override final  String? lastOccupied;
@override final  String? imageUrl;
@override final  String? distanceText;
@override final  double? distance;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.distanceText, distanceText) || other.distanceText == distanceText)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseName,houseNumber,houseCode,floor,description,category,houseType,location,latitude,longitude,property,estate,rent,squareFt,featureCount,lastOccupied,imageUrl,distanceText,distance]);

@override
String toString() {
  return 'VacantHouseModel(id: $id, houseName: $houseName, houseNumber: $houseNumber, houseCode: $houseCode, floor: $floor, description: $description, category: $category, houseType: $houseType, location: $location, latitude: $latitude, longitude: $longitude, property: $property, estate: $estate, rent: $rent, squareFt: $squareFt, featureCount: $featureCount, lastOccupied: $lastOccupied, imageUrl: $imageUrl, distanceText: $distanceText, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseModelCopyWith<$Res> implements $VacantHouseModelCopyWith<$Res> {
  factory _$VacantHouseModelCopyWith(_VacantHouseModel value, $Res Function(_VacantHouseModel) _then) = __$VacantHouseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? houseName, String? houseNumber, String? houseCode, int floor, String? description, String? category, String? houseType, String? location, double? latitude, double? longitude, String? property, String? estate, double rent, double? squareFt, int featureCount, String? lastOccupied, String? imageUrl, String? distanceText, double? distance
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? houseName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? floor = null,Object? description = freezed,Object? category = freezed,Object? houseType = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? property = freezed,Object? estate = freezed,Object? rent = null,Object? squareFt = freezed,Object? featureCount = null,Object? lastOccupied = freezed,Object? imageUrl = freezed,Object? distanceText = freezed,Object? distance = freezed,}) {
  return _then(_VacantHouseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,featureCount: null == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,distanceText: freezed == distanceText ? _self.distanceText : distanceText // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
