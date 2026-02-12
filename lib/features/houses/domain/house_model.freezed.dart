// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseModel {

 int get id; String? get houseName; String? get houseCode; String? get houseNumber; String? get floor; double get rent; String? get squareFt; String? get propertyName; String? get estateName; String? get categoryName; String? get typeName; String? get location; bool get occupied; String? get status; int get featureCount; String? get imageFilename;
/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseModelCopyWith<HouseModel> get copyWith => _$HouseModelCopyWithImpl<HouseModel>(this as HouseModel, _$identity);

  /// Serializes this HouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.location, location) || other.location == location)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.imageFilename, imageFilename) || other.imageFilename == imageFilename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseName,houseCode,houseNumber,floor,rent,squareFt,propertyName,estateName,categoryName,typeName,location,occupied,status,featureCount,imageFilename);

@override
String toString() {
  return 'HouseModel(id: $id, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, rent: $rent, squareFt: $squareFt, propertyName: $propertyName, estateName: $estateName, categoryName: $categoryName, typeName: $typeName, location: $location, occupied: $occupied, status: $status, featureCount: $featureCount, imageFilename: $imageFilename)';
}


}

/// @nodoc
abstract mixin class $HouseModelCopyWith<$Res>  {
  factory $HouseModelCopyWith(HouseModel value, $Res Function(HouseModel) _then) = _$HouseModelCopyWithImpl;
@useResult
$Res call({
 int id, String? houseName, String? houseCode, String? houseNumber, String? floor, double rent, String? squareFt, String? propertyName, String? estateName, String? categoryName, String? typeName, String? location, bool occupied, String? status, int featureCount, String? imageFilename
});




}
/// @nodoc
class _$HouseModelCopyWithImpl<$Res>
    implements $HouseModelCopyWith<$Res> {
  _$HouseModelCopyWithImpl(this._self, this._then);

  final HouseModel _self;
  final $Res Function(HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? floor = freezed,Object? rent = null,Object? squareFt = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? categoryName = freezed,Object? typeName = freezed,Object? location = freezed,Object? occupied = null,Object? status = freezed,Object? featureCount = null,Object? imageFilename = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,featureCount: null == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int,imageFilename: freezed == imageFilename ? _self.imageFilename : imageFilename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseModel].
extension HouseModelPatterns on HouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseModel value)  $default,){
final _that = this;
switch (_that) {
case _HouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? houseName,  String? houseCode,  String? houseNumber,  String? floor,  double rent,  String? squareFt,  String? propertyName,  String? estateName,  String? categoryName,  String? typeName,  String? location,  bool occupied,  String? status,  int featureCount,  String? imageFilename)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseCode,_that.houseNumber,_that.floor,_that.rent,_that.squareFt,_that.propertyName,_that.estateName,_that.categoryName,_that.typeName,_that.location,_that.occupied,_that.status,_that.featureCount,_that.imageFilename);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? houseName,  String? houseCode,  String? houseNumber,  String? floor,  double rent,  String? squareFt,  String? propertyName,  String? estateName,  String? categoryName,  String? typeName,  String? location,  bool occupied,  String? status,  int featureCount,  String? imageFilename)  $default,) {final _that = this;
switch (_that) {
case _HouseModel():
return $default(_that.id,_that.houseName,_that.houseCode,_that.houseNumber,_that.floor,_that.rent,_that.squareFt,_that.propertyName,_that.estateName,_that.categoryName,_that.typeName,_that.location,_that.occupied,_that.status,_that.featureCount,_that.imageFilename);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? houseName,  String? houseCode,  String? houseNumber,  String? floor,  double rent,  String? squareFt,  String? propertyName,  String? estateName,  String? categoryName,  String? typeName,  String? location,  bool occupied,  String? status,  int featureCount,  String? imageFilename)?  $default,) {final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseCode,_that.houseNumber,_that.floor,_that.rent,_that.squareFt,_that.propertyName,_that.estateName,_that.categoryName,_that.typeName,_that.location,_that.occupied,_that.status,_that.featureCount,_that.imageFilename);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseModel extends HouseModel {
  const _HouseModel({required this.id, this.houseName, this.houseCode, this.houseNumber, this.floor, this.rent = 0, this.squareFt, this.propertyName, this.estateName, this.categoryName, this.typeName, this.location, this.occupied = false, this.status, this.featureCount = 0, this.imageFilename}): super._();
  factory _HouseModel.fromJson(Map<String, dynamic> json) => _$HouseModelFromJson(json);

@override final  int id;
@override final  String? houseName;
@override final  String? houseCode;
@override final  String? houseNumber;
@override final  String? floor;
@override@JsonKey() final  double rent;
@override final  String? squareFt;
@override final  String? propertyName;
@override final  String? estateName;
@override final  String? categoryName;
@override final  String? typeName;
@override final  String? location;
@override@JsonKey() final  bool occupied;
@override final  String? status;
@override@JsonKey() final  int featureCount;
@override final  String? imageFilename;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseModelCopyWith<_HouseModel> get copyWith => __$HouseModelCopyWithImpl<_HouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.location, location) || other.location == location)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.imageFilename, imageFilename) || other.imageFilename == imageFilename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseName,houseCode,houseNumber,floor,rent,squareFt,propertyName,estateName,categoryName,typeName,location,occupied,status,featureCount,imageFilename);

@override
String toString() {
  return 'HouseModel(id: $id, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, rent: $rent, squareFt: $squareFt, propertyName: $propertyName, estateName: $estateName, categoryName: $categoryName, typeName: $typeName, location: $location, occupied: $occupied, status: $status, featureCount: $featureCount, imageFilename: $imageFilename)';
}


}

/// @nodoc
abstract mixin class _$HouseModelCopyWith<$Res> implements $HouseModelCopyWith<$Res> {
  factory _$HouseModelCopyWith(_HouseModel value, $Res Function(_HouseModel) _then) = __$HouseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? houseName, String? houseCode, String? houseNumber, String? floor, double rent, String? squareFt, String? propertyName, String? estateName, String? categoryName, String? typeName, String? location, bool occupied, String? status, int featureCount, String? imageFilename
});




}
/// @nodoc
class __$HouseModelCopyWithImpl<$Res>
    implements _$HouseModelCopyWith<$Res> {
  __$HouseModelCopyWithImpl(this._self, this._then);

  final _HouseModel _self;
  final $Res Function(_HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? floor = freezed,Object? rent = null,Object? squareFt = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? categoryName = freezed,Object? typeName = freezed,Object? location = freezed,Object? occupied = null,Object? status = freezed,Object? featureCount = null,Object? imageFilename = freezed,}) {
  return _then(_HouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,featureCount: null == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int,imageFilename: freezed == imageFilename ? _self.imageFilename : imageFilename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
