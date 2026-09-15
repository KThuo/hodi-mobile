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

/// Hashed and salted per user. Opaque.
 String? get id; String? get meterNo; String? get utilityChargeId;/// What is being metered — "Water", "Electricity".
 String? get chargeName;/// What a unit of it is called — "m³", "kWh".
 String? get unitLabel;/// Today's rate per unit, for the next reading. See the note above.
@JsonKey(fromJson: parseDouble) double get rate; String? get houseId; String? get houseCode; String? get houseNumber;/// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
 String? get houseLabel; String? get propertyName; String? get estateName;@JsonKey(fromJson: parseDouble) double get currentReading;@JsonKey(fromJson: parseDouble) double get previousReading;@JsonKey(fromJson: parseDouble) double get consumedUnits;/// What the last reading was priced at, which is not always [rate].
@JsonKey(fromJson: parseDouble) double get lastRate;@JsonKey(fromJson: parseDouble) double get lastAmount;/// "September 2026" — the billing month the last reading belongs to.
 String? get lastReadPeriod; String? get lastReadOn;/// No reading yet for the current billing month.
///
/// Which is the same thing as "a reading may be taken now": the server refuses a second reading
/// in a period it has already been read for, so a screen that offered the button anyway would be
/// offering a rejection.
 bool get readingDue; int get status; String? get deactivationReason;
/// Create a copy of MetreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetreModelCopyWith<MetreModel> get copyWith => _$MetreModelCopyWithImpl<MetreModel>(this as MetreModel, _$identity);

  /// Serializes this MetreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.meterNo, meterNo) || other.meterNo == meterNo)&&(identical(other.utilityChargeId, utilityChargeId) || other.utilityChargeId == utilityChargeId)&&(identical(other.chargeName, chargeName) || other.chargeName == chargeName)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.lastRate, lastRate) || other.lastRate == lastRate)&&(identical(other.lastAmount, lastAmount) || other.lastAmount == lastAmount)&&(identical(other.lastReadPeriod, lastReadPeriod) || other.lastReadPeriod == lastReadPeriod)&&(identical(other.lastReadOn, lastReadOn) || other.lastReadOn == lastReadOn)&&(identical(other.readingDue, readingDue) || other.readingDue == readingDue)&&(identical(other.status, status) || other.status == status)&&(identical(other.deactivationReason, deactivationReason) || other.deactivationReason == deactivationReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,meterNo,utilityChargeId,chargeName,unitLabel,rate,houseId,houseCode,houseNumber,houseLabel,propertyName,estateName,currentReading,previousReading,consumedUnits,lastRate,lastAmount,lastReadPeriod,lastReadOn,readingDue,status,deactivationReason]);

@override
String toString() {
  return 'MetreModel(id: $id, meterNo: $meterNo, utilityChargeId: $utilityChargeId, chargeName: $chargeName, unitLabel: $unitLabel, rate: $rate, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, currentReading: $currentReading, previousReading: $previousReading, consumedUnits: $consumedUnits, lastRate: $lastRate, lastAmount: $lastAmount, lastReadPeriod: $lastReadPeriod, lastReadOn: $lastReadOn, readingDue: $readingDue, status: $status, deactivationReason: $deactivationReason)';
}


}

/// @nodoc
abstract mixin class $MetreModelCopyWith<$Res>  {
  factory $MetreModelCopyWith(MetreModel value, $Res Function(MetreModel) _then) = _$MetreModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? meterNo, String? utilityChargeId, String? chargeName, String? unitLabel,@JsonKey(fromJson: parseDouble) double rate, String? houseId, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double currentReading,@JsonKey(fromJson: parseDouble) double previousReading,@JsonKey(fromJson: parseDouble) double consumedUnits,@JsonKey(fromJson: parseDouble) double lastRate,@JsonKey(fromJson: parseDouble) double lastAmount, String? lastReadPeriod, String? lastReadOn, bool readingDue, int status, String? deactivationReason
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? meterNo = freezed,Object? utilityChargeId = freezed,Object? chargeName = freezed,Object? unitLabel = freezed,Object? rate = null,Object? houseId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? currentReading = null,Object? previousReading = null,Object? consumedUnits = null,Object? lastRate = null,Object? lastAmount = null,Object? lastReadPeriod = freezed,Object? lastReadOn = freezed,Object? readingDue = null,Object? status = null,Object? deactivationReason = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,meterNo: freezed == meterNo ? _self.meterNo : meterNo // ignore: cast_nullable_to_non_nullable
as String?,utilityChargeId: freezed == utilityChargeId ? _self.utilityChargeId : utilityChargeId // ignore: cast_nullable_to_non_nullable
as String?,chargeName: freezed == chargeName ? _self.chargeName : chargeName // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,lastRate: null == lastRate ? _self.lastRate : lastRate // ignore: cast_nullable_to_non_nullable
as double,lastAmount: null == lastAmount ? _self.lastAmount : lastAmount // ignore: cast_nullable_to_non_nullable
as double,lastReadPeriod: freezed == lastReadPeriod ? _self.lastReadPeriod : lastReadPeriod // ignore: cast_nullable_to_non_nullable
as String?,lastReadOn: freezed == lastReadOn ? _self.lastReadOn : lastReadOn // ignore: cast_nullable_to_non_nullable
as String?,readingDue: null == readingDue ? _self.readingDue : readingDue // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,deactivationReason: freezed == deactivationReason ? _self.deactivationReason : deactivationReason // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? meterNo,  String? utilityChargeId,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double rate,  String? houseId,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double lastRate, @JsonKey(fromJson: parseDouble)  double lastAmount,  String? lastReadPeriod,  String? lastReadOn,  bool readingDue,  int status,  String? deactivationReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
return $default(_that.id,_that.meterNo,_that.utilityChargeId,_that.chargeName,_that.unitLabel,_that.rate,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.currentReading,_that.previousReading,_that.consumedUnits,_that.lastRate,_that.lastAmount,_that.lastReadPeriod,_that.lastReadOn,_that.readingDue,_that.status,_that.deactivationReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? meterNo,  String? utilityChargeId,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double rate,  String? houseId,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double lastRate, @JsonKey(fromJson: parseDouble)  double lastAmount,  String? lastReadPeriod,  String? lastReadOn,  bool readingDue,  int status,  String? deactivationReason)  $default,) {final _that = this;
switch (_that) {
case _MetreModel():
return $default(_that.id,_that.meterNo,_that.utilityChargeId,_that.chargeName,_that.unitLabel,_that.rate,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.currentReading,_that.previousReading,_that.consumedUnits,_that.lastRate,_that.lastAmount,_that.lastReadPeriod,_that.lastReadOn,_that.readingDue,_that.status,_that.deactivationReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? meterNo,  String? utilityChargeId,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double rate,  String? houseId,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double lastRate, @JsonKey(fromJson: parseDouble)  double lastAmount,  String? lastReadPeriod,  String? lastReadOn,  bool readingDue,  int status,  String? deactivationReason)?  $default,) {final _that = this;
switch (_that) {
case _MetreModel() when $default != null:
return $default(_that.id,_that.meterNo,_that.utilityChargeId,_that.chargeName,_that.unitLabel,_that.rate,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.currentReading,_that.previousReading,_that.consumedUnits,_that.lastRate,_that.lastAmount,_that.lastReadPeriod,_that.lastReadOn,_that.readingDue,_that.status,_that.deactivationReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetreModel extends MetreModel {
  const _MetreModel({this.id, this.meterNo, this.utilityChargeId, this.chargeName, this.unitLabel, @JsonKey(fromJson: parseDouble) this.rate = 0, this.houseId, this.houseCode, this.houseNumber, this.houseLabel, this.propertyName, this.estateName, @JsonKey(fromJson: parseDouble) this.currentReading = 0, @JsonKey(fromJson: parseDouble) this.previousReading = 0, @JsonKey(fromJson: parseDouble) this.consumedUnits = 0, @JsonKey(fromJson: parseDouble) this.lastRate = 0, @JsonKey(fromJson: parseDouble) this.lastAmount = 0, this.lastReadPeriod, this.lastReadOn, this.readingDue = false, this.status = 1, this.deactivationReason}): super._();
  factory _MetreModel.fromJson(Map<String, dynamic> json) => _$MetreModelFromJson(json);

/// Hashed and salted per user. Opaque.
@override final  String? id;
@override final  String? meterNo;
@override final  String? utilityChargeId;
/// What is being metered — "Water", "Electricity".
@override final  String? chargeName;
/// What a unit of it is called — "m³", "kWh".
@override final  String? unitLabel;
/// Today's rate per unit, for the next reading. See the note above.
@override@JsonKey(fromJson: parseDouble) final  double rate;
@override final  String? houseId;
@override final  String? houseCode;
@override final  String? houseNumber;
/// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
@override final  String? houseLabel;
@override final  String? propertyName;
@override final  String? estateName;
@override@JsonKey(fromJson: parseDouble) final  double currentReading;
@override@JsonKey(fromJson: parseDouble) final  double previousReading;
@override@JsonKey(fromJson: parseDouble) final  double consumedUnits;
/// What the last reading was priced at, which is not always [rate].
@override@JsonKey(fromJson: parseDouble) final  double lastRate;
@override@JsonKey(fromJson: parseDouble) final  double lastAmount;
/// "September 2026" — the billing month the last reading belongs to.
@override final  String? lastReadPeriod;
@override final  String? lastReadOn;
/// No reading yet for the current billing month.
///
/// Which is the same thing as "a reading may be taken now": the server refuses a second reading
/// in a period it has already been read for, so a screen that offered the button anyway would be
/// offering a rejection.
@override@JsonKey() final  bool readingDue;
@override@JsonKey() final  int status;
@override final  String? deactivationReason;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.meterNo, meterNo) || other.meterNo == meterNo)&&(identical(other.utilityChargeId, utilityChargeId) || other.utilityChargeId == utilityChargeId)&&(identical(other.chargeName, chargeName) || other.chargeName == chargeName)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.lastRate, lastRate) || other.lastRate == lastRate)&&(identical(other.lastAmount, lastAmount) || other.lastAmount == lastAmount)&&(identical(other.lastReadPeriod, lastReadPeriod) || other.lastReadPeriod == lastReadPeriod)&&(identical(other.lastReadOn, lastReadOn) || other.lastReadOn == lastReadOn)&&(identical(other.readingDue, readingDue) || other.readingDue == readingDue)&&(identical(other.status, status) || other.status == status)&&(identical(other.deactivationReason, deactivationReason) || other.deactivationReason == deactivationReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,meterNo,utilityChargeId,chargeName,unitLabel,rate,houseId,houseCode,houseNumber,houseLabel,propertyName,estateName,currentReading,previousReading,consumedUnits,lastRate,lastAmount,lastReadPeriod,lastReadOn,readingDue,status,deactivationReason]);

@override
String toString() {
  return 'MetreModel(id: $id, meterNo: $meterNo, utilityChargeId: $utilityChargeId, chargeName: $chargeName, unitLabel: $unitLabel, rate: $rate, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, currentReading: $currentReading, previousReading: $previousReading, consumedUnits: $consumedUnits, lastRate: $lastRate, lastAmount: $lastAmount, lastReadPeriod: $lastReadPeriod, lastReadOn: $lastReadOn, readingDue: $readingDue, status: $status, deactivationReason: $deactivationReason)';
}


}

/// @nodoc
abstract mixin class _$MetreModelCopyWith<$Res> implements $MetreModelCopyWith<$Res> {
  factory _$MetreModelCopyWith(_MetreModel value, $Res Function(_MetreModel) _then) = __$MetreModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? meterNo, String? utilityChargeId, String? chargeName, String? unitLabel,@JsonKey(fromJson: parseDouble) double rate, String? houseId, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double currentReading,@JsonKey(fromJson: parseDouble) double previousReading,@JsonKey(fromJson: parseDouble) double consumedUnits,@JsonKey(fromJson: parseDouble) double lastRate,@JsonKey(fromJson: parseDouble) double lastAmount, String? lastReadPeriod, String? lastReadOn, bool readingDue, int status, String? deactivationReason
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? meterNo = freezed,Object? utilityChargeId = freezed,Object? chargeName = freezed,Object? unitLabel = freezed,Object? rate = null,Object? houseId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? currentReading = null,Object? previousReading = null,Object? consumedUnits = null,Object? lastRate = null,Object? lastAmount = null,Object? lastReadPeriod = freezed,Object? lastReadOn = freezed,Object? readingDue = null,Object? status = null,Object? deactivationReason = freezed,}) {
  return _then(_MetreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,meterNo: freezed == meterNo ? _self.meterNo : meterNo // ignore: cast_nullable_to_non_nullable
as String?,utilityChargeId: freezed == utilityChargeId ? _self.utilityChargeId : utilityChargeId // ignore: cast_nullable_to_non_nullable
as String?,chargeName: freezed == chargeName ? _self.chargeName : chargeName // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,lastRate: null == lastRate ? _self.lastRate : lastRate // ignore: cast_nullable_to_non_nullable
as double,lastAmount: null == lastAmount ? _self.lastAmount : lastAmount // ignore: cast_nullable_to_non_nullable
as double,lastReadPeriod: freezed == lastReadPeriod ? _self.lastReadPeriod : lastReadPeriod // ignore: cast_nullable_to_non_nullable
as String?,lastReadOn: freezed == lastReadOn ? _self.lastReadOn : lastReadOn // ignore: cast_nullable_to_non_nullable
as String?,readingDue: null == readingDue ? _self.readingDue : readingDue // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,deactivationReason: freezed == deactivationReason ? _self.deactivationReason : deactivationReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
