// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummary {

 double get totalInvoice; double get totalRent; double get totalPayment; double get totalExpense; double get totalArrears; double get totalOverpayments; double get totalTopups; double get totalClearedAmount;/// Unallocated money standing across live payments **today** — a balance, not something that
/// arose in the period. The backend's own note warns these two are not interchangeable, and
/// that showing the difference between them once made the dashboard read 782,700 where the
/// portal read 4,700.
 double get totalCredit; double get totalForfeited;/// How many properties the figures above cover. Distinct, not rows.
 int? get properties; int? get totalUnits; int? get occupiedUnits;/// The period these figures are for, in the server's words — "September 2026", "All time".
 String? get label;
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryCopyWith<DashboardSummary> get copyWith => _$DashboardSummaryCopyWithImpl<DashboardSummary>(this as DashboardSummary, _$identity);

  /// Serializes this DashboardSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummary&&(identical(other.totalInvoice, totalInvoice) || other.totalInvoice == totalInvoice)&&(identical(other.totalRent, totalRent) || other.totalRent == totalRent)&&(identical(other.totalPayment, totalPayment) || other.totalPayment == totalPayment)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.totalArrears, totalArrears) || other.totalArrears == totalArrears)&&(identical(other.totalOverpayments, totalOverpayments) || other.totalOverpayments == totalOverpayments)&&(identical(other.totalTopups, totalTopups) || other.totalTopups == totalTopups)&&(identical(other.totalClearedAmount, totalClearedAmount) || other.totalClearedAmount == totalClearedAmount)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.totalForfeited, totalForfeited) || other.totalForfeited == totalForfeited)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalInvoice,totalRent,totalPayment,totalExpense,totalArrears,totalOverpayments,totalTopups,totalClearedAmount,totalCredit,totalForfeited,properties,totalUnits,occupiedUnits,label);

@override
String toString() {
  return 'DashboardSummary(totalInvoice: $totalInvoice, totalRent: $totalRent, totalPayment: $totalPayment, totalExpense: $totalExpense, totalArrears: $totalArrears, totalOverpayments: $totalOverpayments, totalTopups: $totalTopups, totalClearedAmount: $totalClearedAmount, totalCredit: $totalCredit, totalForfeited: $totalForfeited, properties: $properties, totalUnits: $totalUnits, occupiedUnits: $occupiedUnits, label: $label)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res>  {
  factory $DashboardSummaryCopyWith(DashboardSummary value, $Res Function(DashboardSummary) _then) = _$DashboardSummaryCopyWithImpl;
@useResult
$Res call({
 double totalInvoice, double totalRent, double totalPayment, double totalExpense, double totalArrears, double totalOverpayments, double totalTopups, double totalClearedAmount, double totalCredit, double totalForfeited, int? properties, int? totalUnits, int? occupiedUnits, String? label
});




}
/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalInvoice = null,Object? totalRent = null,Object? totalPayment = null,Object? totalExpense = null,Object? totalArrears = null,Object? totalOverpayments = null,Object? totalTopups = null,Object? totalClearedAmount = null,Object? totalCredit = null,Object? totalForfeited = null,Object? properties = freezed,Object? totalUnits = freezed,Object? occupiedUnits = freezed,Object? label = freezed,}) {
  return _then(_self.copyWith(
totalInvoice: null == totalInvoice ? _self.totalInvoice : totalInvoice // ignore: cast_nullable_to_non_nullable
as double,totalRent: null == totalRent ? _self.totalRent : totalRent // ignore: cast_nullable_to_non_nullable
as double,totalPayment: null == totalPayment ? _self.totalPayment : totalPayment // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,totalArrears: null == totalArrears ? _self.totalArrears : totalArrears // ignore: cast_nullable_to_non_nullable
as double,totalOverpayments: null == totalOverpayments ? _self.totalOverpayments : totalOverpayments // ignore: cast_nullable_to_non_nullable
as double,totalTopups: null == totalTopups ? _self.totalTopups : totalTopups // ignore: cast_nullable_to_non_nullable
as double,totalClearedAmount: null == totalClearedAmount ? _self.totalClearedAmount : totalClearedAmount // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,totalForfeited: null == totalForfeited ? _self.totalForfeited : totalForfeited // ignore: cast_nullable_to_non_nullable
as double,properties: freezed == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as int?,totalUnits: freezed == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int?,occupiedUnits: freezed == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummary value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalInvoice,  double totalRent,  double totalPayment,  double totalExpense,  double totalArrears,  double totalOverpayments,  double totalTopups,  double totalClearedAmount,  double totalCredit,  double totalForfeited,  int? properties,  int? totalUnits,  int? occupiedUnits,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.totalInvoice,_that.totalRent,_that.totalPayment,_that.totalExpense,_that.totalArrears,_that.totalOverpayments,_that.totalTopups,_that.totalClearedAmount,_that.totalCredit,_that.totalForfeited,_that.properties,_that.totalUnits,_that.occupiedUnits,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalInvoice,  double totalRent,  double totalPayment,  double totalExpense,  double totalArrears,  double totalOverpayments,  double totalTopups,  double totalClearedAmount,  double totalCredit,  double totalForfeited,  int? properties,  int? totalUnits,  int? occupiedUnits,  String? label)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary():
return $default(_that.totalInvoice,_that.totalRent,_that.totalPayment,_that.totalExpense,_that.totalArrears,_that.totalOverpayments,_that.totalTopups,_that.totalClearedAmount,_that.totalCredit,_that.totalForfeited,_that.properties,_that.totalUnits,_that.occupiedUnits,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalInvoice,  double totalRent,  double totalPayment,  double totalExpense,  double totalArrears,  double totalOverpayments,  double totalTopups,  double totalClearedAmount,  double totalCredit,  double totalForfeited,  int? properties,  int? totalUnits,  int? occupiedUnits,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.totalInvoice,_that.totalRent,_that.totalPayment,_that.totalExpense,_that.totalArrears,_that.totalOverpayments,_that.totalTopups,_that.totalClearedAmount,_that.totalCredit,_that.totalForfeited,_that.properties,_that.totalUnits,_that.occupiedUnits,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummary extends DashboardSummary {
  const _DashboardSummary({this.totalInvoice = 0, this.totalRent = 0, this.totalPayment = 0, this.totalExpense = 0, this.totalArrears = 0, this.totalOverpayments = 0, this.totalTopups = 0, this.totalClearedAmount = 0, this.totalCredit = 0, this.totalForfeited = 0, this.properties, this.totalUnits, this.occupiedUnits, this.label}): super._();
  factory _DashboardSummary.fromJson(Map<String, dynamic> json) => _$DashboardSummaryFromJson(json);

@override@JsonKey() final  double totalInvoice;
@override@JsonKey() final  double totalRent;
@override@JsonKey() final  double totalPayment;
@override@JsonKey() final  double totalExpense;
@override@JsonKey() final  double totalArrears;
@override@JsonKey() final  double totalOverpayments;
@override@JsonKey() final  double totalTopups;
@override@JsonKey() final  double totalClearedAmount;
/// Unallocated money standing across live payments **today** — a balance, not something that
/// arose in the period. The backend's own note warns these two are not interchangeable, and
/// that showing the difference between them once made the dashboard read 782,700 where the
/// portal read 4,700.
@override@JsonKey() final  double totalCredit;
@override@JsonKey() final  double totalForfeited;
/// How many properties the figures above cover. Distinct, not rows.
@override final  int? properties;
@override final  int? totalUnits;
@override final  int? occupiedUnits;
/// The period these figures are for, in the server's words — "September 2026", "All time".
@override final  String? label;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryCopyWith<_DashboardSummary> get copyWith => __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummary&&(identical(other.totalInvoice, totalInvoice) || other.totalInvoice == totalInvoice)&&(identical(other.totalRent, totalRent) || other.totalRent == totalRent)&&(identical(other.totalPayment, totalPayment) || other.totalPayment == totalPayment)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.totalArrears, totalArrears) || other.totalArrears == totalArrears)&&(identical(other.totalOverpayments, totalOverpayments) || other.totalOverpayments == totalOverpayments)&&(identical(other.totalTopups, totalTopups) || other.totalTopups == totalTopups)&&(identical(other.totalClearedAmount, totalClearedAmount) || other.totalClearedAmount == totalClearedAmount)&&(identical(other.totalCredit, totalCredit) || other.totalCredit == totalCredit)&&(identical(other.totalForfeited, totalForfeited) || other.totalForfeited == totalForfeited)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalInvoice,totalRent,totalPayment,totalExpense,totalArrears,totalOverpayments,totalTopups,totalClearedAmount,totalCredit,totalForfeited,properties,totalUnits,occupiedUnits,label);

@override
String toString() {
  return 'DashboardSummary(totalInvoice: $totalInvoice, totalRent: $totalRent, totalPayment: $totalPayment, totalExpense: $totalExpense, totalArrears: $totalArrears, totalOverpayments: $totalOverpayments, totalTopups: $totalTopups, totalClearedAmount: $totalClearedAmount, totalCredit: $totalCredit, totalForfeited: $totalForfeited, properties: $properties, totalUnits: $totalUnits, occupiedUnits: $occupiedUnits, label: $label)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res> implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(_DashboardSummary value, $Res Function(_DashboardSummary) _then) = __$DashboardSummaryCopyWithImpl;
@override @useResult
$Res call({
 double totalInvoice, double totalRent, double totalPayment, double totalExpense, double totalArrears, double totalOverpayments, double totalTopups, double totalClearedAmount, double totalCredit, double totalForfeited, int? properties, int? totalUnits, int? occupiedUnits, String? label
});




}
/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalInvoice = null,Object? totalRent = null,Object? totalPayment = null,Object? totalExpense = null,Object? totalArrears = null,Object? totalOverpayments = null,Object? totalTopups = null,Object? totalClearedAmount = null,Object? totalCredit = null,Object? totalForfeited = null,Object? properties = freezed,Object? totalUnits = freezed,Object? occupiedUnits = freezed,Object? label = freezed,}) {
  return _then(_DashboardSummary(
totalInvoice: null == totalInvoice ? _self.totalInvoice : totalInvoice // ignore: cast_nullable_to_non_nullable
as double,totalRent: null == totalRent ? _self.totalRent : totalRent // ignore: cast_nullable_to_non_nullable
as double,totalPayment: null == totalPayment ? _self.totalPayment : totalPayment // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,totalArrears: null == totalArrears ? _self.totalArrears : totalArrears // ignore: cast_nullable_to_non_nullable
as double,totalOverpayments: null == totalOverpayments ? _self.totalOverpayments : totalOverpayments // ignore: cast_nullable_to_non_nullable
as double,totalTopups: null == totalTopups ? _self.totalTopups : totalTopups // ignore: cast_nullable_to_non_nullable
as double,totalClearedAmount: null == totalClearedAmount ? _self.totalClearedAmount : totalClearedAmount // ignore: cast_nullable_to_non_nullable
as double,totalCredit: null == totalCredit ? _self.totalCredit : totalCredit // ignore: cast_nullable_to_non_nullable
as double,totalForfeited: null == totalForfeited ? _self.totalForfeited : totalForfeited // ignore: cast_nullable_to_non_nullable
as double,properties: freezed == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as int?,totalUnits: freezed == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int?,occupiedUnits: freezed == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
