// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetailModel {

 String? get paymentRrn; String? get estateName; String? get paidBy; List<PaymentLineItem> get items;
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<PaymentDetailModel> get copyWith => _$PaymentDetailModelCopyWithImpl<PaymentDetailModel>(this as PaymentDetailModel, _$identity);

  /// Serializes this PaymentDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailModel&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentRrn,estateName,paidBy,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PaymentDetailModel(paymentRrn: $paymentRrn, estateName: $estateName, paidBy: $paidBy, items: $items)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailModelCopyWith<$Res>  {
  factory $PaymentDetailModelCopyWith(PaymentDetailModel value, $Res Function(PaymentDetailModel) _then) = _$PaymentDetailModelCopyWithImpl;
@useResult
$Res call({
 String? paymentRrn, String? estateName, String? paidBy, List<PaymentLineItem> items
});




}
/// @nodoc
class _$PaymentDetailModelCopyWithImpl<$Res>
    implements $PaymentDetailModelCopyWith<$Res> {
  _$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final PaymentDetailModel _self;
  final $Res Function(PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentRrn = freezed,Object? estateName = freezed,Object? paidBy = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetailModel].
extension PaymentDetailModelPatterns on PaymentDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? paymentRrn,  String? estateName,  String? paidBy,  List<PaymentLineItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.paymentRrn,_that.estateName,_that.paidBy,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? paymentRrn,  String? estateName,  String? paidBy,  List<PaymentLineItem> items)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel():
return $default(_that.paymentRrn,_that.estateName,_that.paidBy,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? paymentRrn,  String? estateName,  String? paidBy,  List<PaymentLineItem> items)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.paymentRrn,_that.estateName,_that.paidBy,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailModel extends PaymentDetailModel {
  const _PaymentDetailModel({this.paymentRrn, this.estateName, this.paidBy, final  List<PaymentLineItem> items = const []}): _items = items,super._();
  factory _PaymentDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailModelFromJson(json);

@override final  String? paymentRrn;
@override final  String? estateName;
@override final  String? paidBy;
 final  List<PaymentLineItem> _items;
@override@JsonKey() List<PaymentLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailModelCopyWith<_PaymentDetailModel> get copyWith => __$PaymentDetailModelCopyWithImpl<_PaymentDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailModel&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentRrn,estateName,paidBy,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PaymentDetailModel(paymentRrn: $paymentRrn, estateName: $estateName, paidBy: $paidBy, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailModelCopyWith<$Res> implements $PaymentDetailModelCopyWith<$Res> {
  factory _$PaymentDetailModelCopyWith(_PaymentDetailModel value, $Res Function(_PaymentDetailModel) _then) = __$PaymentDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? paymentRrn, String? estateName, String? paidBy, List<PaymentLineItem> items
});




}
/// @nodoc
class __$PaymentDetailModelCopyWithImpl<$Res>
    implements _$PaymentDetailModelCopyWith<$Res> {
  __$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailModel _self;
  final $Res Function(_PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentRrn = freezed,Object? estateName = freezed,Object? paidBy = freezed,Object? items = null,}) {
  return _then(_PaymentDetailModel(
paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,
  ));
}


}


/// @nodoc
mixin _$PaymentLineItem {

 String? get narration; double get value;
/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentLineItemCopyWith<PaymentLineItem> get copyWith => _$PaymentLineItemCopyWithImpl<PaymentLineItem>(this as PaymentLineItem, _$identity);

  /// Serializes this PaymentLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'PaymentLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class $PaymentLineItemCopyWith<$Res>  {
  factory $PaymentLineItemCopyWith(PaymentLineItem value, $Res Function(PaymentLineItem) _then) = _$PaymentLineItemCopyWithImpl;
@useResult
$Res call({
 String? narration, double value
});




}
/// @nodoc
class _$PaymentLineItemCopyWithImpl<$Res>
    implements $PaymentLineItemCopyWith<$Res> {
  _$PaymentLineItemCopyWithImpl(this._self, this._then);

  final PaymentLineItem _self;
  final $Res Function(PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_self.copyWith(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentLineItem].
extension PaymentLineItemPatterns on PaymentLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentLineItem value)  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? narration,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.narration,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? narration,  double value)  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem():
return $default(_that.narration,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? narration,  double value)?  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.narration,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentLineItem extends PaymentLineItem {
  const _PaymentLineItem({this.narration, this.value = 0}): super._();
  factory _PaymentLineItem.fromJson(Map<String, dynamic> json) => _$PaymentLineItemFromJson(json);

@override final  String? narration;
@override@JsonKey() final  double value;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentLineItemCopyWith<_PaymentLineItem> get copyWith => __$PaymentLineItemCopyWithImpl<_PaymentLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'PaymentLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PaymentLineItemCopyWith<$Res> implements $PaymentLineItemCopyWith<$Res> {
  factory _$PaymentLineItemCopyWith(_PaymentLineItem value, $Res Function(_PaymentLineItem) _then) = __$PaymentLineItemCopyWithImpl;
@override @useResult
$Res call({
 String? narration, double value
});




}
/// @nodoc
class __$PaymentLineItemCopyWithImpl<$Res>
    implements _$PaymentLineItemCopyWith<$Res> {
  __$PaymentLineItemCopyWithImpl(this._self, this._then);

  final _PaymentLineItem _self;
  final $Res Function(_PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_PaymentLineItem(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
