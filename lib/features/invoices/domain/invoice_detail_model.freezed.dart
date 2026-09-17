// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceDetailModel {

 InvoiceModel get invoice; List<InvoiceLineItem> get lines;/// What has been paid against this invoice.
///
/// An invoice with a balance is a subtraction, and a document showing only the charges asks
/// the reader to take the balance on trust. The public document carried these and the
/// signed-in one did not, so the app could show what was owed and never what had been paid
/// against it — which is the half somebody is actually checking when they open a bill they
/// have already sent money for.
 List<InvoicePaymentLine> get payments;/// Arrears carried into this invoice from earlier periods.
///
/// Inside [InvoiceModel.amount] and outside the sum of [lines], which is why it is stated
/// separately: a detail screen that added the lines and expected the total would be short by
/// exactly this, and would look like an arithmetic bug rather than a brought-forward balance.
@JsonKey(fromJson: parseDouble) double get broughtForward;/// What is actually due — the amount less what has been paid.
@JsonKey(fromJson: parseDouble) double get totalPayable; String? get voidReason; String? get voidedBy; String? get voidedOn;/// How to pay, and the footer — both resolved server-side from the property and the estate, so
/// a document the app renders says what the printed one says.
 String? get paymentInstructions; String? get footer;
/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDetailModelCopyWith<InvoiceDetailModel> get copyWith => _$InvoiceDetailModelCopyWithImpl<InvoiceDetailModel>(this as InvoiceDetailModel, _$identity);

  /// Serializes this InvoiceDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDetailModel&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other.lines, lines)&&const DeepCollectionEquality().equals(other.payments, payments)&&(identical(other.broughtForward, broughtForward) || other.broughtForward == broughtForward)&&(identical(other.totalPayable, totalPayable) || other.totalPayable == totalPayable)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.voidedBy, voidedBy) || other.voidedBy == voidedBy)&&(identical(other.voidedOn, voidedOn) || other.voidedOn == voidedOn)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.footer, footer) || other.footer == footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoice,const DeepCollectionEquality().hash(lines),const DeepCollectionEquality().hash(payments),broughtForward,totalPayable,voidReason,voidedBy,voidedOn,paymentInstructions,footer);

@override
String toString() {
  return 'InvoiceDetailModel(invoice: $invoice, lines: $lines, payments: $payments, broughtForward: $broughtForward, totalPayable: $totalPayable, voidReason: $voidReason, voidedBy: $voidedBy, voidedOn: $voidedOn, paymentInstructions: $paymentInstructions, footer: $footer)';
}


}

/// @nodoc
abstract mixin class $InvoiceDetailModelCopyWith<$Res>  {
  factory $InvoiceDetailModelCopyWith(InvoiceDetailModel value, $Res Function(InvoiceDetailModel) _then) = _$InvoiceDetailModelCopyWithImpl;
@useResult
$Res call({
 InvoiceModel invoice, List<InvoiceLineItem> lines, List<InvoicePaymentLine> payments,@JsonKey(fromJson: parseDouble) double broughtForward,@JsonKey(fromJson: parseDouble) double totalPayable, String? voidReason, String? voidedBy, String? voidedOn, String? paymentInstructions, String? footer
});


$InvoiceModelCopyWith<$Res> get invoice;

}
/// @nodoc
class _$InvoiceDetailModelCopyWithImpl<$Res>
    implements $InvoiceDetailModelCopyWith<$Res> {
  _$InvoiceDetailModelCopyWithImpl(this._self, this._then);

  final InvoiceDetailModel _self;
  final $Res Function(InvoiceDetailModel) _then;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoice = null,Object? lines = null,Object? payments = null,Object? broughtForward = null,Object? totalPayable = null,Object? voidReason = freezed,Object? voidedBy = freezed,Object? voidedOn = freezed,Object? paymentInstructions = freezed,Object? footer = freezed,}) {
  return _then(_self.copyWith(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<InvoiceLineItem>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoicePaymentLine>,broughtForward: null == broughtForward ? _self.broughtForward : broughtForward // ignore: cast_nullable_to_non_nullable
as double,totalPayable: null == totalPayable ? _self.totalPayable : totalPayable // ignore: cast_nullable_to_non_nullable
as double,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voidedBy: freezed == voidedBy ? _self.voidedBy : voidedBy // ignore: cast_nullable_to_non_nullable
as String?,voidedOn: freezed == voidedOn ? _self.voidedOn : voidedOn // ignore: cast_nullable_to_non_nullable
as String?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<$Res> get invoice {
  
  return $InvoiceModelCopyWith<$Res>(_self.invoice, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}


/// Adds pattern-matching-related methods to [InvoiceDetailModel].
extension InvoiceDetailModelPatterns on InvoiceDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvoiceModel invoice,  List<InvoiceLineItem> lines,  List<InvoicePaymentLine> payments, @JsonKey(fromJson: parseDouble)  double broughtForward, @JsonKey(fromJson: parseDouble)  double totalPayable,  String? voidReason,  String? voidedBy,  String? voidedOn,  String? paymentInstructions,  String? footer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
return $default(_that.invoice,_that.lines,_that.payments,_that.broughtForward,_that.totalPayable,_that.voidReason,_that.voidedBy,_that.voidedOn,_that.paymentInstructions,_that.footer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvoiceModel invoice,  List<InvoiceLineItem> lines,  List<InvoicePaymentLine> payments, @JsonKey(fromJson: parseDouble)  double broughtForward, @JsonKey(fromJson: parseDouble)  double totalPayable,  String? voidReason,  String? voidedBy,  String? voidedOn,  String? paymentInstructions,  String? footer)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailModel():
return $default(_that.invoice,_that.lines,_that.payments,_that.broughtForward,_that.totalPayable,_that.voidReason,_that.voidedBy,_that.voidedOn,_that.paymentInstructions,_that.footer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvoiceModel invoice,  List<InvoiceLineItem> lines,  List<InvoicePaymentLine> payments, @JsonKey(fromJson: parseDouble)  double broughtForward, @JsonKey(fromJson: parseDouble)  double totalPayable,  String? voidReason,  String? voidedBy,  String? voidedOn,  String? paymentInstructions,  String? footer)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
return $default(_that.invoice,_that.lines,_that.payments,_that.broughtForward,_that.totalPayable,_that.voidReason,_that.voidedBy,_that.voidedOn,_that.paymentInstructions,_that.footer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDetailModel extends InvoiceDetailModel {
  const _InvoiceDetailModel({required this.invoice, final  List<InvoiceLineItem> lines = const [], final  List<InvoicePaymentLine> payments = const [], @JsonKey(fromJson: parseDouble) this.broughtForward = 0, @JsonKey(fromJson: parseDouble) this.totalPayable = 0, this.voidReason, this.voidedBy, this.voidedOn, this.paymentInstructions, this.footer}): _lines = lines,_payments = payments,super._();
  factory _InvoiceDetailModel.fromJson(Map<String, dynamic> json) => _$InvoiceDetailModelFromJson(json);

@override final  InvoiceModel invoice;
 final  List<InvoiceLineItem> _lines;
@override@JsonKey() List<InvoiceLineItem> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

/// What has been paid against this invoice.
///
/// An invoice with a balance is a subtraction, and a document showing only the charges asks
/// the reader to take the balance on trust. The public document carried these and the
/// signed-in one did not, so the app could show what was owed and never what had been paid
/// against it — which is the half somebody is actually checking when they open a bill they
/// have already sent money for.
 final  List<InvoicePaymentLine> _payments;
/// What has been paid against this invoice.
///
/// An invoice with a balance is a subtraction, and a document showing only the charges asks
/// the reader to take the balance on trust. The public document carried these and the
/// signed-in one did not, so the app could show what was owed and never what had been paid
/// against it — which is the half somebody is actually checking when they open a bill they
/// have already sent money for.
@override@JsonKey() List<InvoicePaymentLine> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

/// Arrears carried into this invoice from earlier periods.
///
/// Inside [InvoiceModel.amount] and outside the sum of [lines], which is why it is stated
/// separately: a detail screen that added the lines and expected the total would be short by
/// exactly this, and would look like an arithmetic bug rather than a brought-forward balance.
@override@JsonKey(fromJson: parseDouble) final  double broughtForward;
/// What is actually due — the amount less what has been paid.
@override@JsonKey(fromJson: parseDouble) final  double totalPayable;
@override final  String? voidReason;
@override final  String? voidedBy;
@override final  String? voidedOn;
/// How to pay, and the footer — both resolved server-side from the property and the estate, so
/// a document the app renders says what the printed one says.
@override final  String? paymentInstructions;
@override final  String? footer;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDetailModelCopyWith<_InvoiceDetailModel> get copyWith => __$InvoiceDetailModelCopyWithImpl<_InvoiceDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDetailModel&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other._lines, _lines)&&const DeepCollectionEquality().equals(other._payments, _payments)&&(identical(other.broughtForward, broughtForward) || other.broughtForward == broughtForward)&&(identical(other.totalPayable, totalPayable) || other.totalPayable == totalPayable)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.voidedBy, voidedBy) || other.voidedBy == voidedBy)&&(identical(other.voidedOn, voidedOn) || other.voidedOn == voidedOn)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.footer, footer) || other.footer == footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoice,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_payments),broughtForward,totalPayable,voidReason,voidedBy,voidedOn,paymentInstructions,footer);

@override
String toString() {
  return 'InvoiceDetailModel(invoice: $invoice, lines: $lines, payments: $payments, broughtForward: $broughtForward, totalPayable: $totalPayable, voidReason: $voidReason, voidedBy: $voidedBy, voidedOn: $voidedOn, paymentInstructions: $paymentInstructions, footer: $footer)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDetailModelCopyWith<$Res> implements $InvoiceDetailModelCopyWith<$Res> {
  factory _$InvoiceDetailModelCopyWith(_InvoiceDetailModel value, $Res Function(_InvoiceDetailModel) _then) = __$InvoiceDetailModelCopyWithImpl;
@override @useResult
$Res call({
 InvoiceModel invoice, List<InvoiceLineItem> lines, List<InvoicePaymentLine> payments,@JsonKey(fromJson: parseDouble) double broughtForward,@JsonKey(fromJson: parseDouble) double totalPayable, String? voidReason, String? voidedBy, String? voidedOn, String? paymentInstructions, String? footer
});


@override $InvoiceModelCopyWith<$Res> get invoice;

}
/// @nodoc
class __$InvoiceDetailModelCopyWithImpl<$Res>
    implements _$InvoiceDetailModelCopyWith<$Res> {
  __$InvoiceDetailModelCopyWithImpl(this._self, this._then);

  final _InvoiceDetailModel _self;
  final $Res Function(_InvoiceDetailModel) _then;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoice = null,Object? lines = null,Object? payments = null,Object? broughtForward = null,Object? totalPayable = null,Object? voidReason = freezed,Object? voidedBy = freezed,Object? voidedOn = freezed,Object? paymentInstructions = freezed,Object? footer = freezed,}) {
  return _then(_InvoiceDetailModel(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<InvoiceLineItem>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoicePaymentLine>,broughtForward: null == broughtForward ? _self.broughtForward : broughtForward // ignore: cast_nullable_to_non_nullable
as double,totalPayable: null == totalPayable ? _self.totalPayable : totalPayable // ignore: cast_nullable_to_non_nullable
as double,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voidedBy: freezed == voidedBy ? _self.voidedBy : voidedBy // ignore: cast_nullable_to_non_nullable
as String?,voidedOn: freezed == voidedOn ? _self.voidedOn : voidedOn // ignore: cast_nullable_to_non_nullable
as String?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<$Res> get invoice {
  
  return $InvoiceModelCopyWith<$Res>(_self.invoice, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}


/// @nodoc
mixin _$InvoicePaymentLine {

 String? get narration;@JsonKey(fromJson: parseDouble) double get amount;
/// Create a copy of InvoicePaymentLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicePaymentLineCopyWith<InvoicePaymentLine> get copyWith => _$InvoicePaymentLineCopyWithImpl<InvoicePaymentLine>(this as InvoicePaymentLine, _$identity);

  /// Serializes this InvoicePaymentLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicePaymentLine&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,amount);

@override
String toString() {
  return 'InvoicePaymentLine(narration: $narration, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $InvoicePaymentLineCopyWith<$Res>  {
  factory $InvoicePaymentLineCopyWith(InvoicePaymentLine value, $Res Function(InvoicePaymentLine) _then) = _$InvoicePaymentLineCopyWithImpl;
@useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class _$InvoicePaymentLineCopyWithImpl<$Res>
    implements $InvoicePaymentLineCopyWith<$Res> {
  _$InvoicePaymentLineCopyWithImpl(this._self, this._then);

  final InvoicePaymentLine _self;
  final $Res Function(InvoicePaymentLine) _then;

/// Create a copy of InvoicePaymentLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narration = freezed,Object? amount = null,}) {
  return _then(_self.copyWith(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoicePaymentLine].
extension InvoicePaymentLinePatterns on InvoicePaymentLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoicePaymentLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoicePaymentLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoicePaymentLine value)  $default,){
final _that = this;
switch (_that) {
case _InvoicePaymentLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoicePaymentLine value)?  $default,){
final _that = this;
switch (_that) {
case _InvoicePaymentLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoicePaymentLine() when $default != null:
return $default(_that.narration,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)  $default,) {final _that = this;
switch (_that) {
case _InvoicePaymentLine():
return $default(_that.narration,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)?  $default,) {final _that = this;
switch (_that) {
case _InvoicePaymentLine() when $default != null:
return $default(_that.narration,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoicePaymentLine extends InvoicePaymentLine {
  const _InvoicePaymentLine({this.narration, @JsonKey(fromJson: parseDouble) this.amount = 0}): super._();
  factory _InvoicePaymentLine.fromJson(Map<String, dynamic> json) => _$InvoicePaymentLineFromJson(json);

@override final  String? narration;
@override@JsonKey(fromJson: parseDouble) final  double amount;

/// Create a copy of InvoicePaymentLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoicePaymentLineCopyWith<_InvoicePaymentLine> get copyWith => __$InvoicePaymentLineCopyWithImpl<_InvoicePaymentLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoicePaymentLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoicePaymentLine&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,amount);

@override
String toString() {
  return 'InvoicePaymentLine(narration: $narration, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$InvoicePaymentLineCopyWith<$Res> implements $InvoicePaymentLineCopyWith<$Res> {
  factory _$InvoicePaymentLineCopyWith(_InvoicePaymentLine value, $Res Function(_InvoicePaymentLine) _then) = __$InvoicePaymentLineCopyWithImpl;
@override @useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class __$InvoicePaymentLineCopyWithImpl<$Res>
    implements _$InvoicePaymentLineCopyWith<$Res> {
  __$InvoicePaymentLineCopyWithImpl(this._self, this._then);

  final _InvoicePaymentLine _self;
  final $Res Function(_InvoicePaymentLine) _then;

/// Create a copy of InvoicePaymentLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narration = freezed,Object? amount = null,}) {
  return _then(_InvoicePaymentLine(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$InvoiceLineItem {

/// `RENT`, `UTILITY`, `METERED`, `BROUGHT_FORWARD` — what sort of charge this is.
 String? get kind; String? get description;@JsonKey(fromJson: parseDouble) double get quantity;@JsonKey(fromJson: parseDouble) double get unitAmount;@JsonKey(fromJson: parseDouble) double get amount;
/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceLineItemCopyWith<InvoiceLineItem> get copyWith => _$InvoiceLineItemCopyWithImpl<InvoiceLineItem>(this as InvoiceLineItem, _$identity);

  /// Serializes this InvoiceLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceLineItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,quantity,unitAmount,amount);

@override
String toString() {
  return 'InvoiceLineItem(kind: $kind, description: $description, quantity: $quantity, unitAmount: $unitAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $InvoiceLineItemCopyWith<$Res>  {
  factory $InvoiceLineItemCopyWith(InvoiceLineItem value, $Res Function(InvoiceLineItem) _then) = _$InvoiceLineItemCopyWithImpl;
@useResult
$Res call({
 String? kind, String? description,@JsonKey(fromJson: parseDouble) double quantity,@JsonKey(fromJson: parseDouble) double unitAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class _$InvoiceLineItemCopyWithImpl<$Res>
    implements $InvoiceLineItemCopyWith<$Res> {
  _$InvoiceLineItemCopyWithImpl(this._self, this._then);

  final InvoiceLineItem _self;
  final $Res Function(InvoiceLineItem) _then;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = freezed,Object? description = freezed,Object? quantity = null,Object? unitAmount = null,Object? amount = null,}) {
  return _then(_self.copyWith(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceLineItem].
extension InvoiceLineItemPatterns on InvoiceLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceLineItem value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)  $default,) {final _that = this;
switch (_that) {
case _InvoiceLineItem():
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceLineItem extends InvoiceLineItem {
  const _InvoiceLineItem({this.kind, this.description, @JsonKey(fromJson: parseDouble) this.quantity = 0, @JsonKey(fromJson: parseDouble) this.unitAmount = 0, @JsonKey(fromJson: parseDouble) this.amount = 0}): super._();
  factory _InvoiceLineItem.fromJson(Map<String, dynamic> json) => _$InvoiceLineItemFromJson(json);

/// `RENT`, `UTILITY`, `METERED`, `BROUGHT_FORWARD` — what sort of charge this is.
@override final  String? kind;
@override final  String? description;
@override@JsonKey(fromJson: parseDouble) final  double quantity;
@override@JsonKey(fromJson: parseDouble) final  double unitAmount;
@override@JsonKey(fromJson: parseDouble) final  double amount;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceLineItemCopyWith<_InvoiceLineItem> get copyWith => __$InvoiceLineItemCopyWithImpl<_InvoiceLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceLineItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,quantity,unitAmount,amount);

@override
String toString() {
  return 'InvoiceLineItem(kind: $kind, description: $description, quantity: $quantity, unitAmount: $unitAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$InvoiceLineItemCopyWith<$Res> implements $InvoiceLineItemCopyWith<$Res> {
  factory _$InvoiceLineItemCopyWith(_InvoiceLineItem value, $Res Function(_InvoiceLineItem) _then) = __$InvoiceLineItemCopyWithImpl;
@override @useResult
$Res call({
 String? kind, String? description,@JsonKey(fromJson: parseDouble) double quantity,@JsonKey(fromJson: parseDouble) double unitAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class __$InvoiceLineItemCopyWithImpl<$Res>
    implements _$InvoiceLineItemCopyWith<$Res> {
  __$InvoiceLineItemCopyWithImpl(this._self, this._then);

  final _InvoiceLineItem _self;
  final $Res Function(_InvoiceLineItem) _then;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? description = freezed,Object? quantity = null,Object? unitAmount = null,Object? amount = null,}) {
  return _then(_InvoiceLineItem(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
