// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenancy_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenancyBalanceModel {

 String? get occupationId; String? get houseCode; String? get houseNumber; String? get tenantName;@JsonKey(fromJson: parseDouble) double get outstanding;/// Credit already received and not yet applied. Held separately from [outstanding] rather
/// than netted off, because "you owe 4,000 and we are holding 1,000" is two facts and
/// showing only the difference loses one of them.
@JsonKey(fromJson: parseDouble) double get creditInHand; List<OutstandingInvoice> get invoices;
/// Create a copy of TenancyBalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenancyBalanceModelCopyWith<TenancyBalanceModel> get copyWith => _$TenancyBalanceModelCopyWithImpl<TenancyBalanceModel>(this as TenancyBalanceModel, _$identity);

  /// Serializes this TenancyBalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenancyBalanceModel&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.creditInHand, creditInHand) || other.creditInHand == creditInHand)&&const DeepCollectionEquality().equals(other.invoices, invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occupationId,houseCode,houseNumber,tenantName,outstanding,creditInHand,const DeepCollectionEquality().hash(invoices));

@override
String toString() {
  return 'TenancyBalanceModel(occupationId: $occupationId, houseCode: $houseCode, houseNumber: $houseNumber, tenantName: $tenantName, outstanding: $outstanding, creditInHand: $creditInHand, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class $TenancyBalanceModelCopyWith<$Res>  {
  factory $TenancyBalanceModelCopyWith(TenancyBalanceModel value, $Res Function(TenancyBalanceModel) _then) = _$TenancyBalanceModelCopyWithImpl;
@useResult
$Res call({
 String? occupationId, String? houseCode, String? houseNumber, String? tenantName,@JsonKey(fromJson: parseDouble) double outstanding,@JsonKey(fromJson: parseDouble) double creditInHand, List<OutstandingInvoice> invoices
});




}
/// @nodoc
class _$TenancyBalanceModelCopyWithImpl<$Res>
    implements $TenancyBalanceModelCopyWith<$Res> {
  _$TenancyBalanceModelCopyWithImpl(this._self, this._then);

  final TenancyBalanceModel _self;
  final $Res Function(TenancyBalanceModel) _then;

/// Create a copy of TenancyBalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? occupationId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? tenantName = freezed,Object? outstanding = null,Object? creditInHand = null,Object? invoices = null,}) {
  return _then(_self.copyWith(
occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,creditInHand: null == creditInHand ? _self.creditInHand : creditInHand // ignore: cast_nullable_to_non_nullable
as double,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<OutstandingInvoice>,
  ));
}

}


/// Adds pattern-matching-related methods to [TenancyBalanceModel].
extension TenancyBalanceModelPatterns on TenancyBalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenancyBalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenancyBalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenancyBalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _TenancyBalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenancyBalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenancyBalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? occupationId,  String? houseCode,  String? houseNumber,  String? tenantName, @JsonKey(fromJson: parseDouble)  double outstanding, @JsonKey(fromJson: parseDouble)  double creditInHand,  List<OutstandingInvoice> invoices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenancyBalanceModel() when $default != null:
return $default(_that.occupationId,_that.houseCode,_that.houseNumber,_that.tenantName,_that.outstanding,_that.creditInHand,_that.invoices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? occupationId,  String? houseCode,  String? houseNumber,  String? tenantName, @JsonKey(fromJson: parseDouble)  double outstanding, @JsonKey(fromJson: parseDouble)  double creditInHand,  List<OutstandingInvoice> invoices)  $default,) {final _that = this;
switch (_that) {
case _TenancyBalanceModel():
return $default(_that.occupationId,_that.houseCode,_that.houseNumber,_that.tenantName,_that.outstanding,_that.creditInHand,_that.invoices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? occupationId,  String? houseCode,  String? houseNumber,  String? tenantName, @JsonKey(fromJson: parseDouble)  double outstanding, @JsonKey(fromJson: parseDouble)  double creditInHand,  List<OutstandingInvoice> invoices)?  $default,) {final _that = this;
switch (_that) {
case _TenancyBalanceModel() when $default != null:
return $default(_that.occupationId,_that.houseCode,_that.houseNumber,_that.tenantName,_that.outstanding,_that.creditInHand,_that.invoices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenancyBalanceModel extends TenancyBalanceModel {
  const _TenancyBalanceModel({this.occupationId, this.houseCode, this.houseNumber, this.tenantName, @JsonKey(fromJson: parseDouble) this.outstanding = 0, @JsonKey(fromJson: parseDouble) this.creditInHand = 0, final  List<OutstandingInvoice> invoices = const <OutstandingInvoice>[]}): _invoices = invoices,super._();
  factory _TenancyBalanceModel.fromJson(Map<String, dynamic> json) => _$TenancyBalanceModelFromJson(json);

@override final  String? occupationId;
@override final  String? houseCode;
@override final  String? houseNumber;
@override final  String? tenantName;
@override@JsonKey(fromJson: parseDouble) final  double outstanding;
/// Credit already received and not yet applied. Held separately from [outstanding] rather
/// than netted off, because "you owe 4,000 and we are holding 1,000" is two facts and
/// showing only the difference loses one of them.
@override@JsonKey(fromJson: parseDouble) final  double creditInHand;
 final  List<OutstandingInvoice> _invoices;
@override@JsonKey() List<OutstandingInvoice> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}


/// Create a copy of TenancyBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenancyBalanceModelCopyWith<_TenancyBalanceModel> get copyWith => __$TenancyBalanceModelCopyWithImpl<_TenancyBalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenancyBalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenancyBalanceModel&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.creditInHand, creditInHand) || other.creditInHand == creditInHand)&&const DeepCollectionEquality().equals(other._invoices, _invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occupationId,houseCode,houseNumber,tenantName,outstanding,creditInHand,const DeepCollectionEquality().hash(_invoices));

@override
String toString() {
  return 'TenancyBalanceModel(occupationId: $occupationId, houseCode: $houseCode, houseNumber: $houseNumber, tenantName: $tenantName, outstanding: $outstanding, creditInHand: $creditInHand, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class _$TenancyBalanceModelCopyWith<$Res> implements $TenancyBalanceModelCopyWith<$Res> {
  factory _$TenancyBalanceModelCopyWith(_TenancyBalanceModel value, $Res Function(_TenancyBalanceModel) _then) = __$TenancyBalanceModelCopyWithImpl;
@override @useResult
$Res call({
 String? occupationId, String? houseCode, String? houseNumber, String? tenantName,@JsonKey(fromJson: parseDouble) double outstanding,@JsonKey(fromJson: parseDouble) double creditInHand, List<OutstandingInvoice> invoices
});




}
/// @nodoc
class __$TenancyBalanceModelCopyWithImpl<$Res>
    implements _$TenancyBalanceModelCopyWith<$Res> {
  __$TenancyBalanceModelCopyWithImpl(this._self, this._then);

  final _TenancyBalanceModel _self;
  final $Res Function(_TenancyBalanceModel) _then;

/// Create a copy of TenancyBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? occupationId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? tenantName = freezed,Object? outstanding = null,Object? creditInHand = null,Object? invoices = null,}) {
  return _then(_TenancyBalanceModel(
occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,creditInHand: null == creditInHand ? _self.creditInHand : creditInHand // ignore: cast_nullable_to_non_nullable
as double,invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<OutstandingInvoice>,
  ));
}


}


/// @nodoc
mixin _$OutstandingInvoice {

 String get id; String get rrn; String? get periodLabel;@JsonKey(fromJson: parseDouble) double get amount;@JsonKey(fromJson: parseDouble) double get outstanding; String? get dueDate; bool get overdue;
/// Create a copy of OutstandingInvoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutstandingInvoiceCopyWith<OutstandingInvoice> get copyWith => _$OutstandingInvoiceCopyWithImpl<OutstandingInvoice>(this as OutstandingInvoice, _$identity);

  /// Serializes this OutstandingInvoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutstandingInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rrn,periodLabel,amount,outstanding,dueDate,overdue);

@override
String toString() {
  return 'OutstandingInvoice(id: $id, rrn: $rrn, periodLabel: $periodLabel, amount: $amount, outstanding: $outstanding, dueDate: $dueDate, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class $OutstandingInvoiceCopyWith<$Res>  {
  factory $OutstandingInvoiceCopyWith(OutstandingInvoice value, $Res Function(OutstandingInvoice) _then) = _$OutstandingInvoiceCopyWithImpl;
@useResult
$Res call({
 String id, String rrn, String? periodLabel,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double outstanding, String? dueDate, bool overdue
});




}
/// @nodoc
class _$OutstandingInvoiceCopyWithImpl<$Res>
    implements $OutstandingInvoiceCopyWith<$Res> {
  _$OutstandingInvoiceCopyWithImpl(this._self, this._then);

  final OutstandingInvoice _self;
  final $Res Function(OutstandingInvoice) _then;

/// Create a copy of OutstandingInvoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rrn = null,Object? periodLabel = freezed,Object? amount = null,Object? outstanding = null,Object? dueDate = freezed,Object? overdue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rrn: null == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OutstandingInvoice].
extension OutstandingInvoicePatterns on OutstandingInvoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutstandingInvoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutstandingInvoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutstandingInvoice value)  $default,){
final _that = this;
switch (_that) {
case _OutstandingInvoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutstandingInvoice value)?  $default,){
final _that = this;
switch (_that) {
case _OutstandingInvoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String rrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  bool overdue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutstandingInvoice() when $default != null:
return $default(_that.id,_that.rrn,_that.periodLabel,_that.amount,_that.outstanding,_that.dueDate,_that.overdue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String rrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  bool overdue)  $default,) {final _that = this;
switch (_that) {
case _OutstandingInvoice():
return $default(_that.id,_that.rrn,_that.periodLabel,_that.amount,_that.outstanding,_that.dueDate,_that.overdue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String rrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  bool overdue)?  $default,) {final _that = this;
switch (_that) {
case _OutstandingInvoice() when $default != null:
return $default(_that.id,_that.rrn,_that.periodLabel,_that.amount,_that.outstanding,_that.dueDate,_that.overdue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutstandingInvoice extends OutstandingInvoice {
  const _OutstandingInvoice({required this.id, required this.rrn, this.periodLabel, @JsonKey(fromJson: parseDouble) this.amount = 0, @JsonKey(fromJson: parseDouble) this.outstanding = 0, this.dueDate, this.overdue = false}): super._();
  factory _OutstandingInvoice.fromJson(Map<String, dynamic> json) => _$OutstandingInvoiceFromJson(json);

@override final  String id;
@override final  String rrn;
@override final  String? periodLabel;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override@JsonKey(fromJson: parseDouble) final  double outstanding;
@override final  String? dueDate;
@override@JsonKey() final  bool overdue;

/// Create a copy of OutstandingInvoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutstandingInvoiceCopyWith<_OutstandingInvoice> get copyWith => __$OutstandingInvoiceCopyWithImpl<_OutstandingInvoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutstandingInvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutstandingInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rrn,periodLabel,amount,outstanding,dueDate,overdue);

@override
String toString() {
  return 'OutstandingInvoice(id: $id, rrn: $rrn, periodLabel: $periodLabel, amount: $amount, outstanding: $outstanding, dueDate: $dueDate, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class _$OutstandingInvoiceCopyWith<$Res> implements $OutstandingInvoiceCopyWith<$Res> {
  factory _$OutstandingInvoiceCopyWith(_OutstandingInvoice value, $Res Function(_OutstandingInvoice) _then) = __$OutstandingInvoiceCopyWithImpl;
@override @useResult
$Res call({
 String id, String rrn, String? periodLabel,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double outstanding, String? dueDate, bool overdue
});




}
/// @nodoc
class __$OutstandingInvoiceCopyWithImpl<$Res>
    implements _$OutstandingInvoiceCopyWith<$Res> {
  __$OutstandingInvoiceCopyWithImpl(this._self, this._then);

  final _OutstandingInvoice _self;
  final $Res Function(_OutstandingInvoice) _then;

/// Create a copy of OutstandingInvoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rrn = null,Object? periodLabel = freezed,Object? amount = null,Object? outstanding = null,Object? dueDate = freezed,Object? overdue = null,}) {
  return _then(_OutstandingInvoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rrn: null == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
