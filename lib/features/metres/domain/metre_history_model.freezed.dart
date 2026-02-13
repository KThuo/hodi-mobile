// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metre_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetreHistoryModel {

 String? get id; String? get rrn; String? get monthName; String? get property; String? get estate; double get previousReading; double get currentReading; double get consumedUnits; double get charge; double get amount; String? get updatedOn; int? get imageStatus;
/// Create a copy of MetreHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetreHistoryModelCopyWith<MetreHistoryModel> get copyWith => _$MetreHistoryModelCopyWithImpl<MetreHistoryModel>(this as MetreHistoryModel, _$identity);

  /// Serializes this MetreHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetreHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.charge, charge) || other.charge == charge)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.imageStatus, imageStatus) || other.imageStatus == imageStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rrn,monthName,property,estate,previousReading,currentReading,consumedUnits,charge,amount,updatedOn,imageStatus);

@override
String toString() {
  return 'MetreHistoryModel(id: $id, rrn: $rrn, monthName: $monthName, property: $property, estate: $estate, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, charge: $charge, amount: $amount, updatedOn: $updatedOn, imageStatus: $imageStatus)';
}


}

/// @nodoc
abstract mixin class $MetreHistoryModelCopyWith<$Res>  {
  factory $MetreHistoryModelCopyWith(MetreHistoryModel value, $Res Function(MetreHistoryModel) _then) = _$MetreHistoryModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rrn, String? monthName, String? property, String? estate, double previousReading, double currentReading, double consumedUnits, double charge, double amount, String? updatedOn, int? imageStatus
});




}
/// @nodoc
class _$MetreHistoryModelCopyWithImpl<$Res>
    implements $MetreHistoryModelCopyWith<$Res> {
  _$MetreHistoryModelCopyWithImpl(this._self, this._then);

  final MetreHistoryModel _self;
  final $Res Function(MetreHistoryModel) _then;

/// Create a copy of MetreHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rrn = freezed,Object? monthName = freezed,Object? property = freezed,Object? estate = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? charge = null,Object? amount = null,Object? updatedOn = freezed,Object? imageStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,charge: null == charge ? _self.charge : charge // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,imageStatus: freezed == imageStatus ? _self.imageStatus : imageStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetreHistoryModel].
extension MetreHistoryModelPatterns on MetreHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetreHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetreHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _MetreHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetreHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? monthName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  String? updatedOn,  int? imageStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
return $default(_that.id,_that.rrn,_that.monthName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.updatedOn,_that.imageStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? monthName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  String? updatedOn,  int? imageStatus)  $default,) {final _that = this;
switch (_that) {
case _MetreHistoryModel():
return $default(_that.id,_that.rrn,_that.monthName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.updatedOn,_that.imageStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? rrn,  String? monthName,  String? property,  String? estate,  double previousReading,  double currentReading,  double consumedUnits,  double charge,  double amount,  String? updatedOn,  int? imageStatus)?  $default,) {final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
return $default(_that.id,_that.rrn,_that.monthName,_that.property,_that.estate,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.charge,_that.amount,_that.updatedOn,_that.imageStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetreHistoryModel extends MetreHistoryModel {
  const _MetreHistoryModel({this.id, this.rrn, this.monthName, this.property, this.estate, this.previousReading = 0, this.currentReading = 0, this.consumedUnits = 0, this.charge = 0, this.amount = 0, this.updatedOn, this.imageStatus}): super._();
  factory _MetreHistoryModel.fromJson(Map<String, dynamic> json) => _$MetreHistoryModelFromJson(json);

@override final  String? id;
@override final  String? rrn;
@override final  String? monthName;
@override final  String? property;
@override final  String? estate;
@override@JsonKey() final  double previousReading;
@override@JsonKey() final  double currentReading;
@override@JsonKey() final  double consumedUnits;
@override@JsonKey() final  double charge;
@override@JsonKey() final  double amount;
@override final  String? updatedOn;
@override final  int? imageStatus;

/// Create a copy of MetreHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetreHistoryModelCopyWith<_MetreHistoryModel> get copyWith => __$MetreHistoryModelCopyWithImpl<_MetreHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetreHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetreHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.charge, charge) || other.charge == charge)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn)&&(identical(other.imageStatus, imageStatus) || other.imageStatus == imageStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rrn,monthName,property,estate,previousReading,currentReading,consumedUnits,charge,amount,updatedOn,imageStatus);

@override
String toString() {
  return 'MetreHistoryModel(id: $id, rrn: $rrn, monthName: $monthName, property: $property, estate: $estate, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, charge: $charge, amount: $amount, updatedOn: $updatedOn, imageStatus: $imageStatus)';
}


}

/// @nodoc
abstract mixin class _$MetreHistoryModelCopyWith<$Res> implements $MetreHistoryModelCopyWith<$Res> {
  factory _$MetreHistoryModelCopyWith(_MetreHistoryModel value, $Res Function(_MetreHistoryModel) _then) = __$MetreHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rrn, String? monthName, String? property, String? estate, double previousReading, double currentReading, double consumedUnits, double charge, double amount, String? updatedOn, int? imageStatus
});




}
/// @nodoc
class __$MetreHistoryModelCopyWithImpl<$Res>
    implements _$MetreHistoryModelCopyWith<$Res> {
  __$MetreHistoryModelCopyWithImpl(this._self, this._then);

  final _MetreHistoryModel _self;
  final $Res Function(_MetreHistoryModel) _then;

/// Create a copy of MetreHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rrn = freezed,Object? monthName = freezed,Object? property = freezed,Object? estate = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? charge = null,Object? amount = null,Object? updatedOn = freezed,Object? imageStatus = freezed,}) {
  return _then(_MetreHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,charge: null == charge ? _self.charge : charge // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,imageStatus: freezed == imageStatus ? _self.imageStatus : imageStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
