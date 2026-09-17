// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseDetailModel {

 String get id; String get houseCode; String? get houseNumber; int? get floor; bool get mezzanine; String? get floorLabel; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String? get location; String? get categoryName; String? get usageClassName; String? get tenure; int? get beds; int? get baths; int? get ensuite; bool get dsq; int? get parking; double? get squareFt; double? get rent; bool get occupied;/// The date it was last let, for a vacant unit. Null means never occupied, which is a
/// different fact from "vacant since" and reads differently.
 String? get lastOccupied; int get status; String? get createdOn;/// The unit's own features, not the property's. Arrives with the detail, so there is no
/// second request — the old `catalogue/features/{houseId}` call asked the feature catalogue
/// for a unit it knows nothing about.
 List<NamedRef> get features;/// Sections whose data belongs to a module that does not exist yet. The server names them
/// rather than sending zeroes, because a zero in a money field reads as "nothing owed" when
/// the truth is "not yet computed".
 List<String> get pending;
/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseDetailModelCopyWith<HouseDetailModel> get copyWith => _$HouseDetailModelCopyWithImpl<HouseDetailModel>(this as HouseDetailModel, _$identity);

  /// Serializes this HouseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.mezzanine, mezzanine) || other.mezzanine == mezzanine)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.beds, beds) || other.beds == beds)&&(identical(other.baths, baths) || other.baths == baths)&&(identical(other.ensuite, ensuite) || other.ensuite == ensuite)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.pending, pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseCode,houseNumber,floor,mezzanine,floorLabel,propertyId,propertyName,estateId,estateName,location,categoryName,usageClassName,tenure,beds,baths,ensuite,dsq,parking,squareFt,rent,occupied,lastOccupied,status,createdOn,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(pending)]);

@override
String toString() {
  return 'HouseDetailModel(id: $id, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, mezzanine: $mezzanine, floorLabel: $floorLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, location: $location, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, beds: $beds, baths: $baths, ensuite: $ensuite, dsq: $dsq, parking: $parking, squareFt: $squareFt, rent: $rent, occupied: $occupied, lastOccupied: $lastOccupied, status: $status, createdOn: $createdOn, features: $features, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $HouseDetailModelCopyWith<$Res>  {
  factory $HouseDetailModelCopyWith(HouseDetailModel value, $Res Function(HouseDetailModel) _then) = _$HouseDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String houseCode, String? houseNumber, int? floor, bool mezzanine, String? floorLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? location, String? categoryName, String? usageClassName, String? tenure, int? beds, int? baths, int? ensuite, bool dsq, int? parking, double? squareFt, double? rent, bool occupied, String? lastOccupied, int status, String? createdOn, List<NamedRef> features, List<String> pending
});




}
/// @nodoc
class _$HouseDetailModelCopyWithImpl<$Res>
    implements $HouseDetailModelCopyWith<$Res> {
  _$HouseDetailModelCopyWithImpl(this._self, this._then);

  final HouseDetailModel _self;
  final $Res Function(HouseDetailModel) _then;

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseCode = null,Object? houseNumber = freezed,Object? floor = freezed,Object? mezzanine = null,Object? floorLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? beds = freezed,Object? baths = freezed,Object? ensuite = freezed,Object? dsq = null,Object? parking = freezed,Object? squareFt = freezed,Object? rent = freezed,Object? occupied = null,Object? lastOccupied = freezed,Object? status = null,Object? createdOn = freezed,Object? features = null,Object? pending = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,mezzanine: null == mezzanine ? _self.mezzanine : mezzanine // ignore: cast_nullable_to_non_nullable
as bool,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
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
as bool,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseDetailModel].
extension HouseDetailModelPatterns on HouseDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _HouseDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? location,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  String? lastOccupied,  int status,  String? createdOn,  List<NamedRef> features,  List<String> pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.location,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.lastOccupied,_that.status,_that.createdOn,_that.features,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? location,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  String? lastOccupied,  int status,  String? createdOn,  List<NamedRef> features,  List<String> pending)  $default,) {final _that = this;
switch (_that) {
case _HouseDetailModel():
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.location,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.lastOccupied,_that.status,_that.createdOn,_that.features,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String houseCode,  String? houseNumber,  int? floor,  bool mezzanine,  String? floorLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? location,  String? categoryName,  String? usageClassName,  String? tenure,  int? beds,  int? baths,  int? ensuite,  bool dsq,  int? parking,  double? squareFt,  double? rent,  bool occupied,  String? lastOccupied,  int status,  String? createdOn,  List<NamedRef> features,  List<String> pending)?  $default,) {final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseNumber,_that.floor,_that.mezzanine,_that.floorLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.location,_that.categoryName,_that.usageClassName,_that.tenure,_that.beds,_that.baths,_that.ensuite,_that.dsq,_that.parking,_that.squareFt,_that.rent,_that.occupied,_that.lastOccupied,_that.status,_that.createdOn,_that.features,_that.pending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseDetailModel extends HouseDetailModel {
  const _HouseDetailModel({required this.id, required this.houseCode, this.houseNumber, this.floor, this.mezzanine = false, this.floorLabel, this.propertyId, this.propertyName, this.estateId, this.estateName, this.location, this.categoryName, this.usageClassName, this.tenure, this.beds, this.baths, this.ensuite, this.dsq = false, this.parking, this.squareFt, this.rent, this.occupied = false, this.lastOccupied, this.status = 0, this.createdOn, final  List<NamedRef> features = const <NamedRef>[], final  List<String> pending = const <String>[]}): _features = features,_pending = pending,super._();
  factory _HouseDetailModel.fromJson(Map<String, dynamic> json) => _$HouseDetailModelFromJson(json);

@override final  String id;
@override final  String houseCode;
@override final  String? houseNumber;
@override final  int? floor;
@override@JsonKey() final  bool mezzanine;
@override final  String? floorLabel;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? location;
@override final  String? categoryName;
@override final  String? usageClassName;
@override final  String? tenure;
@override final  int? beds;
@override final  int? baths;
@override final  int? ensuite;
@override@JsonKey() final  bool dsq;
@override final  int? parking;
@override final  double? squareFt;
@override final  double? rent;
@override@JsonKey() final  bool occupied;
/// The date it was last let, for a vacant unit. Null means never occupied, which is a
/// different fact from "vacant since" and reads differently.
@override final  String? lastOccupied;
@override@JsonKey() final  int status;
@override final  String? createdOn;
/// The unit's own features, not the property's. Arrives with the detail, so there is no
/// second request — the old `catalogue/features/{houseId}` call asked the feature catalogue
/// for a unit it knows nothing about.
 final  List<NamedRef> _features;
/// The unit's own features, not the property's. Arrives with the detail, so there is no
/// second request — the old `catalogue/features/{houseId}` call asked the feature catalogue
/// for a unit it knows nothing about.
@override@JsonKey() List<NamedRef> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

/// Sections whose data belongs to a module that does not exist yet. The server names them
/// rather than sending zeroes, because a zero in a money field reads as "nothing owed" when
/// the truth is "not yet computed".
 final  List<String> _pending;
/// Sections whose data belongs to a module that does not exist yet. The server names them
/// rather than sending zeroes, because a zero in a money field reads as "nothing owed" when
/// the truth is "not yet computed".
@override@JsonKey() List<String> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}


/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseDetailModelCopyWith<_HouseDetailModel> get copyWith => __$HouseDetailModelCopyWithImpl<_HouseDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.mezzanine, mezzanine) || other.mezzanine == mezzanine)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.beds, beds) || other.beds == beds)&&(identical(other.baths, baths) || other.baths == baths)&&(identical(other.ensuite, ensuite) || other.ensuite == ensuite)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._pending, _pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseCode,houseNumber,floor,mezzanine,floorLabel,propertyId,propertyName,estateId,estateName,location,categoryName,usageClassName,tenure,beds,baths,ensuite,dsq,parking,squareFt,rent,occupied,lastOccupied,status,createdOn,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_pending)]);

@override
String toString() {
  return 'HouseDetailModel(id: $id, houseCode: $houseCode, houseNumber: $houseNumber, floor: $floor, mezzanine: $mezzanine, floorLabel: $floorLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, location: $location, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, beds: $beds, baths: $baths, ensuite: $ensuite, dsq: $dsq, parking: $parking, squareFt: $squareFt, rent: $rent, occupied: $occupied, lastOccupied: $lastOccupied, status: $status, createdOn: $createdOn, features: $features, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$HouseDetailModelCopyWith<$Res> implements $HouseDetailModelCopyWith<$Res> {
  factory _$HouseDetailModelCopyWith(_HouseDetailModel value, $Res Function(_HouseDetailModel) _then) = __$HouseDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String houseCode, String? houseNumber, int? floor, bool mezzanine, String? floorLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? location, String? categoryName, String? usageClassName, String? tenure, int? beds, int? baths, int? ensuite, bool dsq, int? parking, double? squareFt, double? rent, bool occupied, String? lastOccupied, int status, String? createdOn, List<NamedRef> features, List<String> pending
});




}
/// @nodoc
class __$HouseDetailModelCopyWithImpl<$Res>
    implements _$HouseDetailModelCopyWith<$Res> {
  __$HouseDetailModelCopyWithImpl(this._self, this._then);

  final _HouseDetailModel _self;
  final $Res Function(_HouseDetailModel) _then;

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseCode = null,Object? houseNumber = freezed,Object? floor = freezed,Object? mezzanine = null,Object? floorLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? beds = freezed,Object? baths = freezed,Object? ensuite = freezed,Object? dsq = null,Object? parking = freezed,Object? squareFt = freezed,Object? rent = freezed,Object? occupied = null,Object? lastOccupied = freezed,Object? status = null,Object? createdOn = freezed,Object? features = null,Object? pending = null,}) {
  return _then(_HouseDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,mezzanine: null == mezzanine ? _self.mezzanine : mezzanine // ignore: cast_nullable_to_non_nullable
as bool,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
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
as bool,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
