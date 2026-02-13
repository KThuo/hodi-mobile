// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantDetailModel {

 String? get name; String? get email; String? get phone; TenantFinancialSummary? get content;
/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantDetailModelCopyWith<TenantDetailModel> get copyWith => _$TenantDetailModelCopyWithImpl<TenantDetailModel>(this as TenantDetailModel, _$identity);

  /// Serializes this TenantDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantDetailModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,content);

@override
String toString() {
  return 'TenantDetailModel(name: $name, email: $email, phone: $phone, content: $content)';
}


}

/// @nodoc
abstract mixin class $TenantDetailModelCopyWith<$Res>  {
  factory $TenantDetailModelCopyWith(TenantDetailModel value, $Res Function(TenantDetailModel) _then) = _$TenantDetailModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? phone, TenantFinancialSummary? content
});


$TenantFinancialSummaryCopyWith<$Res>? get content;

}
/// @nodoc
class _$TenantDetailModelCopyWithImpl<$Res>
    implements $TenantDetailModelCopyWith<$Res> {
  _$TenantDetailModelCopyWithImpl(this._self, this._then);

  final TenantDetailModel _self;
  final $Res Function(TenantDetailModel) _then;

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TenantFinancialSummary?,
  ));
}
/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantFinancialSummaryCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TenantFinancialSummaryCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [TenantDetailModel].
extension TenantDetailModelPatterns on TenantDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  TenantFinancialSummary? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  TenantFinancialSummary? content)  $default,) {final _that = this;
switch (_that) {
case _TenantDetailModel():
return $default(_that.name,_that.email,_that.phone,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? phone,  TenantFinancialSummary? content)?  $default,) {final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantDetailModel extends TenantDetailModel {
  const _TenantDetailModel({this.name, this.email, this.phone, this.content}): super._();
  factory _TenantDetailModel.fromJson(Map<String, dynamic> json) => _$TenantDetailModelFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  TenantFinancialSummary? content;

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantDetailModelCopyWith<_TenantDetailModel> get copyWith => __$TenantDetailModelCopyWithImpl<_TenantDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantDetailModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,content);

@override
String toString() {
  return 'TenantDetailModel(name: $name, email: $email, phone: $phone, content: $content)';
}


}

/// @nodoc
abstract mixin class _$TenantDetailModelCopyWith<$Res> implements $TenantDetailModelCopyWith<$Res> {
  factory _$TenantDetailModelCopyWith(_TenantDetailModel value, $Res Function(_TenantDetailModel) _then) = __$TenantDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? phone, TenantFinancialSummary? content
});


@override $TenantFinancialSummaryCopyWith<$Res>? get content;

}
/// @nodoc
class __$TenantDetailModelCopyWithImpl<$Res>
    implements _$TenantDetailModelCopyWith<$Res> {
  __$TenantDetailModelCopyWithImpl(this._self, this._then);

  final _TenantDetailModel _self;
  final $Res Function(_TenantDetailModel) _then;

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? content = freezed,}) {
  return _then(_TenantDetailModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as TenantFinancialSummary?,
  ));
}

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantFinancialSummaryCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $TenantFinancialSummaryCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
mixin _$TenantFinancialSummary {

@JsonKey(fromJson: _parseDouble) double get totalRent;@JsonKey(fromJson: _parseDouble) double get totalPayment;@JsonKey(fromJson: _parseDouble) double get totalArrears; int get occupiedUnits;@JsonKey(fromJson: _parseDouble) double get totalTopups;@JsonKey(fromJson: _parseDouble) double get totalOverpayments;
/// Create a copy of TenantFinancialSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantFinancialSummaryCopyWith<TenantFinancialSummary> get copyWith => _$TenantFinancialSummaryCopyWithImpl<TenantFinancialSummary>(this as TenantFinancialSummary, _$identity);

  /// Serializes this TenantFinancialSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantFinancialSummary&&(identical(other.totalRent, totalRent) || other.totalRent == totalRent)&&(identical(other.totalPayment, totalPayment) || other.totalPayment == totalPayment)&&(identical(other.totalArrears, totalArrears) || other.totalArrears == totalArrears)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.totalTopups, totalTopups) || other.totalTopups == totalTopups)&&(identical(other.totalOverpayments, totalOverpayments) || other.totalOverpayments == totalOverpayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRent,totalPayment,totalArrears,occupiedUnits,totalTopups,totalOverpayments);

@override
String toString() {
  return 'TenantFinancialSummary(totalRent: $totalRent, totalPayment: $totalPayment, totalArrears: $totalArrears, occupiedUnits: $occupiedUnits, totalTopups: $totalTopups, totalOverpayments: $totalOverpayments)';
}


}

/// @nodoc
abstract mixin class $TenantFinancialSummaryCopyWith<$Res>  {
  factory $TenantFinancialSummaryCopyWith(TenantFinancialSummary value, $Res Function(TenantFinancialSummary) _then) = _$TenantFinancialSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseDouble) double totalRent,@JsonKey(fromJson: _parseDouble) double totalPayment,@JsonKey(fromJson: _parseDouble) double totalArrears, int occupiedUnits,@JsonKey(fromJson: _parseDouble) double totalTopups,@JsonKey(fromJson: _parseDouble) double totalOverpayments
});




}
/// @nodoc
class _$TenantFinancialSummaryCopyWithImpl<$Res>
    implements $TenantFinancialSummaryCopyWith<$Res> {
  _$TenantFinancialSummaryCopyWithImpl(this._self, this._then);

  final TenantFinancialSummary _self;
  final $Res Function(TenantFinancialSummary) _then;

/// Create a copy of TenantFinancialSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRent = null,Object? totalPayment = null,Object? totalArrears = null,Object? occupiedUnits = null,Object? totalTopups = null,Object? totalOverpayments = null,}) {
  return _then(_self.copyWith(
totalRent: null == totalRent ? _self.totalRent : totalRent // ignore: cast_nullable_to_non_nullable
as double,totalPayment: null == totalPayment ? _self.totalPayment : totalPayment // ignore: cast_nullable_to_non_nullable
as double,totalArrears: null == totalArrears ? _self.totalArrears : totalArrears // ignore: cast_nullable_to_non_nullable
as double,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,totalTopups: null == totalTopups ? _self.totalTopups : totalTopups // ignore: cast_nullable_to_non_nullable
as double,totalOverpayments: null == totalOverpayments ? _self.totalOverpayments : totalOverpayments // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantFinancialSummary].
extension TenantFinancialSummaryPatterns on TenantFinancialSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantFinancialSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantFinancialSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantFinancialSummary value)  $default,){
final _that = this;
switch (_that) {
case _TenantFinancialSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantFinancialSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TenantFinancialSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseDouble)  double totalRent, @JsonKey(fromJson: _parseDouble)  double totalPayment, @JsonKey(fromJson: _parseDouble)  double totalArrears,  int occupiedUnits, @JsonKey(fromJson: _parseDouble)  double totalTopups, @JsonKey(fromJson: _parseDouble)  double totalOverpayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantFinancialSummary() when $default != null:
return $default(_that.totalRent,_that.totalPayment,_that.totalArrears,_that.occupiedUnits,_that.totalTopups,_that.totalOverpayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseDouble)  double totalRent, @JsonKey(fromJson: _parseDouble)  double totalPayment, @JsonKey(fromJson: _parseDouble)  double totalArrears,  int occupiedUnits, @JsonKey(fromJson: _parseDouble)  double totalTopups, @JsonKey(fromJson: _parseDouble)  double totalOverpayments)  $default,) {final _that = this;
switch (_that) {
case _TenantFinancialSummary():
return $default(_that.totalRent,_that.totalPayment,_that.totalArrears,_that.occupiedUnits,_that.totalTopups,_that.totalOverpayments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseDouble)  double totalRent, @JsonKey(fromJson: _parseDouble)  double totalPayment, @JsonKey(fromJson: _parseDouble)  double totalArrears,  int occupiedUnits, @JsonKey(fromJson: _parseDouble)  double totalTopups, @JsonKey(fromJson: _parseDouble)  double totalOverpayments)?  $default,) {final _that = this;
switch (_that) {
case _TenantFinancialSummary() when $default != null:
return $default(_that.totalRent,_that.totalPayment,_that.totalArrears,_that.occupiedUnits,_that.totalTopups,_that.totalOverpayments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantFinancialSummary extends TenantFinancialSummary {
  const _TenantFinancialSummary({@JsonKey(fromJson: _parseDouble) this.totalRent = 0, @JsonKey(fromJson: _parseDouble) this.totalPayment = 0, @JsonKey(fromJson: _parseDouble) this.totalArrears = 0, this.occupiedUnits = 0, @JsonKey(fromJson: _parseDouble) this.totalTopups = 0, @JsonKey(fromJson: _parseDouble) this.totalOverpayments = 0}): super._();
  factory _TenantFinancialSummary.fromJson(Map<String, dynamic> json) => _$TenantFinancialSummaryFromJson(json);

@override@JsonKey(fromJson: _parseDouble) final  double totalRent;
@override@JsonKey(fromJson: _parseDouble) final  double totalPayment;
@override@JsonKey(fromJson: _parseDouble) final  double totalArrears;
@override@JsonKey() final  int occupiedUnits;
@override@JsonKey(fromJson: _parseDouble) final  double totalTopups;
@override@JsonKey(fromJson: _parseDouble) final  double totalOverpayments;

/// Create a copy of TenantFinancialSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantFinancialSummaryCopyWith<_TenantFinancialSummary> get copyWith => __$TenantFinancialSummaryCopyWithImpl<_TenantFinancialSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantFinancialSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantFinancialSummary&&(identical(other.totalRent, totalRent) || other.totalRent == totalRent)&&(identical(other.totalPayment, totalPayment) || other.totalPayment == totalPayment)&&(identical(other.totalArrears, totalArrears) || other.totalArrears == totalArrears)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.totalTopups, totalTopups) || other.totalTopups == totalTopups)&&(identical(other.totalOverpayments, totalOverpayments) || other.totalOverpayments == totalOverpayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRent,totalPayment,totalArrears,occupiedUnits,totalTopups,totalOverpayments);

@override
String toString() {
  return 'TenantFinancialSummary(totalRent: $totalRent, totalPayment: $totalPayment, totalArrears: $totalArrears, occupiedUnits: $occupiedUnits, totalTopups: $totalTopups, totalOverpayments: $totalOverpayments)';
}


}

/// @nodoc
abstract mixin class _$TenantFinancialSummaryCopyWith<$Res> implements $TenantFinancialSummaryCopyWith<$Res> {
  factory _$TenantFinancialSummaryCopyWith(_TenantFinancialSummary value, $Res Function(_TenantFinancialSummary) _then) = __$TenantFinancialSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseDouble) double totalRent,@JsonKey(fromJson: _parseDouble) double totalPayment,@JsonKey(fromJson: _parseDouble) double totalArrears, int occupiedUnits,@JsonKey(fromJson: _parseDouble) double totalTopups,@JsonKey(fromJson: _parseDouble) double totalOverpayments
});




}
/// @nodoc
class __$TenantFinancialSummaryCopyWithImpl<$Res>
    implements _$TenantFinancialSummaryCopyWith<$Res> {
  __$TenantFinancialSummaryCopyWithImpl(this._self, this._then);

  final _TenantFinancialSummary _self;
  final $Res Function(_TenantFinancialSummary) _then;

/// Create a copy of TenantFinancialSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRent = null,Object? totalPayment = null,Object? totalArrears = null,Object? occupiedUnits = null,Object? totalTopups = null,Object? totalOverpayments = null,}) {
  return _then(_TenantFinancialSummary(
totalRent: null == totalRent ? _self.totalRent : totalRent // ignore: cast_nullable_to_non_nullable
as double,totalPayment: null == totalPayment ? _self.totalPayment : totalPayment // ignore: cast_nullable_to_non_nullable
as double,totalArrears: null == totalArrears ? _self.totalArrears : totalArrears // ignore: cast_nullable_to_non_nullable
as double,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,totalTopups: null == totalTopups ? _self.totalTopups : totalTopups // ignore: cast_nullable_to_non_nullable
as double,totalOverpayments: null == totalOverpayments ? _self.totalOverpayments : totalOverpayments // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
