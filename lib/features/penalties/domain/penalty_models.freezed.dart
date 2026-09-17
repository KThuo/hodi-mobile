// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PenaltyChargeModel {

 String get id; String get reference; String? get ruleName; String? get triggerOn; String? get estateName; String? get propertyName; String? get houseCode;/// What the charge hangs off — an invoice, a vacate notice.
 String? get sourceType; String? get sourceRef; String? get subjectName;/// What the rate was applied to.
@JsonKey(fromJson: parseDouble) double get baseAmount;/// `PERCENT` or `FIXED` — how [rate] should be read.
 String? get basis;@JsonKey(fromJson: parseDouble) double get rate;/// How many times this has happened. A third late month is a different conversation from a
/// first, which is why the server counts rather than leaving it to be inferred.
 int get occurrence;@JsonKey(fromJson: parseDouble) double get amount; String? get periodStart; String? get periodEnd;/// How the figure was arrived at, in the server's words. Shown rather than recomputed — the
/// arithmetic belongs to whoever set the rule.
 String? get calculationNote;/// `PENDING`, `APPLIED`, `WAIVED`, `REVERSED`.
 String get status;/// Still awaiting a decision. Sent rather than derived from [status].
 bool get open; bool get waived; String? get invoiceId; String? get appliedOn; String? get waivedBy; String? get waivedOn; String? get waiverReason; String? get reversedBy; String? get reversedOn; String? get reversalReason; String? get createdOn; String? get createdBy;
/// Create a copy of PenaltyChargeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyChargeModelCopyWith<PenaltyChargeModel> get copyWith => _$PenaltyChargeModelCopyWithImpl<PenaltyChargeModel>(this as PenaltyChargeModel, _$identity);

  /// Serializes this PenaltyChargeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyChargeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.ruleName, ruleName) || other.ruleName == ruleName)&&(identical(other.triggerOn, triggerOn) || other.triggerOn == triggerOn)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.sourceRef, sourceRef) || other.sourceRef == sourceRef)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.baseAmount, baseAmount) || other.baseAmount == baseAmount)&&(identical(other.basis, basis) || other.basis == basis)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.occurrence, occurrence) || other.occurrence == occurrence)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.calculationNote, calculationNote) || other.calculationNote == calculationNote)&&(identical(other.status, status) || other.status == status)&&(identical(other.open, open) || other.open == open)&&(identical(other.waived, waived) || other.waived == waived)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.appliedOn, appliedOn) || other.appliedOn == appliedOn)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waivedOn, waivedOn) || other.waivedOn == waivedOn)&&(identical(other.waiverReason, waiverReason) || other.waiverReason == waiverReason)&&(identical(other.reversedBy, reversedBy) || other.reversedBy == reversedBy)&&(identical(other.reversedOn, reversedOn) || other.reversedOn == reversedOn)&&(identical(other.reversalReason, reversalReason) || other.reversalReason == reversalReason)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,reference,ruleName,triggerOn,estateName,propertyName,houseCode,sourceType,sourceRef,subjectName,baseAmount,basis,rate,occurrence,amount,periodStart,periodEnd,calculationNote,status,open,waived,invoiceId,appliedOn,waivedBy,waivedOn,waiverReason,reversedBy,reversedOn,reversalReason,createdOn,createdBy]);

@override
String toString() {
  return 'PenaltyChargeModel(id: $id, reference: $reference, ruleName: $ruleName, triggerOn: $triggerOn, estateName: $estateName, propertyName: $propertyName, houseCode: $houseCode, sourceType: $sourceType, sourceRef: $sourceRef, subjectName: $subjectName, baseAmount: $baseAmount, basis: $basis, rate: $rate, occurrence: $occurrence, amount: $amount, periodStart: $periodStart, periodEnd: $periodEnd, calculationNote: $calculationNote, status: $status, open: $open, waived: $waived, invoiceId: $invoiceId, appliedOn: $appliedOn, waivedBy: $waivedBy, waivedOn: $waivedOn, waiverReason: $waiverReason, reversedBy: $reversedBy, reversedOn: $reversedOn, reversalReason: $reversalReason, createdOn: $createdOn, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class $PenaltyChargeModelCopyWith<$Res>  {
  factory $PenaltyChargeModelCopyWith(PenaltyChargeModel value, $Res Function(PenaltyChargeModel) _then) = _$PenaltyChargeModelCopyWithImpl;
@useResult
$Res call({
 String id, String reference, String? ruleName, String? triggerOn, String? estateName, String? propertyName, String? houseCode, String? sourceType, String? sourceRef, String? subjectName,@JsonKey(fromJson: parseDouble) double baseAmount, String? basis,@JsonKey(fromJson: parseDouble) double rate, int occurrence,@JsonKey(fromJson: parseDouble) double amount, String? periodStart, String? periodEnd, String? calculationNote, String status, bool open, bool waived, String? invoiceId, String? appliedOn, String? waivedBy, String? waivedOn, String? waiverReason, String? reversedBy, String? reversedOn, String? reversalReason, String? createdOn, String? createdBy
});




}
/// @nodoc
class _$PenaltyChargeModelCopyWithImpl<$Res>
    implements $PenaltyChargeModelCopyWith<$Res> {
  _$PenaltyChargeModelCopyWithImpl(this._self, this._then);

  final PenaltyChargeModel _self;
  final $Res Function(PenaltyChargeModel) _then;

/// Create a copy of PenaltyChargeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? ruleName = freezed,Object? triggerOn = freezed,Object? estateName = freezed,Object? propertyName = freezed,Object? houseCode = freezed,Object? sourceType = freezed,Object? sourceRef = freezed,Object? subjectName = freezed,Object? baseAmount = null,Object? basis = freezed,Object? rate = null,Object? occurrence = null,Object? amount = null,Object? periodStart = freezed,Object? periodEnd = freezed,Object? calculationNote = freezed,Object? status = null,Object? open = null,Object? waived = null,Object? invoiceId = freezed,Object? appliedOn = freezed,Object? waivedBy = freezed,Object? waivedOn = freezed,Object? waiverReason = freezed,Object? reversedBy = freezed,Object? reversedOn = freezed,Object? reversalReason = freezed,Object? createdOn = freezed,Object? createdBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,ruleName: freezed == ruleName ? _self.ruleName : ruleName // ignore: cast_nullable_to_non_nullable
as String?,triggerOn: freezed == triggerOn ? _self.triggerOn : triggerOn // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,sourceRef: freezed == sourceRef ? _self.sourceRef : sourceRef // ignore: cast_nullable_to_non_nullable
as String?,subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,baseAmount: null == baseAmount ? _self.baseAmount : baseAmount // ignore: cast_nullable_to_non_nullable
as double,basis: freezed == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,occurrence: null == occurrence ? _self.occurrence : occurrence // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String?,calculationNote: freezed == calculationNote ? _self.calculationNote : calculationNote // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,waived: null == waived ? _self.waived : waived // ignore: cast_nullable_to_non_nullable
as bool,invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String?,appliedOn: freezed == appliedOn ? _self.appliedOn : appliedOn // ignore: cast_nullable_to_non_nullable
as String?,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waivedOn: freezed == waivedOn ? _self.waivedOn : waivedOn // ignore: cast_nullable_to_non_nullable
as String?,waiverReason: freezed == waiverReason ? _self.waiverReason : waiverReason // ignore: cast_nullable_to_non_nullable
as String?,reversedBy: freezed == reversedBy ? _self.reversedBy : reversedBy // ignore: cast_nullable_to_non_nullable
as String?,reversedOn: freezed == reversedOn ? _self.reversedOn : reversedOn // ignore: cast_nullable_to_non_nullable
as String?,reversalReason: freezed == reversalReason ? _self.reversalReason : reversalReason // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PenaltyChargeModel].
extension PenaltyChargeModelPatterns on PenaltyChargeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenaltyChargeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenaltyChargeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenaltyChargeModel value)  $default,){
final _that = this;
switch (_that) {
case _PenaltyChargeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenaltyChargeModel value)?  $default,){
final _that = this;
switch (_that) {
case _PenaltyChargeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reference,  String? ruleName,  String? triggerOn,  String? estateName,  String? propertyName,  String? houseCode,  String? sourceType,  String? sourceRef,  String? subjectName, @JsonKey(fromJson: parseDouble)  double baseAmount,  String? basis, @JsonKey(fromJson: parseDouble)  double rate,  int occurrence, @JsonKey(fromJson: parseDouble)  double amount,  String? periodStart,  String? periodEnd,  String? calculationNote,  String status,  bool open,  bool waived,  String? invoiceId,  String? appliedOn,  String? waivedBy,  String? waivedOn,  String? waiverReason,  String? reversedBy,  String? reversedOn,  String? reversalReason,  String? createdOn,  String? createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PenaltyChargeModel() when $default != null:
return $default(_that.id,_that.reference,_that.ruleName,_that.triggerOn,_that.estateName,_that.propertyName,_that.houseCode,_that.sourceType,_that.sourceRef,_that.subjectName,_that.baseAmount,_that.basis,_that.rate,_that.occurrence,_that.amount,_that.periodStart,_that.periodEnd,_that.calculationNote,_that.status,_that.open,_that.waived,_that.invoiceId,_that.appliedOn,_that.waivedBy,_that.waivedOn,_that.waiverReason,_that.reversedBy,_that.reversedOn,_that.reversalReason,_that.createdOn,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reference,  String? ruleName,  String? triggerOn,  String? estateName,  String? propertyName,  String? houseCode,  String? sourceType,  String? sourceRef,  String? subjectName, @JsonKey(fromJson: parseDouble)  double baseAmount,  String? basis, @JsonKey(fromJson: parseDouble)  double rate,  int occurrence, @JsonKey(fromJson: parseDouble)  double amount,  String? periodStart,  String? periodEnd,  String? calculationNote,  String status,  bool open,  bool waived,  String? invoiceId,  String? appliedOn,  String? waivedBy,  String? waivedOn,  String? waiverReason,  String? reversedBy,  String? reversedOn,  String? reversalReason,  String? createdOn,  String? createdBy)  $default,) {final _that = this;
switch (_that) {
case _PenaltyChargeModel():
return $default(_that.id,_that.reference,_that.ruleName,_that.triggerOn,_that.estateName,_that.propertyName,_that.houseCode,_that.sourceType,_that.sourceRef,_that.subjectName,_that.baseAmount,_that.basis,_that.rate,_that.occurrence,_that.amount,_that.periodStart,_that.periodEnd,_that.calculationNote,_that.status,_that.open,_that.waived,_that.invoiceId,_that.appliedOn,_that.waivedBy,_that.waivedOn,_that.waiverReason,_that.reversedBy,_that.reversedOn,_that.reversalReason,_that.createdOn,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reference,  String? ruleName,  String? triggerOn,  String? estateName,  String? propertyName,  String? houseCode,  String? sourceType,  String? sourceRef,  String? subjectName, @JsonKey(fromJson: parseDouble)  double baseAmount,  String? basis, @JsonKey(fromJson: parseDouble)  double rate,  int occurrence, @JsonKey(fromJson: parseDouble)  double amount,  String? periodStart,  String? periodEnd,  String? calculationNote,  String status,  bool open,  bool waived,  String? invoiceId,  String? appliedOn,  String? waivedBy,  String? waivedOn,  String? waiverReason,  String? reversedBy,  String? reversedOn,  String? reversalReason,  String? createdOn,  String? createdBy)?  $default,) {final _that = this;
switch (_that) {
case _PenaltyChargeModel() when $default != null:
return $default(_that.id,_that.reference,_that.ruleName,_that.triggerOn,_that.estateName,_that.propertyName,_that.houseCode,_that.sourceType,_that.sourceRef,_that.subjectName,_that.baseAmount,_that.basis,_that.rate,_that.occurrence,_that.amount,_that.periodStart,_that.periodEnd,_that.calculationNote,_that.status,_that.open,_that.waived,_that.invoiceId,_that.appliedOn,_that.waivedBy,_that.waivedOn,_that.waiverReason,_that.reversedBy,_that.reversedOn,_that.reversalReason,_that.createdOn,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PenaltyChargeModel extends PenaltyChargeModel {
  const _PenaltyChargeModel({required this.id, required this.reference, this.ruleName, this.triggerOn, this.estateName, this.propertyName, this.houseCode, this.sourceType, this.sourceRef, this.subjectName, @JsonKey(fromJson: parseDouble) this.baseAmount = 0, this.basis, @JsonKey(fromJson: parseDouble) this.rate = 0, this.occurrence = 1, @JsonKey(fromJson: parseDouble) this.amount = 0, this.periodStart, this.periodEnd, this.calculationNote, required this.status, this.open = false, this.waived = false, this.invoiceId, this.appliedOn, this.waivedBy, this.waivedOn, this.waiverReason, this.reversedBy, this.reversedOn, this.reversalReason, this.createdOn, this.createdBy}): super._();
  factory _PenaltyChargeModel.fromJson(Map<String, dynamic> json) => _$PenaltyChargeModelFromJson(json);

@override final  String id;
@override final  String reference;
@override final  String? ruleName;
@override final  String? triggerOn;
@override final  String? estateName;
@override final  String? propertyName;
@override final  String? houseCode;
/// What the charge hangs off — an invoice, a vacate notice.
@override final  String? sourceType;
@override final  String? sourceRef;
@override final  String? subjectName;
/// What the rate was applied to.
@override@JsonKey(fromJson: parseDouble) final  double baseAmount;
/// `PERCENT` or `FIXED` — how [rate] should be read.
@override final  String? basis;
@override@JsonKey(fromJson: parseDouble) final  double rate;
/// How many times this has happened. A third late month is a different conversation from a
/// first, which is why the server counts rather than leaving it to be inferred.
@override@JsonKey() final  int occurrence;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override final  String? periodStart;
@override final  String? periodEnd;
/// How the figure was arrived at, in the server's words. Shown rather than recomputed — the
/// arithmetic belongs to whoever set the rule.
@override final  String? calculationNote;
/// `PENDING`, `APPLIED`, `WAIVED`, `REVERSED`.
@override final  String status;
/// Still awaiting a decision. Sent rather than derived from [status].
@override@JsonKey() final  bool open;
@override@JsonKey() final  bool waived;
@override final  String? invoiceId;
@override final  String? appliedOn;
@override final  String? waivedBy;
@override final  String? waivedOn;
@override final  String? waiverReason;
@override final  String? reversedBy;
@override final  String? reversedOn;
@override final  String? reversalReason;
@override final  String? createdOn;
@override final  String? createdBy;

/// Create a copy of PenaltyChargeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyChargeModelCopyWith<_PenaltyChargeModel> get copyWith => __$PenaltyChargeModelCopyWithImpl<_PenaltyChargeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PenaltyChargeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenaltyChargeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.ruleName, ruleName) || other.ruleName == ruleName)&&(identical(other.triggerOn, triggerOn) || other.triggerOn == triggerOn)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.sourceRef, sourceRef) || other.sourceRef == sourceRef)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.baseAmount, baseAmount) || other.baseAmount == baseAmount)&&(identical(other.basis, basis) || other.basis == basis)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.occurrence, occurrence) || other.occurrence == occurrence)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.calculationNote, calculationNote) || other.calculationNote == calculationNote)&&(identical(other.status, status) || other.status == status)&&(identical(other.open, open) || other.open == open)&&(identical(other.waived, waived) || other.waived == waived)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.appliedOn, appliedOn) || other.appliedOn == appliedOn)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waivedOn, waivedOn) || other.waivedOn == waivedOn)&&(identical(other.waiverReason, waiverReason) || other.waiverReason == waiverReason)&&(identical(other.reversedBy, reversedBy) || other.reversedBy == reversedBy)&&(identical(other.reversedOn, reversedOn) || other.reversedOn == reversedOn)&&(identical(other.reversalReason, reversalReason) || other.reversalReason == reversalReason)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,reference,ruleName,triggerOn,estateName,propertyName,houseCode,sourceType,sourceRef,subjectName,baseAmount,basis,rate,occurrence,amount,periodStart,periodEnd,calculationNote,status,open,waived,invoiceId,appliedOn,waivedBy,waivedOn,waiverReason,reversedBy,reversedOn,reversalReason,createdOn,createdBy]);

@override
String toString() {
  return 'PenaltyChargeModel(id: $id, reference: $reference, ruleName: $ruleName, triggerOn: $triggerOn, estateName: $estateName, propertyName: $propertyName, houseCode: $houseCode, sourceType: $sourceType, sourceRef: $sourceRef, subjectName: $subjectName, baseAmount: $baseAmount, basis: $basis, rate: $rate, occurrence: $occurrence, amount: $amount, periodStart: $periodStart, periodEnd: $periodEnd, calculationNote: $calculationNote, status: $status, open: $open, waived: $waived, invoiceId: $invoiceId, appliedOn: $appliedOn, waivedBy: $waivedBy, waivedOn: $waivedOn, waiverReason: $waiverReason, reversedBy: $reversedBy, reversedOn: $reversedOn, reversalReason: $reversalReason, createdOn: $createdOn, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$PenaltyChargeModelCopyWith<$Res> implements $PenaltyChargeModelCopyWith<$Res> {
  factory _$PenaltyChargeModelCopyWith(_PenaltyChargeModel value, $Res Function(_PenaltyChargeModel) _then) = __$PenaltyChargeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String reference, String? ruleName, String? triggerOn, String? estateName, String? propertyName, String? houseCode, String? sourceType, String? sourceRef, String? subjectName,@JsonKey(fromJson: parseDouble) double baseAmount, String? basis,@JsonKey(fromJson: parseDouble) double rate, int occurrence,@JsonKey(fromJson: parseDouble) double amount, String? periodStart, String? periodEnd, String? calculationNote, String status, bool open, bool waived, String? invoiceId, String? appliedOn, String? waivedBy, String? waivedOn, String? waiverReason, String? reversedBy, String? reversedOn, String? reversalReason, String? createdOn, String? createdBy
});




}
/// @nodoc
class __$PenaltyChargeModelCopyWithImpl<$Res>
    implements _$PenaltyChargeModelCopyWith<$Res> {
  __$PenaltyChargeModelCopyWithImpl(this._self, this._then);

  final _PenaltyChargeModel _self;
  final $Res Function(_PenaltyChargeModel) _then;

/// Create a copy of PenaltyChargeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? ruleName = freezed,Object? triggerOn = freezed,Object? estateName = freezed,Object? propertyName = freezed,Object? houseCode = freezed,Object? sourceType = freezed,Object? sourceRef = freezed,Object? subjectName = freezed,Object? baseAmount = null,Object? basis = freezed,Object? rate = null,Object? occurrence = null,Object? amount = null,Object? periodStart = freezed,Object? periodEnd = freezed,Object? calculationNote = freezed,Object? status = null,Object? open = null,Object? waived = null,Object? invoiceId = freezed,Object? appliedOn = freezed,Object? waivedBy = freezed,Object? waivedOn = freezed,Object? waiverReason = freezed,Object? reversedBy = freezed,Object? reversedOn = freezed,Object? reversalReason = freezed,Object? createdOn = freezed,Object? createdBy = freezed,}) {
  return _then(_PenaltyChargeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,ruleName: freezed == ruleName ? _self.ruleName : ruleName // ignore: cast_nullable_to_non_nullable
as String?,triggerOn: freezed == triggerOn ? _self.triggerOn : triggerOn // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,sourceRef: freezed == sourceRef ? _self.sourceRef : sourceRef // ignore: cast_nullable_to_non_nullable
as String?,subjectName: freezed == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String?,baseAmount: null == baseAmount ? _self.baseAmount : baseAmount // ignore: cast_nullable_to_non_nullable
as double,basis: freezed == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,occurrence: null == occurrence ? _self.occurrence : occurrence // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String?,calculationNote: freezed == calculationNote ? _self.calculationNote : calculationNote // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,waived: null == waived ? _self.waived : waived // ignore: cast_nullable_to_non_nullable
as bool,invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String?,appliedOn: freezed == appliedOn ? _self.appliedOn : appliedOn // ignore: cast_nullable_to_non_nullable
as String?,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waivedOn: freezed == waivedOn ? _self.waivedOn : waivedOn // ignore: cast_nullable_to_non_nullable
as String?,waiverReason: freezed == waiverReason ? _self.waiverReason : waiverReason // ignore: cast_nullable_to_non_nullable
as String?,reversedBy: freezed == reversedBy ? _self.reversedBy : reversedBy // ignore: cast_nullable_to_non_nullable
as String?,reversedOn: freezed == reversedOn ? _self.reversedOn : reversedOn // ignore: cast_nullable_to_non_nullable
as String?,reversalReason: freezed == reversalReason ? _self.reversalReason : reversalReason // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
