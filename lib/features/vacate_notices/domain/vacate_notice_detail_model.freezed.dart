// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacate_notice_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacateNoticeDetailModel {

 VacateNoticeModel get notice;/// The settlement, line by line — the deposit held, and everything coming off it.
 List<SettlementLineModel> get lines;/// What happens next, in the server's words.
 String? get nextStep;/// Whether they gave enough notice, and what that costs if not.
 ShortNoticeModel? get shortNotice;/// What has been paid against the settlement.
 List<PaymentModel> get payments;
/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacateNoticeDetailModelCopyWith<VacateNoticeDetailModel> get copyWith => _$VacateNoticeDetailModelCopyWithImpl<VacateNoticeDetailModel>(this as VacateNoticeDetailModel, _$identity);

  /// Serializes this VacateNoticeDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacateNoticeDetailModel&&(identical(other.notice, notice) || other.notice == notice)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.nextStep, nextStep) || other.nextStep == nextStep)&&(identical(other.shortNotice, shortNotice) || other.shortNotice == shortNotice)&&const DeepCollectionEquality().equals(other.payments, payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notice,const DeepCollectionEquality().hash(lines),nextStep,shortNotice,const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'VacateNoticeDetailModel(notice: $notice, lines: $lines, nextStep: $nextStep, shortNotice: $shortNotice, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $VacateNoticeDetailModelCopyWith<$Res>  {
  factory $VacateNoticeDetailModelCopyWith(VacateNoticeDetailModel value, $Res Function(VacateNoticeDetailModel) _then) = _$VacateNoticeDetailModelCopyWithImpl;
@useResult
$Res call({
 VacateNoticeModel notice, List<SettlementLineModel> lines, String? nextStep, ShortNoticeModel? shortNotice, List<PaymentModel> payments
});


$VacateNoticeModelCopyWith<$Res> get notice;$ShortNoticeModelCopyWith<$Res>? get shortNotice;

}
/// @nodoc
class _$VacateNoticeDetailModelCopyWithImpl<$Res>
    implements $VacateNoticeDetailModelCopyWith<$Res> {
  _$VacateNoticeDetailModelCopyWithImpl(this._self, this._then);

  final VacateNoticeDetailModel _self;
  final $Res Function(VacateNoticeDetailModel) _then;

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notice = null,Object? lines = null,Object? nextStep = freezed,Object? shortNotice = freezed,Object? payments = null,}) {
  return _then(_self.copyWith(
notice: null == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as VacateNoticeModel,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<SettlementLineModel>,nextStep: freezed == nextStep ? _self.nextStep : nextStep // ignore: cast_nullable_to_non_nullable
as String?,shortNotice: freezed == shortNotice ? _self.shortNotice : shortNotice // ignore: cast_nullable_to_non_nullable
as ShortNoticeModel?,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}
/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VacateNoticeModelCopyWith<$Res> get notice {
  
  return $VacateNoticeModelCopyWith<$Res>(_self.notice, (value) {
    return _then(_self.copyWith(notice: value));
  });
}/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortNoticeModelCopyWith<$Res>? get shortNotice {
    if (_self.shortNotice == null) {
    return null;
  }

  return $ShortNoticeModelCopyWith<$Res>(_self.shortNotice!, (value) {
    return _then(_self.copyWith(shortNotice: value));
  });
}
}


/// Adds pattern-matching-related methods to [VacateNoticeDetailModel].
extension VacateNoticeDetailModelPatterns on VacateNoticeDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacateNoticeDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacateNoticeDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacateNoticeDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VacateNoticeModel notice,  List<SettlementLineModel> lines,  String? nextStep,  ShortNoticeModel? shortNotice,  List<PaymentModel> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
return $default(_that.notice,_that.lines,_that.nextStep,_that.shortNotice,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VacateNoticeModel notice,  List<SettlementLineModel> lines,  String? nextStep,  ShortNoticeModel? shortNotice,  List<PaymentModel> payments)  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel():
return $default(_that.notice,_that.lines,_that.nextStep,_that.shortNotice,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VacateNoticeModel notice,  List<SettlementLineModel> lines,  String? nextStep,  ShortNoticeModel? shortNotice,  List<PaymentModel> payments)?  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
return $default(_that.notice,_that.lines,_that.nextStep,_that.shortNotice,_that.payments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacateNoticeDetailModel extends VacateNoticeDetailModel {
  const _VacateNoticeDetailModel({required this.notice, final  List<SettlementLineModel> lines = const <SettlementLineModel>[], this.nextStep, this.shortNotice, final  List<PaymentModel> payments = const <PaymentModel>[]}): _lines = lines,_payments = payments,super._();
  factory _VacateNoticeDetailModel.fromJson(Map<String, dynamic> json) => _$VacateNoticeDetailModelFromJson(json);

@override final  VacateNoticeModel notice;
/// The settlement, line by line — the deposit held, and everything coming off it.
 final  List<SettlementLineModel> _lines;
/// The settlement, line by line — the deposit held, and everything coming off it.
@override@JsonKey() List<SettlementLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

/// What happens next, in the server's words.
@override final  String? nextStep;
/// Whether they gave enough notice, and what that costs if not.
@override final  ShortNoticeModel? shortNotice;
/// What has been paid against the settlement.
 final  List<PaymentModel> _payments;
/// What has been paid against the settlement.
@override@JsonKey() List<PaymentModel> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacateNoticeDetailModelCopyWith<_VacateNoticeDetailModel> get copyWith => __$VacateNoticeDetailModelCopyWithImpl<_VacateNoticeDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacateNoticeDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacateNoticeDetailModel&&(identical(other.notice, notice) || other.notice == notice)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.nextStep, nextStep) || other.nextStep == nextStep)&&(identical(other.shortNotice, shortNotice) || other.shortNotice == shortNotice)&&const DeepCollectionEquality().equals(other._payments, _payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notice,const DeepCollectionEquality().hash(_lines),nextStep,shortNotice,const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'VacateNoticeDetailModel(notice: $notice, lines: $lines, nextStep: $nextStep, shortNotice: $shortNotice, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$VacateNoticeDetailModelCopyWith<$Res> implements $VacateNoticeDetailModelCopyWith<$Res> {
  factory _$VacateNoticeDetailModelCopyWith(_VacateNoticeDetailModel value, $Res Function(_VacateNoticeDetailModel) _then) = __$VacateNoticeDetailModelCopyWithImpl;
@override @useResult
$Res call({
 VacateNoticeModel notice, List<SettlementLineModel> lines, String? nextStep, ShortNoticeModel? shortNotice, List<PaymentModel> payments
});


@override $VacateNoticeModelCopyWith<$Res> get notice;@override $ShortNoticeModelCopyWith<$Res>? get shortNotice;

}
/// @nodoc
class __$VacateNoticeDetailModelCopyWithImpl<$Res>
    implements _$VacateNoticeDetailModelCopyWith<$Res> {
  __$VacateNoticeDetailModelCopyWithImpl(this._self, this._then);

  final _VacateNoticeDetailModel _self;
  final $Res Function(_VacateNoticeDetailModel) _then;

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notice = null,Object? lines = null,Object? nextStep = freezed,Object? shortNotice = freezed,Object? payments = null,}) {
  return _then(_VacateNoticeDetailModel(
notice: null == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as VacateNoticeModel,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<SettlementLineModel>,nextStep: freezed == nextStep ? _self.nextStep : nextStep // ignore: cast_nullable_to_non_nullable
as String?,shortNotice: freezed == shortNotice ? _self.shortNotice : shortNotice // ignore: cast_nullable_to_non_nullable
as ShortNoticeModel?,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VacateNoticeModelCopyWith<$Res> get notice {
  
  return $VacateNoticeModelCopyWith<$Res>(_self.notice, (value) {
    return _then(_self.copyWith(notice: value));
  });
}/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortNoticeModelCopyWith<$Res>? get shortNotice {
    if (_self.shortNotice == null) {
    return null;
  }

  return $ShortNoticeModelCopyWith<$Res>(_self.shortNotice!, (value) {
    return _then(_self.copyWith(shortNotice: value));
  });
}
}


/// @nodoc
mixin _$SettlementLineModel {

 String? get id;/// Where it came from — the deposit, a meter reading, rent owed, damage.
 String? get source; String get description;/// Negative for a deduction, positive for something credited back.
@JsonKey(fromJson: parseDouble) double get amount; String? get utilityBillId;/// The meter reading behind a utility line, where there is one. Shown so a tenant can check
/// the figure against the dial rather than take it on trust.
@JsonKey(fromJson: parseDoubleNullable) double? get reading;
/// Create a copy of SettlementLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementLineModelCopyWith<SettlementLineModel> get copyWith => _$SettlementLineModelCopyWithImpl<SettlementLineModel>(this as SettlementLineModel, _$identity);

  /// Serializes this SettlementLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementLineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.utilityBillId, utilityBillId) || other.utilityBillId == utilityBillId)&&(identical(other.reading, reading) || other.reading == reading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,description,amount,utilityBillId,reading);

@override
String toString() {
  return 'SettlementLineModel(id: $id, source: $source, description: $description, amount: $amount, utilityBillId: $utilityBillId, reading: $reading)';
}


}

/// @nodoc
abstract mixin class $SettlementLineModelCopyWith<$Res>  {
  factory $SettlementLineModelCopyWith(SettlementLineModel value, $Res Function(SettlementLineModel) _then) = _$SettlementLineModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? source, String description,@JsonKey(fromJson: parseDouble) double amount, String? utilityBillId,@JsonKey(fromJson: parseDoubleNullable) double? reading
});




}
/// @nodoc
class _$SettlementLineModelCopyWithImpl<$Res>
    implements $SettlementLineModelCopyWith<$Res> {
  _$SettlementLineModelCopyWithImpl(this._self, this._then);

  final SettlementLineModel _self;
  final $Res Function(SettlementLineModel) _then;

/// Create a copy of SettlementLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? source = freezed,Object? description = null,Object? amount = null,Object? utilityBillId = freezed,Object? reading = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,utilityBillId: freezed == utilityBillId ? _self.utilityBillId : utilityBillId // ignore: cast_nullable_to_non_nullable
as String?,reading: freezed == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementLineModel].
extension SettlementLineModelPatterns on SettlementLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementLineModel value)  $default,){
final _that = this;
switch (_that) {
case _SettlementLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? source,  String description, @JsonKey(fromJson: parseDouble)  double amount,  String? utilityBillId, @JsonKey(fromJson: parseDoubleNullable)  double? reading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementLineModel() when $default != null:
return $default(_that.id,_that.source,_that.description,_that.amount,_that.utilityBillId,_that.reading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? source,  String description, @JsonKey(fromJson: parseDouble)  double amount,  String? utilityBillId, @JsonKey(fromJson: parseDoubleNullable)  double? reading)  $default,) {final _that = this;
switch (_that) {
case _SettlementLineModel():
return $default(_that.id,_that.source,_that.description,_that.amount,_that.utilityBillId,_that.reading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? source,  String description, @JsonKey(fromJson: parseDouble)  double amount,  String? utilityBillId, @JsonKey(fromJson: parseDoubleNullable)  double? reading)?  $default,) {final _that = this;
switch (_that) {
case _SettlementLineModel() when $default != null:
return $default(_that.id,_that.source,_that.description,_that.amount,_that.utilityBillId,_that.reading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettlementLineModel extends SettlementLineModel {
  const _SettlementLineModel({this.id, this.source, required this.description, @JsonKey(fromJson: parseDouble) this.amount = 0, this.utilityBillId, @JsonKey(fromJson: parseDoubleNullable) this.reading}): super._();
  factory _SettlementLineModel.fromJson(Map<String, dynamic> json) => _$SettlementLineModelFromJson(json);

@override final  String? id;
/// Where it came from — the deposit, a meter reading, rent owed, damage.
@override final  String? source;
@override final  String description;
/// Negative for a deduction, positive for something credited back.
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override final  String? utilityBillId;
/// The meter reading behind a utility line, where there is one. Shown so a tenant can check
/// the figure against the dial rather than take it on trust.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? reading;

/// Create a copy of SettlementLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementLineModelCopyWith<_SettlementLineModel> get copyWith => __$SettlementLineModelCopyWithImpl<_SettlementLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettlementLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementLineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.utilityBillId, utilityBillId) || other.utilityBillId == utilityBillId)&&(identical(other.reading, reading) || other.reading == reading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,description,amount,utilityBillId,reading);

@override
String toString() {
  return 'SettlementLineModel(id: $id, source: $source, description: $description, amount: $amount, utilityBillId: $utilityBillId, reading: $reading)';
}


}

/// @nodoc
abstract mixin class _$SettlementLineModelCopyWith<$Res> implements $SettlementLineModelCopyWith<$Res> {
  factory _$SettlementLineModelCopyWith(_SettlementLineModel value, $Res Function(_SettlementLineModel) _then) = __$SettlementLineModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? source, String description,@JsonKey(fromJson: parseDouble) double amount, String? utilityBillId,@JsonKey(fromJson: parseDoubleNullable) double? reading
});




}
/// @nodoc
class __$SettlementLineModelCopyWithImpl<$Res>
    implements _$SettlementLineModelCopyWith<$Res> {
  __$SettlementLineModelCopyWithImpl(this._self, this._then);

  final _SettlementLineModel _self;
  final $Res Function(_SettlementLineModel) _then;

/// Create a copy of SettlementLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? source = freezed,Object? description = null,Object? amount = null,Object? utilityBillId = freezed,Object? reading = freezed,}) {
  return _then(_SettlementLineModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,utilityBillId: freezed == utilityBillId ? _self.utilityBillId : utilityBillId // ignore: cast_nullable_to_non_nullable
as String?,reading: freezed == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ShortNoticeModel {

/// Days the tenancy required. Null where none was agreed.
 int? get required;/// Days actually given.
 int get given; int get shortBy; bool get isShort;/// Whether the shortfall carries a charge. Short notice is not automatically chargeable —
/// that is a property setting, and the server has read it.
 bool get chargeable; String? get penalty;@JsonKey(fromJson: parseDouble) double get suggestedAmount; String? get description;/// Why, in plain words. Shown rather than paraphrased.
 String? get explanation;
/// Create a copy of ShortNoticeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortNoticeModelCopyWith<ShortNoticeModel> get copyWith => _$ShortNoticeModelCopyWithImpl<ShortNoticeModel>(this as ShortNoticeModel, _$identity);

  /// Serializes this ShortNoticeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortNoticeModel&&(identical(other.required, required) || other.required == required)&&(identical(other.given, given) || other.given == given)&&(identical(other.shortBy, shortBy) || other.shortBy == shortBy)&&(identical(other.isShort, isShort) || other.isShort == isShort)&&(identical(other.chargeable, chargeable) || other.chargeable == chargeable)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.description, description) || other.description == description)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,required,given,shortBy,isShort,chargeable,penalty,suggestedAmount,description,explanation);

@override
String toString() {
  return 'ShortNoticeModel(required: $required, given: $given, shortBy: $shortBy, isShort: $isShort, chargeable: $chargeable, penalty: $penalty, suggestedAmount: $suggestedAmount, description: $description, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ShortNoticeModelCopyWith<$Res>  {
  factory $ShortNoticeModelCopyWith(ShortNoticeModel value, $Res Function(ShortNoticeModel) _then) = _$ShortNoticeModelCopyWithImpl;
@useResult
$Res call({
 int? required, int given, int shortBy, bool isShort, bool chargeable, String? penalty,@JsonKey(fromJson: parseDouble) double suggestedAmount, String? description, String? explanation
});




}
/// @nodoc
class _$ShortNoticeModelCopyWithImpl<$Res>
    implements $ShortNoticeModelCopyWith<$Res> {
  _$ShortNoticeModelCopyWithImpl(this._self, this._then);

  final ShortNoticeModel _self;
  final $Res Function(ShortNoticeModel) _then;

/// Create a copy of ShortNoticeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? required = freezed,Object? given = null,Object? shortBy = null,Object? isShort = null,Object? chargeable = null,Object? penalty = freezed,Object? suggestedAmount = null,Object? description = freezed,Object? explanation = freezed,}) {
  return _then(_self.copyWith(
required: freezed == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as int?,given: null == given ? _self.given : given // ignore: cast_nullable_to_non_nullable
as int,shortBy: null == shortBy ? _self.shortBy : shortBy // ignore: cast_nullable_to_non_nullable
as int,isShort: null == isShort ? _self.isShort : isShort // ignore: cast_nullable_to_non_nullable
as bool,chargeable: null == chargeable ? _self.chargeable : chargeable // ignore: cast_nullable_to_non_nullable
as bool,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String?,suggestedAmount: null == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShortNoticeModel].
extension ShortNoticeModelPatterns on ShortNoticeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShortNoticeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShortNoticeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShortNoticeModel value)  $default,){
final _that = this;
switch (_that) {
case _ShortNoticeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShortNoticeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShortNoticeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? required,  int given,  int shortBy,  bool isShort,  bool chargeable,  String? penalty, @JsonKey(fromJson: parseDouble)  double suggestedAmount,  String? description,  String? explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShortNoticeModel() when $default != null:
return $default(_that.required,_that.given,_that.shortBy,_that.isShort,_that.chargeable,_that.penalty,_that.suggestedAmount,_that.description,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? required,  int given,  int shortBy,  bool isShort,  bool chargeable,  String? penalty, @JsonKey(fromJson: parseDouble)  double suggestedAmount,  String? description,  String? explanation)  $default,) {final _that = this;
switch (_that) {
case _ShortNoticeModel():
return $default(_that.required,_that.given,_that.shortBy,_that.isShort,_that.chargeable,_that.penalty,_that.suggestedAmount,_that.description,_that.explanation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? required,  int given,  int shortBy,  bool isShort,  bool chargeable,  String? penalty, @JsonKey(fromJson: parseDouble)  double suggestedAmount,  String? description,  String? explanation)?  $default,) {final _that = this;
switch (_that) {
case _ShortNoticeModel() when $default != null:
return $default(_that.required,_that.given,_that.shortBy,_that.isShort,_that.chargeable,_that.penalty,_that.suggestedAmount,_that.description,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShortNoticeModel extends ShortNoticeModel {
  const _ShortNoticeModel({this.required, this.given = 0, this.shortBy = 0, this.isShort = false, this.chargeable = false, this.penalty, @JsonKey(fromJson: parseDouble) this.suggestedAmount = 0, this.description, this.explanation}): super._();
  factory _ShortNoticeModel.fromJson(Map<String, dynamic> json) => _$ShortNoticeModelFromJson(json);

/// Days the tenancy required. Null where none was agreed.
@override final  int? required;
/// Days actually given.
@override@JsonKey() final  int given;
@override@JsonKey() final  int shortBy;
@override@JsonKey() final  bool isShort;
/// Whether the shortfall carries a charge. Short notice is not automatically chargeable —
/// that is a property setting, and the server has read it.
@override@JsonKey() final  bool chargeable;
@override final  String? penalty;
@override@JsonKey(fromJson: parseDouble) final  double suggestedAmount;
@override final  String? description;
/// Why, in plain words. Shown rather than paraphrased.
@override final  String? explanation;

/// Create a copy of ShortNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortNoticeModelCopyWith<_ShortNoticeModel> get copyWith => __$ShortNoticeModelCopyWithImpl<_ShortNoticeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShortNoticeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShortNoticeModel&&(identical(other.required, required) || other.required == required)&&(identical(other.given, given) || other.given == given)&&(identical(other.shortBy, shortBy) || other.shortBy == shortBy)&&(identical(other.isShort, isShort) || other.isShort == isShort)&&(identical(other.chargeable, chargeable) || other.chargeable == chargeable)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.description, description) || other.description == description)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,required,given,shortBy,isShort,chargeable,penalty,suggestedAmount,description,explanation);

@override
String toString() {
  return 'ShortNoticeModel(required: $required, given: $given, shortBy: $shortBy, isShort: $isShort, chargeable: $chargeable, penalty: $penalty, suggestedAmount: $suggestedAmount, description: $description, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$ShortNoticeModelCopyWith<$Res> implements $ShortNoticeModelCopyWith<$Res> {
  factory _$ShortNoticeModelCopyWith(_ShortNoticeModel value, $Res Function(_ShortNoticeModel) _then) = __$ShortNoticeModelCopyWithImpl;
@override @useResult
$Res call({
 int? required, int given, int shortBy, bool isShort, bool chargeable, String? penalty,@JsonKey(fromJson: parseDouble) double suggestedAmount, String? description, String? explanation
});




}
/// @nodoc
class __$ShortNoticeModelCopyWithImpl<$Res>
    implements _$ShortNoticeModelCopyWith<$Res> {
  __$ShortNoticeModelCopyWithImpl(this._self, this._then);

  final _ShortNoticeModel _self;
  final $Res Function(_ShortNoticeModel) _then;

/// Create a copy of ShortNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? required = freezed,Object? given = null,Object? shortBy = null,Object? isShort = null,Object? chargeable = null,Object? penalty = freezed,Object? suggestedAmount = null,Object? description = freezed,Object? explanation = freezed,}) {
  return _then(_ShortNoticeModel(
required: freezed == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as int?,given: null == given ? _self.given : given // ignore: cast_nullable_to_non_nullable
as int,shortBy: null == shortBy ? _self.shortBy : shortBy // ignore: cast_nullable_to_non_nullable
as int,isShort: null == isShort ? _self.isShort : isShort // ignore: cast_nullable_to_non_nullable
as bool,chargeable: null == chargeable ? _self.chargeable : chargeable // ignore: cast_nullable_to_non_nullable
as bool,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String?,suggestedAmount: null == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
