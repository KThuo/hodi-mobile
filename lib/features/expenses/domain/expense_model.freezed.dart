// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseModel {

 String get id; String get reference; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String get name; String? get description;@JsonKey(fromJson: parseDouble) double get amount; String? get incurredOn;/// `RECURRING`, `REPAIR`, `REFUND`, `UTILITY`, `OTHER` — the server's own list, which it
/// validates against a pattern. The app offers exactly these and nothing else.
 String get category;/// How it got here. A standing charge generates one; a repair becomes one when it is resolved
/// and costed; somebody typing it in is the third.
 String? get source; String? get sourceRef;/// The standing charge that raised it, where one did.
 String? get expenditureId; int get status; String? get createdOn; String? get createdBy;
/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseModelCopyWith<ExpenseModel> get copyWith => _$ExpenseModelCopyWithImpl<ExpenseModel>(this as ExpenseModel, _$identity);

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.incurredOn, incurredOn) || other.incurredOn == incurredOn)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceRef, sourceRef) || other.sourceRef == sourceRef)&&(identical(other.expenditureId, expenditureId) || other.expenditureId == expenditureId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,propertyId,propertyName,estateId,estateName,name,description,amount,incurredOn,category,source,sourceRef,expenditureId,status,createdOn,createdBy);

@override
String toString() {
  return 'ExpenseModel(id: $id, reference: $reference, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, name: $name, description: $description, amount: $amount, incurredOn: $incurredOn, category: $category, source: $source, sourceRef: $sourceRef, expenditureId: $expenditureId, status: $status, createdOn: $createdOn, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class $ExpenseModelCopyWith<$Res>  {
  factory $ExpenseModelCopyWith(ExpenseModel value, $Res Function(ExpenseModel) _then) = _$ExpenseModelCopyWithImpl;
@useResult
$Res call({
 String id, String reference, String? propertyId, String? propertyName, String? estateId, String? estateName, String name, String? description,@JsonKey(fromJson: parseDouble) double amount, String? incurredOn, String category, String? source, String? sourceRef, String? expenditureId, int status, String? createdOn, String? createdBy
});




}
/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._self, this._then);

  final ExpenseModel _self;
  final $Res Function(ExpenseModel) _then;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? name = null,Object? description = freezed,Object? amount = null,Object? incurredOn = freezed,Object? category = null,Object? source = freezed,Object? sourceRef = freezed,Object? expenditureId = freezed,Object? status = null,Object? createdOn = freezed,Object? createdBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,incurredOn: freezed == incurredOn ? _self.incurredOn : incurredOn // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceRef: freezed == sourceRef ? _self.sourceRef : sourceRef // ignore: cast_nullable_to_non_nullable
as String?,expenditureId: freezed == expenditureId ? _self.expenditureId : expenditureId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseModel].
extension ExpenseModelPatterns on ExpenseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reference,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  String? incurredOn,  String category,  String? source,  String? sourceRef,  String? expenditureId,  int status,  String? createdOn,  String? createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that.id,_that.reference,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.incurredOn,_that.category,_that.source,_that.sourceRef,_that.expenditureId,_that.status,_that.createdOn,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reference,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  String? incurredOn,  String category,  String? source,  String? sourceRef,  String? expenditureId,  int status,  String? createdOn,  String? createdBy)  $default,) {final _that = this;
switch (_that) {
case _ExpenseModel():
return $default(_that.id,_that.reference,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.incurredOn,_that.category,_that.source,_that.sourceRef,_that.expenditureId,_that.status,_that.createdOn,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reference,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  String? incurredOn,  String category,  String? source,  String? sourceRef,  String? expenditureId,  int status,  String? createdOn,  String? createdBy)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that.id,_that.reference,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.incurredOn,_that.category,_that.source,_that.sourceRef,_that.expenditureId,_that.status,_that.createdOn,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseModel extends ExpenseModel {
  const _ExpenseModel({required this.id, required this.reference, this.propertyId, this.propertyName, this.estateId, this.estateName, required this.name, this.description, @JsonKey(fromJson: parseDouble) this.amount = 0, this.incurredOn, required this.category, this.source, this.sourceRef, this.expenditureId, this.status = 0, this.createdOn, this.createdBy}): super._();
  factory _ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);

@override final  String id;
@override final  String reference;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String name;
@override final  String? description;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override final  String? incurredOn;
/// `RECURRING`, `REPAIR`, `REFUND`, `UTILITY`, `OTHER` — the server's own list, which it
/// validates against a pattern. The app offers exactly these and nothing else.
@override final  String category;
/// How it got here. A standing charge generates one; a repair becomes one when it is resolved
/// and costed; somebody typing it in is the third.
@override final  String? source;
@override final  String? sourceRef;
/// The standing charge that raised it, where one did.
@override final  String? expenditureId;
@override@JsonKey() final  int status;
@override final  String? createdOn;
@override final  String? createdBy;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseModelCopyWith<_ExpenseModel> get copyWith => __$ExpenseModelCopyWithImpl<_ExpenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.incurredOn, incurredOn) || other.incurredOn == incurredOn)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceRef, sourceRef) || other.sourceRef == sourceRef)&&(identical(other.expenditureId, expenditureId) || other.expenditureId == expenditureId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,propertyId,propertyName,estateId,estateName,name,description,amount,incurredOn,category,source,sourceRef,expenditureId,status,createdOn,createdBy);

@override
String toString() {
  return 'ExpenseModel(id: $id, reference: $reference, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, name: $name, description: $description, amount: $amount, incurredOn: $incurredOn, category: $category, source: $source, sourceRef: $sourceRef, expenditureId: $expenditureId, status: $status, createdOn: $createdOn, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$ExpenseModelCopyWith<$Res> implements $ExpenseModelCopyWith<$Res> {
  factory _$ExpenseModelCopyWith(_ExpenseModel value, $Res Function(_ExpenseModel) _then) = __$ExpenseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String reference, String? propertyId, String? propertyName, String? estateId, String? estateName, String name, String? description,@JsonKey(fromJson: parseDouble) double amount, String? incurredOn, String category, String? source, String? sourceRef, String? expenditureId, int status, String? createdOn, String? createdBy
});




}
/// @nodoc
class __$ExpenseModelCopyWithImpl<$Res>
    implements _$ExpenseModelCopyWith<$Res> {
  __$ExpenseModelCopyWithImpl(this._self, this._then);

  final _ExpenseModel _self;
  final $Res Function(_ExpenseModel) _then;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? name = null,Object? description = freezed,Object? amount = null,Object? incurredOn = freezed,Object? category = null,Object? source = freezed,Object? sourceRef = freezed,Object? expenditureId = freezed,Object? status = null,Object? createdOn = freezed,Object? createdBy = freezed,}) {
  return _then(_ExpenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,incurredOn: freezed == incurredOn ? _self.incurredOn : incurredOn // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,sourceRef: freezed == sourceRef ? _self.sourceRef : sourceRef // ignore: cast_nullable_to_non_nullable
as String?,expenditureId: freezed == expenditureId ? _self.expenditureId : expenditureId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecurringExpenseModel {

 String get id; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String get name; String? get description;@JsonKey(fromJson: parseDouble) double get amount;/// Which day of the month it is raised on.
 int? get dayOfMonth; int get status; String? get createdOn;
/// Create a copy of RecurringExpenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecurringExpenseModelCopyWith<RecurringExpenseModel> get copyWith => _$RecurringExpenseModelCopyWithImpl<RecurringExpenseModel>(this as RecurringExpenseModel, _$identity);

  /// Serializes this RecurringExpenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecurringExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dayOfMonth, dayOfMonth) || other.dayOfMonth == dayOfMonth)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,propertyId,propertyName,estateId,estateName,name,description,amount,dayOfMonth,status,createdOn);

@override
String toString() {
  return 'RecurringExpenseModel(id: $id, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, name: $name, description: $description, amount: $amount, dayOfMonth: $dayOfMonth, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $RecurringExpenseModelCopyWith<$Res>  {
  factory $RecurringExpenseModelCopyWith(RecurringExpenseModel value, $Res Function(RecurringExpenseModel) _then) = _$RecurringExpenseModelCopyWithImpl;
@useResult
$Res call({
 String id, String? propertyId, String? propertyName, String? estateId, String? estateName, String name, String? description,@JsonKey(fromJson: parseDouble) double amount, int? dayOfMonth, int status, String? createdOn
});




}
/// @nodoc
class _$RecurringExpenseModelCopyWithImpl<$Res>
    implements $RecurringExpenseModelCopyWith<$Res> {
  _$RecurringExpenseModelCopyWithImpl(this._self, this._then);

  final RecurringExpenseModel _self;
  final $Res Function(RecurringExpenseModel) _then;

/// Create a copy of RecurringExpenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? name = null,Object? description = freezed,Object? amount = null,Object? dayOfMonth = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,dayOfMonth: freezed == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecurringExpenseModel].
extension RecurringExpenseModelPatterns on RecurringExpenseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecurringExpenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecurringExpenseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecurringExpenseModel value)  $default,){
final _that = this;
switch (_that) {
case _RecurringExpenseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecurringExpenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecurringExpenseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  int? dayOfMonth,  int status,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecurringExpenseModel() when $default != null:
return $default(_that.id,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.dayOfMonth,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  int? dayOfMonth,  int status,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _RecurringExpenseModel():
return $default(_that.id,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.dayOfMonth,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String name,  String? description, @JsonKey(fromJson: parseDouble)  double amount,  int? dayOfMonth,  int status,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _RecurringExpenseModel() when $default != null:
return $default(_that.id,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.name,_that.description,_that.amount,_that.dayOfMonth,_that.status,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecurringExpenseModel extends RecurringExpenseModel {
  const _RecurringExpenseModel({required this.id, this.propertyId, this.propertyName, this.estateId, this.estateName, required this.name, this.description, @JsonKey(fromJson: parseDouble) this.amount = 0, this.dayOfMonth, this.status = 0, this.createdOn}): super._();
  factory _RecurringExpenseModel.fromJson(Map<String, dynamic> json) => _$RecurringExpenseModelFromJson(json);

@override final  String id;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String name;
@override final  String? description;
@override@JsonKey(fromJson: parseDouble) final  double amount;
/// Which day of the month it is raised on.
@override final  int? dayOfMonth;
@override@JsonKey() final  int status;
@override final  String? createdOn;

/// Create a copy of RecurringExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecurringExpenseModelCopyWith<_RecurringExpenseModel> get copyWith => __$RecurringExpenseModelCopyWithImpl<_RecurringExpenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecurringExpenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecurringExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dayOfMonth, dayOfMonth) || other.dayOfMonth == dayOfMonth)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,propertyId,propertyName,estateId,estateName,name,description,amount,dayOfMonth,status,createdOn);

@override
String toString() {
  return 'RecurringExpenseModel(id: $id, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, name: $name, description: $description, amount: $amount, dayOfMonth: $dayOfMonth, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$RecurringExpenseModelCopyWith<$Res> implements $RecurringExpenseModelCopyWith<$Res> {
  factory _$RecurringExpenseModelCopyWith(_RecurringExpenseModel value, $Res Function(_RecurringExpenseModel) _then) = __$RecurringExpenseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? propertyId, String? propertyName, String? estateId, String? estateName, String name, String? description,@JsonKey(fromJson: parseDouble) double amount, int? dayOfMonth, int status, String? createdOn
});




}
/// @nodoc
class __$RecurringExpenseModelCopyWithImpl<$Res>
    implements _$RecurringExpenseModelCopyWith<$Res> {
  __$RecurringExpenseModelCopyWithImpl(this._self, this._then);

  final _RecurringExpenseModel _self;
  final $Res Function(_RecurringExpenseModel) _then;

/// Create a copy of RecurringExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? name = null,Object? description = freezed,Object? amount = null,Object? dayOfMonth = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_RecurringExpenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,dayOfMonth: freezed == dayOfMonth ? _self.dayOfMonth : dayOfMonth // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
