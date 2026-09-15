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

 String? get id; String? get meterId; String? get meterNo;/// What is being metered — "Water", "Electricity".
 String? get chargeName;/// What a unit of it is called, for the figures below.
 String? get unitLabel;@JsonKey(fromJson: parseDouble) double get previousReading;@JsonKey(fromJson: parseDouble) double get currentReading;@JsonKey(fromJson: parseDouble) double get consumedUnits;/// Per unit, at the time this was read — not the meter's rate today.
@JsonKey(fromJson: parseDouble) double get rate;@JsonKey(fromJson: parseDouble) double get amount; String? get periodLabel; String? get readOn; String? get note;/// The invoice this reading was billed on, or null while it is still billable.
 String? get invoiceRrn; bool get billed;/// Whether a photograph of the dial was taken. See the note above.
 bool get hasPhoto;
/// Create a copy of MetreHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetreHistoryModelCopyWith<MetreHistoryModel> get copyWith => _$MetreHistoryModelCopyWithImpl<MetreHistoryModel>(this as MetreHistoryModel, _$identity);

  /// Serializes this MetreHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetreHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.meterNo, meterNo) || other.meterNo == meterNo)&&(identical(other.chargeName, chargeName) || other.chargeName == chargeName)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.readOn, readOn) || other.readOn == readOn)&&(identical(other.note, note) || other.note == note)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.billed, billed) || other.billed == billed)&&(identical(other.hasPhoto, hasPhoto) || other.hasPhoto == hasPhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,meterId,meterNo,chargeName,unitLabel,previousReading,currentReading,consumedUnits,rate,amount,periodLabel,readOn,note,invoiceRrn,billed,hasPhoto);

@override
String toString() {
  return 'MetreHistoryModel(id: $id, meterId: $meterId, meterNo: $meterNo, chargeName: $chargeName, unitLabel: $unitLabel, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, rate: $rate, amount: $amount, periodLabel: $periodLabel, readOn: $readOn, note: $note, invoiceRrn: $invoiceRrn, billed: $billed, hasPhoto: $hasPhoto)';
}


}

/// @nodoc
abstract mixin class $MetreHistoryModelCopyWith<$Res>  {
  factory $MetreHistoryModelCopyWith(MetreHistoryModel value, $Res Function(MetreHistoryModel) _then) = _$MetreHistoryModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? meterId, String? meterNo, String? chargeName, String? unitLabel,@JsonKey(fromJson: parseDouble) double previousReading,@JsonKey(fromJson: parseDouble) double currentReading,@JsonKey(fromJson: parseDouble) double consumedUnits,@JsonKey(fromJson: parseDouble) double rate,@JsonKey(fromJson: parseDouble) double amount, String? periodLabel, String? readOn, String? note, String? invoiceRrn, bool billed, bool hasPhoto
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? meterId = freezed,Object? meterNo = freezed,Object? chargeName = freezed,Object? unitLabel = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? rate = null,Object? amount = null,Object? periodLabel = freezed,Object? readOn = freezed,Object? note = freezed,Object? invoiceRrn = freezed,Object? billed = null,Object? hasPhoto = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,meterId: freezed == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as String?,meterNo: freezed == meterNo ? _self.meterNo : meterNo // ignore: cast_nullable_to_non_nullable
as String?,chargeName: freezed == chargeName ? _self.chargeName : chargeName // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,readOn: freezed == readOn ? _self.readOn : readOn // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,billed: null == billed ? _self.billed : billed // ignore: cast_nullable_to_non_nullable
as bool,hasPhoto: null == hasPhoto ? _self.hasPhoto : hasPhoto // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? meterId,  String? meterNo,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double rate, @JsonKey(fromJson: parseDouble)  double amount,  String? periodLabel,  String? readOn,  String? note,  String? invoiceRrn,  bool billed,  bool hasPhoto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
return $default(_that.id,_that.meterId,_that.meterNo,_that.chargeName,_that.unitLabel,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.rate,_that.amount,_that.periodLabel,_that.readOn,_that.note,_that.invoiceRrn,_that.billed,_that.hasPhoto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? meterId,  String? meterNo,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double rate, @JsonKey(fromJson: parseDouble)  double amount,  String? periodLabel,  String? readOn,  String? note,  String? invoiceRrn,  bool billed,  bool hasPhoto)  $default,) {final _that = this;
switch (_that) {
case _MetreHistoryModel():
return $default(_that.id,_that.meterId,_that.meterNo,_that.chargeName,_that.unitLabel,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.rate,_that.amount,_that.periodLabel,_that.readOn,_that.note,_that.invoiceRrn,_that.billed,_that.hasPhoto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? meterId,  String? meterNo,  String? chargeName,  String? unitLabel, @JsonKey(fromJson: parseDouble)  double previousReading, @JsonKey(fromJson: parseDouble)  double currentReading, @JsonKey(fromJson: parseDouble)  double consumedUnits, @JsonKey(fromJson: parseDouble)  double rate, @JsonKey(fromJson: parseDouble)  double amount,  String? periodLabel,  String? readOn,  String? note,  String? invoiceRrn,  bool billed,  bool hasPhoto)?  $default,) {final _that = this;
switch (_that) {
case _MetreHistoryModel() when $default != null:
return $default(_that.id,_that.meterId,_that.meterNo,_that.chargeName,_that.unitLabel,_that.previousReading,_that.currentReading,_that.consumedUnits,_that.rate,_that.amount,_that.periodLabel,_that.readOn,_that.note,_that.invoiceRrn,_that.billed,_that.hasPhoto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetreHistoryModel extends MetreHistoryModel {
  const _MetreHistoryModel({this.id, this.meterId, this.meterNo, this.chargeName, this.unitLabel, @JsonKey(fromJson: parseDouble) this.previousReading = 0, @JsonKey(fromJson: parseDouble) this.currentReading = 0, @JsonKey(fromJson: parseDouble) this.consumedUnits = 0, @JsonKey(fromJson: parseDouble) this.rate = 0, @JsonKey(fromJson: parseDouble) this.amount = 0, this.periodLabel, this.readOn, this.note, this.invoiceRrn, this.billed = false, this.hasPhoto = false}): super._();
  factory _MetreHistoryModel.fromJson(Map<String, dynamic> json) => _$MetreHistoryModelFromJson(json);

@override final  String? id;
@override final  String? meterId;
@override final  String? meterNo;
/// What is being metered — "Water", "Electricity".
@override final  String? chargeName;
/// What a unit of it is called, for the figures below.
@override final  String? unitLabel;
@override@JsonKey(fromJson: parseDouble) final  double previousReading;
@override@JsonKey(fromJson: parseDouble) final  double currentReading;
@override@JsonKey(fromJson: parseDouble) final  double consumedUnits;
/// Per unit, at the time this was read — not the meter's rate today.
@override@JsonKey(fromJson: parseDouble) final  double rate;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override final  String? periodLabel;
@override final  String? readOn;
@override final  String? note;
/// The invoice this reading was billed on, or null while it is still billable.
@override final  String? invoiceRrn;
@override@JsonKey() final  bool billed;
/// Whether a photograph of the dial was taken. See the note above.
@override@JsonKey() final  bool hasPhoto;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetreHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.meterNo, meterNo) || other.meterNo == meterNo)&&(identical(other.chargeName, chargeName) || other.chargeName == chargeName)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.consumedUnits, consumedUnits) || other.consumedUnits == consumedUnits)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.readOn, readOn) || other.readOn == readOn)&&(identical(other.note, note) || other.note == note)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.billed, billed) || other.billed == billed)&&(identical(other.hasPhoto, hasPhoto) || other.hasPhoto == hasPhoto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,meterId,meterNo,chargeName,unitLabel,previousReading,currentReading,consumedUnits,rate,amount,periodLabel,readOn,note,invoiceRrn,billed,hasPhoto);

@override
String toString() {
  return 'MetreHistoryModel(id: $id, meterId: $meterId, meterNo: $meterNo, chargeName: $chargeName, unitLabel: $unitLabel, previousReading: $previousReading, currentReading: $currentReading, consumedUnits: $consumedUnits, rate: $rate, amount: $amount, periodLabel: $periodLabel, readOn: $readOn, note: $note, invoiceRrn: $invoiceRrn, billed: $billed, hasPhoto: $hasPhoto)';
}


}

/// @nodoc
abstract mixin class _$MetreHistoryModelCopyWith<$Res> implements $MetreHistoryModelCopyWith<$Res> {
  factory _$MetreHistoryModelCopyWith(_MetreHistoryModel value, $Res Function(_MetreHistoryModel) _then) = __$MetreHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? meterId, String? meterNo, String? chargeName, String? unitLabel,@JsonKey(fromJson: parseDouble) double previousReading,@JsonKey(fromJson: parseDouble) double currentReading,@JsonKey(fromJson: parseDouble) double consumedUnits,@JsonKey(fromJson: parseDouble) double rate,@JsonKey(fromJson: parseDouble) double amount, String? periodLabel, String? readOn, String? note, String? invoiceRrn, bool billed, bool hasPhoto
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? meterId = freezed,Object? meterNo = freezed,Object? chargeName = freezed,Object? unitLabel = freezed,Object? previousReading = null,Object? currentReading = null,Object? consumedUnits = null,Object? rate = null,Object? amount = null,Object? periodLabel = freezed,Object? readOn = freezed,Object? note = freezed,Object? invoiceRrn = freezed,Object? billed = null,Object? hasPhoto = null,}) {
  return _then(_MetreHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,meterId: freezed == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as String?,meterNo: freezed == meterNo ? _self.meterNo : meterNo // ignore: cast_nullable_to_non_nullable
as String?,chargeName: freezed == chargeName ? _self.chargeName : chargeName // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double,consumedUnits: null == consumedUnits ? _self.consumedUnits : consumedUnits // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,readOn: freezed == readOn ? _self.readOn : readOn // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,billed: null == billed ? _self.billed : billed // ignore: cast_nullable_to_non_nullable
as bool,hasPhoto: null == hasPhoto ? _self.hasPhoto : hasPhoto // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
