// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarData {

 double get jan; double get feb; double get mar; double get apr; double get may; double get jun; double get jul; double get aug; double get sep; double get oct; double get nov; double get dec;
/// Create a copy of CalendarData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarDataCopyWith<CalendarData> get copyWith => _$CalendarDataCopyWithImpl<CalendarData>(this as CalendarData, _$identity);

  /// Serializes this CalendarData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarData&&(identical(other.jan, jan) || other.jan == jan)&&(identical(other.feb, feb) || other.feb == feb)&&(identical(other.mar, mar) || other.mar == mar)&&(identical(other.apr, apr) || other.apr == apr)&&(identical(other.may, may) || other.may == may)&&(identical(other.jun, jun) || other.jun == jun)&&(identical(other.jul, jul) || other.jul == jul)&&(identical(other.aug, aug) || other.aug == aug)&&(identical(other.sep, sep) || other.sep == sep)&&(identical(other.oct, oct) || other.oct == oct)&&(identical(other.nov, nov) || other.nov == nov)&&(identical(other.dec, dec) || other.dec == dec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);

@override
String toString() {
  return 'CalendarData(jan: $jan, feb: $feb, mar: $mar, apr: $apr, may: $may, jun: $jun, jul: $jul, aug: $aug, sep: $sep, oct: $oct, nov: $nov, dec: $dec)';
}


}

/// @nodoc
abstract mixin class $CalendarDataCopyWith<$Res>  {
  factory $CalendarDataCopyWith(CalendarData value, $Res Function(CalendarData) _then) = _$CalendarDataCopyWithImpl;
@useResult
$Res call({
 double jan, double feb, double mar, double apr, double may, double jun, double jul, double aug, double sep, double oct, double nov, double dec
});




}
/// @nodoc
class _$CalendarDataCopyWithImpl<$Res>
    implements $CalendarDataCopyWith<$Res> {
  _$CalendarDataCopyWithImpl(this._self, this._then);

  final CalendarData _self;
  final $Res Function(CalendarData) _then;

/// Create a copy of CalendarData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jan = null,Object? feb = null,Object? mar = null,Object? apr = null,Object? may = null,Object? jun = null,Object? jul = null,Object? aug = null,Object? sep = null,Object? oct = null,Object? nov = null,Object? dec = null,}) {
  return _then(_self.copyWith(
jan: null == jan ? _self.jan : jan // ignore: cast_nullable_to_non_nullable
as double,feb: null == feb ? _self.feb : feb // ignore: cast_nullable_to_non_nullable
as double,mar: null == mar ? _self.mar : mar // ignore: cast_nullable_to_non_nullable
as double,apr: null == apr ? _self.apr : apr // ignore: cast_nullable_to_non_nullable
as double,may: null == may ? _self.may : may // ignore: cast_nullable_to_non_nullable
as double,jun: null == jun ? _self.jun : jun // ignore: cast_nullable_to_non_nullable
as double,jul: null == jul ? _self.jul : jul // ignore: cast_nullable_to_non_nullable
as double,aug: null == aug ? _self.aug : aug // ignore: cast_nullable_to_non_nullable
as double,sep: null == sep ? _self.sep : sep // ignore: cast_nullable_to_non_nullable
as double,oct: null == oct ? _self.oct : oct // ignore: cast_nullable_to_non_nullable
as double,nov: null == nov ? _self.nov : nov // ignore: cast_nullable_to_non_nullable
as double,dec: null == dec ? _self.dec : dec // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarData].
extension CalendarDataPatterns on CalendarData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarData value)  $default,){
final _that = this;
switch (_that) {
case _CalendarData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarData value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double jan,  double feb,  double mar,  double apr,  double may,  double jun,  double jul,  double aug,  double sep,  double oct,  double nov,  double dec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarData() when $default != null:
return $default(_that.jan,_that.feb,_that.mar,_that.apr,_that.may,_that.jun,_that.jul,_that.aug,_that.sep,_that.oct,_that.nov,_that.dec);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double jan,  double feb,  double mar,  double apr,  double may,  double jun,  double jul,  double aug,  double sep,  double oct,  double nov,  double dec)  $default,) {final _that = this;
switch (_that) {
case _CalendarData():
return $default(_that.jan,_that.feb,_that.mar,_that.apr,_that.may,_that.jun,_that.jul,_that.aug,_that.sep,_that.oct,_that.nov,_that.dec);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double jan,  double feb,  double mar,  double apr,  double may,  double jun,  double jul,  double aug,  double sep,  double oct,  double nov,  double dec)?  $default,) {final _that = this;
switch (_that) {
case _CalendarData() when $default != null:
return $default(_that.jan,_that.feb,_that.mar,_that.apr,_that.may,_that.jun,_that.jul,_that.aug,_that.sep,_that.oct,_that.nov,_that.dec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarData extends CalendarData {
  const _CalendarData({this.jan = 0, this.feb = 0, this.mar = 0, this.apr = 0, this.may = 0, this.jun = 0, this.jul = 0, this.aug = 0, this.sep = 0, this.oct = 0, this.nov = 0, this.dec = 0}): super._();
  factory _CalendarData.fromJson(Map<String, dynamic> json) => _$CalendarDataFromJson(json);

@override@JsonKey() final  double jan;
@override@JsonKey() final  double feb;
@override@JsonKey() final  double mar;
@override@JsonKey() final  double apr;
@override@JsonKey() final  double may;
@override@JsonKey() final  double jun;
@override@JsonKey() final  double jul;
@override@JsonKey() final  double aug;
@override@JsonKey() final  double sep;
@override@JsonKey() final  double oct;
@override@JsonKey() final  double nov;
@override@JsonKey() final  double dec;

/// Create a copy of CalendarData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarDataCopyWith<_CalendarData> get copyWith => __$CalendarDataCopyWithImpl<_CalendarData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarData&&(identical(other.jan, jan) || other.jan == jan)&&(identical(other.feb, feb) || other.feb == feb)&&(identical(other.mar, mar) || other.mar == mar)&&(identical(other.apr, apr) || other.apr == apr)&&(identical(other.may, may) || other.may == may)&&(identical(other.jun, jun) || other.jun == jun)&&(identical(other.jul, jul) || other.jul == jul)&&(identical(other.aug, aug) || other.aug == aug)&&(identical(other.sep, sep) || other.sep == sep)&&(identical(other.oct, oct) || other.oct == oct)&&(identical(other.nov, nov) || other.nov == nov)&&(identical(other.dec, dec) || other.dec == dec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);

@override
String toString() {
  return 'CalendarData(jan: $jan, feb: $feb, mar: $mar, apr: $apr, may: $may, jun: $jun, jul: $jul, aug: $aug, sep: $sep, oct: $oct, nov: $nov, dec: $dec)';
}


}

/// @nodoc
abstract mixin class _$CalendarDataCopyWith<$Res> implements $CalendarDataCopyWith<$Res> {
  factory _$CalendarDataCopyWith(_CalendarData value, $Res Function(_CalendarData) _then) = __$CalendarDataCopyWithImpl;
@override @useResult
$Res call({
 double jan, double feb, double mar, double apr, double may, double jun, double jul, double aug, double sep, double oct, double nov, double dec
});




}
/// @nodoc
class __$CalendarDataCopyWithImpl<$Res>
    implements _$CalendarDataCopyWith<$Res> {
  __$CalendarDataCopyWithImpl(this._self, this._then);

  final _CalendarData _self;
  final $Res Function(_CalendarData) _then;

/// Create a copy of CalendarData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jan = null,Object? feb = null,Object? mar = null,Object? apr = null,Object? may = null,Object? jun = null,Object? jul = null,Object? aug = null,Object? sep = null,Object? oct = null,Object? nov = null,Object? dec = null,}) {
  return _then(_CalendarData(
jan: null == jan ? _self.jan : jan // ignore: cast_nullable_to_non_nullable
as double,feb: null == feb ? _self.feb : feb // ignore: cast_nullable_to_non_nullable
as double,mar: null == mar ? _self.mar : mar // ignore: cast_nullable_to_non_nullable
as double,apr: null == apr ? _self.apr : apr // ignore: cast_nullable_to_non_nullable
as double,may: null == may ? _self.may : may // ignore: cast_nullable_to_non_nullable
as double,jun: null == jun ? _self.jun : jun // ignore: cast_nullable_to_non_nullable
as double,jul: null == jul ? _self.jul : jul // ignore: cast_nullable_to_non_nullable
as double,aug: null == aug ? _self.aug : aug // ignore: cast_nullable_to_non_nullable
as double,sep: null == sep ? _self.sep : sep // ignore: cast_nullable_to_non_nullable
as double,oct: null == oct ? _self.oct : oct // ignore: cast_nullable_to_non_nullable
as double,nov: null == nov ? _self.nov : nov // ignore: cast_nullable_to_non_nullable
as double,dec: null == dec ? _self.dec : dec // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
