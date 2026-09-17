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

 String get id; String get houseCode; String? get houseNumber; int? get floor;/// Floor 0 as well, so this is what tells a mezzanine unit from a ground-floor one.
 bool get mezzanine;/// The floor in words — "Ground Floor", "First Floor", "Basement".
 String? get floorLabel;/// Number and floor together, which is how somebody reads a unit out.
 String? get label; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String? get categoryName;/// Residential, Commercial — the legacy list's "House Type" column.
 String? get usageClassName; String? get tenure;/// Null where the category does not allow bedrooms — an office, a stall. Render nothing
/// rather than "0 beds", which is wrong rather than empty.
 int? get beds; int? get baths; int? get ensuite; bool get dsq; int? get parking; double? get squareFt;/// Null for an owned unit, which carries a service charge instead.
 double? get rent; bool get occupied; int get status; String? get createdOn;
/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseModelCopyWith<HouseModel> get copyWith => _$HouseModelCopyWithImpl<HouseModel>(this as HouseModel, _$identity);

  /// Serializes this HouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.mezzanine, mezzanine) || other.mezzanine == mezzanine)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.label, label) || other.label == label)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.beds, beds) || other.beds == beds)&&(identical(other.baths, baths) || other.baths == baths)&&(identical(other.ensuite, ensuite) || other.ensuite == ensuite)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseCode,houseNumber,floor,mezzanine,floorLabel,label,propertyId,propertyName,estateId,estateName,categoryName,usageClassName,tenure,beds,baths,ensuite,dsq,parking,squareFt,rent,occupied,status,createdOn]);

@override
String toString() {
  return 'HouseModel(id: $id, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, mezzanine: $mezzanine, floorLabel: $floorLabel, label: $label, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, beds: $beds, baths: $baths, ensuite: $ensuite, dsq: $dsq, parking: $parking, squareFt: $squareFt, rent: $rent, occupied: $occupied, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $HouseModelCopyWith<$Res>  {
  factory $HouseModelCopyWith(HouseModel value, $Res Function(HouseModel) _then) = _$HouseModelCopyWithImpl;
@useResult
$Res call({
 String id, String houseCode, String? houseNumber, int? floor, bool mezzanine, String? floorLabel, String? label, String? propertyId, String? propertyName, String? estateId, String? estateName, String? categoryName, String? usageClassName, String? tenure, int? beds, int? baths, int? ensuite, bool dsq, int? parking, double? squareFt, double? rent, bool occupied, int status, String? createdOn
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseCode = null,Object? houseNumber = freezed,Object? floor = freezed,Object? mezzanine = null,Object? floorLabel = freezed,Object? label = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? beds = freezed,Object? baths = freezed,Object? ensuite = freezed,Object? dsq = null,Object? parking = freezed,Object? squareFt = freezed,Object? rent = freezed,Object? occupied = null,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,mezzanine: null == mezzanine ? _self.mezzanine : mezzanine // ignore: cast_nullable_to_non_nullable
as bool,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,beds: freezed == beds ? _self.beds : beds // ignore: cast_nullable_to_non_nullable
as int?,baths: freezed == baths ? _self.baths : baths // ignore: cast_nullable_to_non_nullable
as int?,ensuite: freezed == ensuite ? _self.ensuite : ensuite // ignore: cast_nullable_to_non_nullable
as int?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? label,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  int status,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.label,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? label,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  int status,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _HouseModel():
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.label,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? label,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  int status,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _HouseModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.label,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.status,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseModel extends HouseModel {
  const _HouseModel({required this.id, required this.houseCode, this.houseNumber, this.floor, this.mezzanine = false, this.floorLabel, this.label, this.propertyId, this.propertyName, this.estateId, this.estateName, this.categoryName, this.usageClassName, this.tenure, this.beds, this.baths, this.ensuite, this.dsq = false, this.parking, this.squareFt, this.rent, this.occupied = false, this.status = 0, this.createdOn}): super._();
  factory _HouseModel.fromJson(Map<String, dynamic> json) => _$HouseModelFromJson(json);

@override final  String id;
@override final  String houseCode;
@override final  String? houseNumber;
@override final  int? floor;
/// Floor 0 as well, so this is what tells a mezzanine unit from a ground-floor one.
@override@JsonKey() final  bool mezzanine;
/// The floor in words — "Ground Floor", "First Floor", "Basement".
@override final  String? floorLabel;
/// Number and floor together, which is how somebody reads a unit out.
@override final  String? label;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? categoryName;
/// Residential, Commercial — the legacy list's "House Type" column.
@override final  String? usageClassName;
@override final  String? tenure;
/// Null where the category does not allow bedrooms — an office, a stall. Render nothing
/// rather than "0 beds", which is wrong rather than empty.
@override final  int? beds;
@override final  int? baths;
@override final  int? ensuite;
@override@JsonKey() final  bool dsq;
@override final  int? parking;
@override final  double? squareFt;
/// Null for an owned unit, which carries a service charge instead.
@override final  double? rent;
@override@JsonKey() final  bool occupied;
@override@JsonKey() final  int status;
@override final  String? createdOn;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.mezzanine, mezzanine) || other.mezzanine == mezzanine)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.label, label) || other.label == label)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.beds, beds) || other.beds == beds)&&(identical(other.baths, baths) || other.baths == baths)&&(identical(other.ensuite, ensuite) || other.ensuite == ensuite)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseCode,houseNumber,floor,mezzanine,floorLabel,label,propertyId,propertyName,estateId,estateName,categoryName,usageClassName,tenure,beds,baths,ensuite,dsq,parking,squareFt,rent,occupied,status,createdOn]);

@override
String toString() {
  return 'HouseModel(id: $id, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, mezzanine: $mezzanine, floorLabel: $floorLabel, label: $label, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, beds: $beds, baths: $baths, ensuite: $ensuite, dsq: $dsq, parking: $parking, squareFt: $squareFt, rent: $rent, occupied: $occupied, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$HouseModelCopyWith<$Res> implements $HouseModelCopyWith<$Res> {
  factory _$HouseModelCopyWith(_HouseModel value, $Res Function(_HouseModel) _then) = __$HouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String houseCode, String? houseNumber, int? floor, bool mezzanine, String? floorLabel, String? label, String? propertyId, String? propertyName, String? estateId, String? estateName, String? categoryName, String? usageClassName, String? tenure, int? beds, int? baths, int? ensuite, bool dsq, int? parking, double? squareFt, double? rent, bool occupied, int status, String? createdOn
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseCode = null,Object? houseNumber = freezed,Object? floor = freezed,Object? mezzanine = null,Object? floorLabel = freezed,Object? label = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? beds = freezed,Object? baths = freezed,Object? ensuite = freezed,Object? dsq = null,Object? parking = freezed,Object? squareFt = freezed,Object? rent = freezed,Object? occupied = null,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_HouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,mezzanine: null == mezzanine ? _self.mezzanine : mezzanine // ignore: cast_nullable_to_non_nullable
as bool,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,beds: freezed == beds ? _self.beds : beds // ignore: cast_nullable_to_non_nullable
as int?,baths: freezed == baths ? _self.baths : baths // ignore: cast_nullable_to_non_nullable
as int?,ensuite: freezed == ensuite ? _self.ensuite : ensuite // ignore: cast_nullable_to_non_nullable
as int?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
