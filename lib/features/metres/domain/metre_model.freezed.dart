// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metre_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetreModel {

 String? get id; String? get metreNo; String? get billName; String? get houseName; String? get property; String? get estate; double get previousReading; double get currentReading; double get consumedUnits; double get charge; double get amount; int get status; String? get updatedOn; int? get imageStatus; bool get updatable; int? get month; int? get year; String? get monthName; String? get historyId;
/// Create a copy of MetreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetreModelCopyWith<MetreModel> get copyWith => _$MetreModelCopyWithImpl<MetreModel>(this as MetreModel, _$identity);

  /// Serializes this MetreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.metreNo, metreNo) || other.metreNo == metreNo)&&(identical(other.billName, billName) || other.billName == billName)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.charge, charge) || other.charge == charge)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.imageStatus, imageStatus) || other.imageStatus == imageStatus)&&(identical(other.updatable, updatable) || other.updatable == updatable)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.historyId, historyId) || other.historyId == historyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,metreNo,billName,houseName,property,estate,previousReading,currentReading,consumedUnits,charge,amount,status,updatedOn,imageStatus,updatable,month,year,monthName,historyId]);

@override
String toString() {
  return 'MetreModel(id: $id, metreNo: $metreNo, billName: $billName, houseName: $houseName, property: $property, estate: $estate, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, charge: $charge, amount: $amount, status: $status, updatedOn: $updatedOn, imageStatus: $imageStatus, updatable: $updatable, month: $month, year: $year, monthName: $monthName, historyId: $historyId)';
}


}

/// @nodoc
abstract mixin class $MetreModelCopyWith<$Res>  {
  factory $MetreModelCopyWith(MetreModel value, $Res Function(MetreModel) _then) = _$MetreModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? metreNo, String? billName, String? houseName, String? property, String? estate, double previousReading, double currentReading, double consumedUnits, double charge, double amount, int status, String? updatedOn, int? imageStatus, bool updatable, int? month, int? year, String? monthName, String? historyId
});




}
/// @nodoc
class _$MetreModelCopyWithImpl<$Res>
    implements $MetreModelCopyWith<$Res> {
  _$MetreModelCopyWithImpl(this._self, this._then);

  final MetreModel _self;
  final $Res Function(MetreModel) _then;

/// Create a copy of MetreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? metreNo = freezed,Object? billName = freezed,Object? houseName = freezed,Object? property = freezed,Object? estate = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? charge = null,Object? amount = null,Object? status = null,Object? updatedOn = freezed,Object? imageStatus = freezed,Object? updatable = null,Object? month = freezed,Object? year = freezed,Object? monthName = freezed,Object? historyId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,metreNo: freezed == metreNo ? _self.metreNo : metreNo // ignore: cast_nullable_to_non_nullable
as String?,billName: freezed == billName ? _self.billName : billName // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,charge: null == charge ? _self.charge : charge // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,imageStatus: freezed == imageStatus ? _self.imageStatus : imageStatus // ignore: cast_nullable_to_non_nullable
as int?,updatable: null == updatable ? _self.updatable : updatable // ignore: cast_nullable_to_non_nullable
as bool,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,historyId: freezed == historyId ? _self.historyId : historyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetreModel].
extension MetreModelPatterns on MetreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetreModel value)  $default,){
final _that = this;
switch (_that) {
case _MetreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetreModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? metreNo,  String? billName,  String? houseName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  int status,  String? updatedOn,  int? imageStatus,  bool updatable,  int? month,  int? year,  String? monthName,  String? historyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
return $default(_that.id,_that.metreNo,_that.billName,_that.houseName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.status,_that.updatedOn,_that.imageStatus,_that.updatable,_that.month,_that.year,_that.monthName,_that.historyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? metreNo,  String? billName,  String? houseName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  int status,  String? updatedOn,  int? imageStatus,  bool updatable,  int? month,  int? year,  String? monthName,  String? historyId)  $default,) {final _that = this;
switch (_that) {
case _MetreModel():
return $default(_that.id,_that.metreNo,_that.billName,_that.houseName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.status,_that.updatedOn,_that.imageStatus,_that.updatable,_that.month,_that.year,_that.monthName,_that.historyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? metreNo,  String? billName,  String? houseName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  int status,  String? updatedOn,  int? imageStatus,  bool updatable,  int? month,  int? year,  String? monthName,  String? historyId)?  $default,) {final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
return $default(_that.id,_that.metreNo,_that.billName,_that.houseName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.status,_that.updatedOn,_that.imageStatus,_that.updatable,_that.month,_that.year,_that.monthName,_that.historyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetreModel extends MetreModel {
  const _MetreModel({this.id, this.metreNo, this.billName, this.houseName, this.property, this.estate, this.previousReading = 0, this.currentReading = 0, this.consumedUnits = 0, this.charge = 0, this.amount = 0, this.status = 1, this.updatedOn, this.imageStatus, this.updatable = false, this.month, this.year, this.monthName, this.historyId}): super._();
  factory _MetreModel.fromJson(Map<String, dynamic> json) => _$MetreModelFromJson(json);

@override final  String? id;
@override final  String? metreNo;
@override final  String? billName;
@override final  String? houseName;
@override final  String? property;
@override final  String? estate;
@override@JsonKey() final  double previousReading;
@override@JsonKey() final  double currentReading;
@override@JsonKey() final  double consumedUnits;
@override@JsonKey() final  double charge;
@override@JsonKey() final  double amount;
@override@JsonKey() final  int status;
@override final  String? updatedOn;
@override final  int? imageStatus;
@override@JsonKey() final  bool updatable;
@override final  int? month;
@override final  int? year;
@override final  String? monthName;
@override final  String? historyId;

/// Create a copy of MetreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetreModelCopyWith<_MetreModel> get copyWith => __$MetreModelCopyWithImpl<_MetreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.metreNo, metreNo) || other.metreNo == metreNo)&&(identical(other.billName, billName) || other.billName == billName)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.charge, charge) || other.charge == charge)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.imageStatus, imageStatus) || other.imageStatus == imageStatus)&&(identical(other.updatable, updatable) || other.updatable == updatable)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.historyId, historyId) || other.historyId == historyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,metreNo,billName,houseName,property,estate,previousReading,currentReading,consumedUnits,charge,amount,status,updatedOn,imageStatus,updatable,month,year,monthName,historyId]);

@override
String toString() {
  return 'MetreModel(id: $id, metreNo: $metreNo, billName: $billName, houseName: $houseName, property: $property, estate: $estate, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, charge: $charge, amount: $amount, status: $status, updatedOn: $updatedOn, imageStatus: $imageStatus, updatable: $updatable, month: $month, year: $year, monthName: $monthName, historyId: $historyId)';
}


}

/// @nodoc
abstract mixin class _$MetreModelCopyWith<$Res> implements $MetreModelCopyWith<$Res> {
  factory _$MetreModelCopyWith(_MetreModel value, $Res Function(_MetreModel) _then) = __$MetreModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? metreNo, String? billName, String? houseName, String? property, String? estate, double previousReading, double currentReading, double consumedUnits, double charge, double amount, int status, String? updatedOn, int? imageStatus, bool updatable, int? month, int? year, String? monthName, String? historyId
});




}
/// @nodoc
class __$MetreModelCopyWithImpl<$Res>
    implements _$MetreModelCopyWith<$Res> {
  __$MetreModelCopyWithImpl(this._self, this._then);

  final _MetreModel _self;
  final $Res Function(_MetreModel) _then;

/// Create a copy of MetreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? metreNo = freezed,Object? billName = freezed,Object? houseName = freezed,Object? property = freezed,Object? estate = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? charge = null,Object? amount = null,Object? status = null,Object? updatedOn = freezed,Object? imageStatus = freezed,Object? updatable = null,Object? month = freezed,Object? year = freezed,Object? monthName = freezed,Object? historyId = freezed,}) {
  return _then(_MetreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,metreNo: freezed == metreNo ? _self.metreNo : metreNo // ignore: cast_nullable_to_non_nullable
as String?,billName: freezed == billName ? _self.billName : billName // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,charge: null == charge ? _self.charge : charge // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,imageStatus: freezed == imageStatus ? _self.imageStatus : imageStatus // ignore: cast_nullable_to_non_nullable
as int?,updatable: null == updatable ? _self.updatable : updatable // ignore: cast_nullable_to_non_nullable
as bool,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,historyId: freezed == historyId ? _self.historyId : historyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
