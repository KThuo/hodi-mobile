// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaseModel {

 String get id; String get tenantName; String? get tenantPhone; String get houseCode; String? get houseLabel; String? get propertyName; String? get estateName; String? get tenure;@JsonKey(fromJson: parseDouble) double get rent; int? get dueDay; String? get occupiedOn; String? get expiresOn;/// Negative means the term has already passed, which is a normal state for a periodic tenancy
/// that ran past its first term — not an error, and not a reason to hide the row.
 int? get daysToExpiry; int? get noticeDays; int get documents;/// The server's own word for where this agreement stands.
 String? get term;
/// Create a copy of LeaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseModelCopyWith<LeaseModel> get copyWith => _$LeaseModelCopyWithImpl<LeaseModel>(this as LeaseModel, _$identity);

  /// Serializes this LeaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.documents, documents) || other.documents == documents)&&(identical(other.term, term) || other.term == term));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantName,tenantPhone,houseCode,houseLabel,propertyName,estateName,tenure,rent,dueDay,occupiedOn,expiresOn,daysToExpiry,noticeDays,documents,term);

@override
String toString() {
  return 'LeaseModel(id: $id, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, tenure: $tenure, rent: $rent, dueDay: $dueDay, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, documents: $documents, term: $term)';
}


}

/// @nodoc
abstract mixin class $LeaseModelCopyWith<$Res>  {
  factory $LeaseModelCopyWith(LeaseModel value, $Res Function(LeaseModel) _then) = _$LeaseModelCopyWithImpl;
@useResult
$Res call({
 String id, String tenantName, String? tenantPhone, String houseCode, String? houseLabel, String? propertyName, String? estateName, String? tenure,@JsonKey(fromJson: parseDouble) double rent, int? dueDay, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, int documents, String? term
});




}
/// @nodoc
class _$LeaseModelCopyWithImpl<$Res>
    implements $LeaseModelCopyWith<$Res> {
  _$LeaseModelCopyWithImpl(this._self, this._then);

  final LeaseModel _self;
  final $Res Function(LeaseModel) _then;

/// Create a copy of LeaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? tenure = freezed,Object? rent = null,Object? dueDay = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? documents = null,Object? term = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as int,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseModel].
extension LeaseModelPatterns on LeaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int documents,  String? term)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseModel() when $default != null:
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.documents,_that.term);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int documents,  String? term)  $default,) {final _that = this;
switch (_that) {
case _LeaseModel():
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.documents,_that.term);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int documents,  String? term)?  $default,) {final _that = this;
switch (_that) {
case _LeaseModel() when $default != null:
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.documents,_that.term);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaseModel extends LeaseModel {
  const _LeaseModel({required this.id, required this.tenantName, this.tenantPhone, required this.houseCode, this.houseLabel, this.propertyName, this.estateName, this.tenure, @JsonKey(fromJson: parseDouble) this.rent = 0, this.dueDay, this.occupiedOn, this.expiresOn, this.daysToExpiry, this.noticeDays, this.documents = 0, this.term}): super._();
  factory _LeaseModel.fromJson(Map<String, dynamic> json) => _$LeaseModelFromJson(json);

@override final  String id;
@override final  String tenantName;
@override final  String? tenantPhone;
@override final  String houseCode;
@override final  String? houseLabel;
@override final  String? propertyName;
@override final  String? estateName;
@override final  String? tenure;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override final  int? dueDay;
@override final  String? occupiedOn;
@override final  String? expiresOn;
/// Negative means the term has already passed, which is a normal state for a periodic tenancy
/// that ran past its first term — not an error, and not a reason to hide the row.
@override final  int? daysToExpiry;
@override final  int? noticeDays;
@override@JsonKey() final  int documents;
/// The server's own word for where this agreement stands.
@override final  String? term;

/// Create a copy of LeaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseModelCopyWith<_LeaseModel> get copyWith => __$LeaseModelCopyWithImpl<_LeaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.documents, documents) || other.documents == documents)&&(identical(other.term, term) || other.term == term));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantName,tenantPhone,houseCode,houseLabel,propertyName,estateName,tenure,rent,dueDay,occupiedOn,expiresOn,daysToExpiry,noticeDays,documents,term);

@override
String toString() {
  return 'LeaseModel(id: $id, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, tenure: $tenure, rent: $rent, dueDay: $dueDay, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, documents: $documents, term: $term)';
}


}

/// @nodoc
abstract mixin class _$LeaseModelCopyWith<$Res> implements $LeaseModelCopyWith<$Res> {
  factory _$LeaseModelCopyWith(_LeaseModel value, $Res Function(_LeaseModel) _then) = __$LeaseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tenantName, String? tenantPhone, String houseCode, String? houseLabel, String? propertyName, String? estateName, String? tenure,@JsonKey(fromJson: parseDouble) double rent, int? dueDay, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, int documents, String? term
});




}
/// @nodoc
class __$LeaseModelCopyWithImpl<$Res>
    implements _$LeaseModelCopyWith<$Res> {
  __$LeaseModelCopyWithImpl(this._self, this._then);

  final _LeaseModel _self;
  final $Res Function(_LeaseModel) _then;

/// Create a copy of LeaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? tenure = freezed,Object? rent = null,Object? dueDay = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? documents = null,Object? term = freezed,}) {
  return _then(_LeaseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as int,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LeaseDetailModel {

 String get id; String get tenantName; String? get tenantPhone; String get houseCode; String? get houseLabel; String? get houseId; String? get propertyId; String? get propertyName; String? get estateName; String? get tenure;@JsonKey(fromJson: parseDouble) double get rent;@JsonKey(fromJson: parseDouble) double get deposit;@JsonKey(fromJson: parseDouble) double get refundableDeposit; int? get dueDay; String? get occupiedOn; String? get expiresOn; int? get daysToExpiry; int? get noticeDays; String? get specialConditions; String? get term;/// Whether the tenant may see this agreement at all. A property setting, decided by whoever
/// runs it — so the app asks rather than assuming, and the tenant's own read is a separate
/// path that honours it.
 bool get tenantCanView;/// Whether the generated agreement applies to this tenancy. An owned unit may be excluded,
/// which is a per-property lease setting rather than a missing document.
 bool get agreementApplies; List<LeaseDocumentModel> get documents; List<LeaseTermChangeModel> get history;
/// Create a copy of LeaseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseDetailModelCopyWith<LeaseDetailModel> get copyWith => _$LeaseDetailModelCopyWithImpl<LeaseDetailModel>(this as LeaseDetailModel, _$identity);

  /// Serializes this LeaseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.specialConditions, specialConditions) || other.specialConditions == specialConditions)&&(identical(other.term, term) || other.term == term)&&(identical(other.tenantCanView, tenantCanView) || other.tenantCanView == tenantCanView)&&(identical(other.agreementApplies, agreementApplies) || other.agreementApplies == agreementApplies)&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantName,tenantPhone,houseCode,houseLabel,houseId,propertyId,propertyName,estateName,tenure,rent,deposit,refundableDeposit,dueDay,occupiedOn,expiresOn,daysToExpiry,noticeDays,specialConditions,term,tenantCanView,agreementApplies,const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(history)]);

@override
String toString() {
  return 'LeaseDetailModel(id: $id, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseLabel: $houseLabel, houseId: $houseId, propertyId: $propertyId, propertyName: $propertyName, estateName: $estateName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, dueDay: $dueDay, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, specialConditions: $specialConditions, term: $term, tenantCanView: $tenantCanView, agreementApplies: $agreementApplies, documents: $documents, history: $history)';
}


}

/// @nodoc
abstract mixin class $LeaseDetailModelCopyWith<$Res>  {
  factory $LeaseDetailModelCopyWith(LeaseDetailModel value, $Res Function(LeaseDetailModel) _then) = _$LeaseDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String tenantName, String? tenantPhone, String houseCode, String? houseLabel, String? houseId, String? propertyId, String? propertyName, String? estateName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit, int? dueDay, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, String? specialConditions, String? term, bool tenantCanView, bool agreementApplies, List<LeaseDocumentModel> documents, List<LeaseTermChangeModel> history
});




}
/// @nodoc
class _$LeaseDetailModelCopyWithImpl<$Res>
    implements $LeaseDetailModelCopyWith<$Res> {
  _$LeaseDetailModelCopyWithImpl(this._self, this._then);

  final LeaseDetailModel _self;
  final $Res Function(LeaseDetailModel) _then;

/// Create a copy of LeaseDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? houseId = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? dueDay = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? specialConditions = freezed,Object? term = freezed,Object? tenantCanView = null,Object? agreementApplies = null,Object? documents = null,Object? history = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,specialConditions: freezed == specialConditions ? _self.specialConditions : specialConditions // ignore: cast_nullable_to_non_nullable
as String?,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,tenantCanView: null == tenantCanView ? _self.tenantCanView : tenantCanView // ignore: cast_nullable_to_non_nullable
as bool,agreementApplies: null == agreementApplies ? _self.agreementApplies : agreementApplies // ignore: cast_nullable_to_non_nullable
as bool,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<LeaseDocumentModel>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<LeaseTermChangeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseDetailModel].
extension LeaseDetailModelPatterns on LeaseDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaseDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? houseId,  String? propertyId,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  String? specialConditions,  String? term,  bool tenantCanView,  bool agreementApplies,  List<LeaseDocumentModel> documents,  List<LeaseTermChangeModel> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseDetailModel() when $default != null:
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.houseId,_that.propertyId,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.specialConditions,_that.term,_that.tenantCanView,_that.agreementApplies,_that.documents,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? houseId,  String? propertyId,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  String? specialConditions,  String? term,  bool tenantCanView,  bool agreementApplies,  List<LeaseDocumentModel> documents,  List<LeaseTermChangeModel> history)  $default,) {final _that = this;
switch (_that) {
case _LeaseDetailModel():
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.houseId,_that.propertyId,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.specialConditions,_that.term,_that.tenantCanView,_that.agreementApplies,_that.documents,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tenantName,  String? tenantPhone,  String houseCode,  String? houseLabel,  String? houseId,  String? propertyId,  String? propertyName,  String? estateName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  int? dueDay,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  String? specialConditions,  String? term,  bool tenantCanView,  bool agreementApplies,  List<LeaseDocumentModel> documents,  List<LeaseTermChangeModel> history)?  $default,) {final _that = this;
switch (_that) {
case _LeaseDetailModel() when $default != null:
return $default(_that.id,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseLabel,_that.houseId,_that.propertyId,_that.propertyName,_that.estateName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.dueDay,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.specialConditions,_that.term,_that.tenantCanView,_that.agreementApplies,_that.documents,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaseDetailModel extends LeaseDetailModel {
  const _LeaseDetailModel({required this.id, required this.tenantName, this.tenantPhone, required this.houseCode, this.houseLabel, this.houseId, this.propertyId, this.propertyName, this.estateName, this.tenure, @JsonKey(fromJson: parseDouble) this.rent = 0, @JsonKey(fromJson: parseDouble) this.deposit = 0, @JsonKey(fromJson: parseDouble) this.refundableDeposit = 0, this.dueDay, this.occupiedOn, this.expiresOn, this.daysToExpiry, this.noticeDays, this.specialConditions, this.term, this.tenantCanView = false, this.agreementApplies = false, final  List<LeaseDocumentModel> documents = const <LeaseDocumentModel>[], final  List<LeaseTermChangeModel> history = const <LeaseTermChangeModel>[]}): _documents = documents,_history = history,super._();
  factory _LeaseDetailModel.fromJson(Map<String, dynamic> json) => _$LeaseDetailModelFromJson(json);

@override final  String id;
@override final  String tenantName;
@override final  String? tenantPhone;
@override final  String houseCode;
@override final  String? houseLabel;
@override final  String? houseId;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateName;
@override final  String? tenure;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override@JsonKey(fromJson: parseDouble) final  double deposit;
@override@JsonKey(fromJson: parseDouble) final  double refundableDeposit;
@override final  int? dueDay;
@override final  String? occupiedOn;
@override final  String? expiresOn;
@override final  int? daysToExpiry;
@override final  int? noticeDays;
@override final  String? specialConditions;
@override final  String? term;
/// Whether the tenant may see this agreement at all. A property setting, decided by whoever
/// runs it — so the app asks rather than assuming, and the tenant's own read is a separate
/// path that honours it.
@override@JsonKey() final  bool tenantCanView;
/// Whether the generated agreement applies to this tenancy. An owned unit may be excluded,
/// which is a per-property lease setting rather than a missing document.
@override@JsonKey() final  bool agreementApplies;
 final  List<LeaseDocumentModel> _documents;
@override@JsonKey() List<LeaseDocumentModel> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  List<LeaseTermChangeModel> _history;
@override@JsonKey() List<LeaseTermChangeModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of LeaseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseDetailModelCopyWith<_LeaseDetailModel> get copyWith => __$LeaseDetailModelCopyWithImpl<_LeaseDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.specialConditions, specialConditions) || other.specialConditions == specialConditions)&&(identical(other.term, term) || other.term == term)&&(identical(other.tenantCanView, tenantCanView) || other.tenantCanView == tenantCanView)&&(identical(other.agreementApplies, agreementApplies) || other.agreementApplies == agreementApplies)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantName,tenantPhone,houseCode,houseLabel,houseId,propertyId,propertyName,estateName,tenure,rent,deposit,refundableDeposit,dueDay,occupiedOn,expiresOn,daysToExpiry,noticeDays,specialConditions,term,tenantCanView,agreementApplies,const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_history)]);

@override
String toString() {
  return 'LeaseDetailModel(id: $id, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseLabel: $houseLabel, houseId: $houseId, propertyId: $propertyId, propertyName: $propertyName, estateName: $estateName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, dueDay: $dueDay, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, specialConditions: $specialConditions, term: $term, tenantCanView: $tenantCanView, agreementApplies: $agreementApplies, documents: $documents, history: $history)';
}


}

/// @nodoc
abstract mixin class _$LeaseDetailModelCopyWith<$Res> implements $LeaseDetailModelCopyWith<$Res> {
  factory _$LeaseDetailModelCopyWith(_LeaseDetailModel value, $Res Function(_LeaseDetailModel) _then) = __$LeaseDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tenantName, String? tenantPhone, String houseCode, String? houseLabel, String? houseId, String? propertyId, String? propertyName, String? estateName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit, int? dueDay, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, String? specialConditions, String? term, bool tenantCanView, bool agreementApplies, List<LeaseDocumentModel> documents, List<LeaseTermChangeModel> history
});




}
/// @nodoc
class __$LeaseDetailModelCopyWithImpl<$Res>
    implements _$LeaseDetailModelCopyWith<$Res> {
  __$LeaseDetailModelCopyWithImpl(this._self, this._then);

  final _LeaseDetailModel _self;
  final $Res Function(_LeaseDetailModel) _then;

/// Create a copy of LeaseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? houseId = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? dueDay = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? specialConditions = freezed,Object? term = freezed,Object? tenantCanView = null,Object? agreementApplies = null,Object? documents = null,Object? history = null,}) {
  return _then(_LeaseDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,specialConditions: freezed == specialConditions ? _self.specialConditions : specialConditions // ignore: cast_nullable_to_non_nullable
as String?,term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,tenantCanView: null == tenantCanView ? _self.tenantCanView : tenantCanView // ignore: cast_nullable_to_non_nullable
as bool,agreementApplies: null == agreementApplies ? _self.agreementApplies : agreementApplies // ignore: cast_nullable_to_non_nullable
as bool,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<LeaseDocumentModel>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<LeaseTermChangeModel>,
  ));
}


}


/// @nodoc
mixin _$LeaseDocumentModel {

 String get id; String? get kind; String? get title; String? get fileName; String? get contentType;@JsonKey(fromJson: parseIntOrZero) int get byteSize;/// Replaced by a later version. Kept, because an agreement's history is the point of keeping
/// documents at all — shown, but marked.
 bool get superseded; String? get uploadedOn; String? get uploadedBy;
/// Create a copy of LeaseDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseDocumentModelCopyWith<LeaseDocumentModel> get copyWith => _$LeaseDocumentModelCopyWithImpl<LeaseDocumentModel>(this as LeaseDocumentModel, _$identity);

  /// Serializes this LeaseDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.superseded, superseded) || other.superseded == superseded)&&(identical(other.uploadedOn, uploadedOn) || other.uploadedOn == uploadedOn)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,fileName,contentType,byteSize,superseded,uploadedOn,uploadedBy);

@override
String toString() {
  return 'LeaseDocumentModel(id: $id, kind: $kind, title: $title, fileName: $fileName, contentType: $contentType, byteSize: $byteSize, superseded: $superseded, uploadedOn: $uploadedOn, uploadedBy: $uploadedBy)';
}


}

/// @nodoc
abstract mixin class $LeaseDocumentModelCopyWith<$Res>  {
  factory $LeaseDocumentModelCopyWith(LeaseDocumentModel value, $Res Function(LeaseDocumentModel) _then) = _$LeaseDocumentModelCopyWithImpl;
@useResult
$Res call({
 String id, String? kind, String? title, String? fileName, String? contentType,@JsonKey(fromJson: parseIntOrZero) int byteSize, bool superseded, String? uploadedOn, String? uploadedBy
});




}
/// @nodoc
class _$LeaseDocumentModelCopyWithImpl<$Res>
    implements $LeaseDocumentModelCopyWith<$Res> {
  _$LeaseDocumentModelCopyWithImpl(this._self, this._then);

  final LeaseDocumentModel _self;
  final $Res Function(LeaseDocumentModel) _then;

/// Create a copy of LeaseDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = freezed,Object? title = freezed,Object? fileName = freezed,Object? contentType = freezed,Object? byteSize = null,Object? superseded = null,Object? uploadedOn = freezed,Object? uploadedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,superseded: null == superseded ? _self.superseded : superseded // ignore: cast_nullable_to_non_nullable
as bool,uploadedOn: freezed == uploadedOn ? _self.uploadedOn : uploadedOn // ignore: cast_nullable_to_non_nullable
as String?,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseDocumentModel].
extension LeaseDocumentModelPatterns on LeaseDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaseDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? kind,  String? title,  String? fileName,  String? contentType, @JsonKey(fromJson: parseIntOrZero)  int byteSize,  bool superseded,  String? uploadedOn,  String? uploadedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseDocumentModel() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.fileName,_that.contentType,_that.byteSize,_that.superseded,_that.uploadedOn,_that.uploadedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? kind,  String? title,  String? fileName,  String? contentType, @JsonKey(fromJson: parseIntOrZero)  int byteSize,  bool superseded,  String? uploadedOn,  String? uploadedBy)  $default,) {final _that = this;
switch (_that) {
case _LeaseDocumentModel():
return $default(_that.id,_that.kind,_that.title,_that.fileName,_that.contentType,_that.byteSize,_that.superseded,_that.uploadedOn,_that.uploadedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? kind,  String? title,  String? fileName,  String? contentType, @JsonKey(fromJson: parseIntOrZero)  int byteSize,  bool superseded,  String? uploadedOn,  String? uploadedBy)?  $default,) {final _that = this;
switch (_that) {
case _LeaseDocumentModel() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.fileName,_that.contentType,_that.byteSize,_that.superseded,_that.uploadedOn,_that.uploadedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaseDocumentModel extends LeaseDocumentModel {
  const _LeaseDocumentModel({required this.id, this.kind, this.title, this.fileName, this.contentType, @JsonKey(fromJson: parseIntOrZero) this.byteSize = 0, this.superseded = false, this.uploadedOn, this.uploadedBy}): super._();
  factory _LeaseDocumentModel.fromJson(Map<String, dynamic> json) => _$LeaseDocumentModelFromJson(json);

@override final  String id;
@override final  String? kind;
@override final  String? title;
@override final  String? fileName;
@override final  String? contentType;
@override@JsonKey(fromJson: parseIntOrZero) final  int byteSize;
/// Replaced by a later version. Kept, because an agreement's history is the point of keeping
/// documents at all — shown, but marked.
@override@JsonKey() final  bool superseded;
@override final  String? uploadedOn;
@override final  String? uploadedBy;

/// Create a copy of LeaseDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseDocumentModelCopyWith<_LeaseDocumentModel> get copyWith => __$LeaseDocumentModelCopyWithImpl<_LeaseDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.superseded, superseded) || other.superseded == superseded)&&(identical(other.uploadedOn, uploadedOn) || other.uploadedOn == uploadedOn)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,fileName,contentType,byteSize,superseded,uploadedOn,uploadedBy);

@override
String toString() {
  return 'LeaseDocumentModel(id: $id, kind: $kind, title: $title, fileName: $fileName, contentType: $contentType, byteSize: $byteSize, superseded: $superseded, uploadedOn: $uploadedOn, uploadedBy: $uploadedBy)';
}


}

/// @nodoc
abstract mixin class _$LeaseDocumentModelCopyWith<$Res> implements $LeaseDocumentModelCopyWith<$Res> {
  factory _$LeaseDocumentModelCopyWith(_LeaseDocumentModel value, $Res Function(_LeaseDocumentModel) _then) = __$LeaseDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? kind, String? title, String? fileName, String? contentType,@JsonKey(fromJson: parseIntOrZero) int byteSize, bool superseded, String? uploadedOn, String? uploadedBy
});




}
/// @nodoc
class __$LeaseDocumentModelCopyWithImpl<$Res>
    implements _$LeaseDocumentModelCopyWith<$Res> {
  __$LeaseDocumentModelCopyWithImpl(this._self, this._then);

  final _LeaseDocumentModel _self;
  final $Res Function(_LeaseDocumentModel) _then;

/// Create a copy of LeaseDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = freezed,Object? title = freezed,Object? fileName = freezed,Object? contentType = freezed,Object? byteSize = null,Object? superseded = null,Object? uploadedOn = freezed,Object? uploadedBy = freezed,}) {
  return _then(_LeaseDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,superseded: null == superseded ? _self.superseded : superseded // ignore: cast_nullable_to_non_nullable
as bool,uploadedOn: freezed == uploadedOn ? _self.uploadedOn : uploadedOn // ignore: cast_nullable_to_non_nullable
as String?,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LeaseTermChangeModel {

 String get id; String? get changeType; String? get effectiveOn;@JsonKey(fromJson: parseDoubleNullable) double? get rentBefore;@JsonKey(fromJson: parseDoubleNullable) double? get rentAfter; int? get dueDayBefore; int? get dueDayAfter; String? get expiresBefore; String? get expiresAfter; String? get reason; String? get recordedOn; String? get recordedBy;
/// Create a copy of LeaseTermChangeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseTermChangeModelCopyWith<LeaseTermChangeModel> get copyWith => _$LeaseTermChangeModelCopyWithImpl<LeaseTermChangeModel>(this as LeaseTermChangeModel, _$identity);

  /// Serializes this LeaseTermChangeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseTermChangeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.effectiveOn, effectiveOn) || other.effectiveOn == effectiveOn)&&(identical(other.rentBefore, rentBefore) || other.rentBefore == rentBefore)&&(identical(other.rentAfter, rentAfter) || other.rentAfter == rentAfter)&&(identical(other.dueDayBefore, dueDayBefore) || other.dueDayBefore == dueDayBefore)&&(identical(other.dueDayAfter, dueDayAfter) || other.dueDayAfter == dueDayAfter)&&(identical(other.expiresBefore, expiresBefore) || other.expiresBefore == expiresBefore)&&(identical(other.expiresAfter, expiresAfter) || other.expiresAfter == expiresAfter)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.recordedOn, recordedOn) || other.recordedOn == recordedOn)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,changeType,effectiveOn,rentBefore,rentAfter,dueDayBefore,dueDayAfter,expiresBefore,expiresAfter,reason,recordedOn,recordedBy);

@override
String toString() {
  return 'LeaseTermChangeModel(id: $id, changeType: $changeType, effectiveOn: $effectiveOn, rentBefore: $rentBefore, rentAfter: $rentAfter, dueDayBefore: $dueDayBefore, dueDayAfter: $dueDayAfter, expiresBefore: $expiresBefore, expiresAfter: $expiresAfter, reason: $reason, recordedOn: $recordedOn, recordedBy: $recordedBy)';
}


}

/// @nodoc
abstract mixin class $LeaseTermChangeModelCopyWith<$Res>  {
  factory $LeaseTermChangeModelCopyWith(LeaseTermChangeModel value, $Res Function(LeaseTermChangeModel) _then) = _$LeaseTermChangeModelCopyWithImpl;
@useResult
$Res call({
 String id, String? changeType, String? effectiveOn,@JsonKey(fromJson: parseDoubleNullable) double? rentBefore,@JsonKey(fromJson: parseDoubleNullable) double? rentAfter, int? dueDayBefore, int? dueDayAfter, String? expiresBefore, String? expiresAfter, String? reason, String? recordedOn, String? recordedBy
});




}
/// @nodoc
class _$LeaseTermChangeModelCopyWithImpl<$Res>
    implements $LeaseTermChangeModelCopyWith<$Res> {
  _$LeaseTermChangeModelCopyWithImpl(this._self, this._then);

  final LeaseTermChangeModel _self;
  final $Res Function(LeaseTermChangeModel) _then;

/// Create a copy of LeaseTermChangeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? changeType = freezed,Object? effectiveOn = freezed,Object? rentBefore = freezed,Object? rentAfter = freezed,Object? dueDayBefore = freezed,Object? dueDayAfter = freezed,Object? expiresBefore = freezed,Object? expiresAfter = freezed,Object? reason = freezed,Object? recordedOn = freezed,Object? recordedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,changeType: freezed == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String?,effectiveOn: freezed == effectiveOn ? _self.effectiveOn : effectiveOn // ignore: cast_nullable_to_non_nullable
as String?,rentBefore: freezed == rentBefore ? _self.rentBefore : rentBefore // ignore: cast_nullable_to_non_nullable
as double?,rentAfter: freezed == rentAfter ? _self.rentAfter : rentAfter // ignore: cast_nullable_to_non_nullable
as double?,dueDayBefore: freezed == dueDayBefore ? _self.dueDayBefore : dueDayBefore // ignore: cast_nullable_to_non_nullable
as int?,dueDayAfter: freezed == dueDayAfter ? _self.dueDayAfter : dueDayAfter // ignore: cast_nullable_to_non_nullable
as int?,expiresBefore: freezed == expiresBefore ? _self.expiresBefore : expiresBefore // ignore: cast_nullable_to_non_nullable
as String?,expiresAfter: freezed == expiresAfter ? _self.expiresAfter : expiresAfter // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,recordedOn: freezed == recordedOn ? _self.recordedOn : recordedOn // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseTermChangeModel].
extension LeaseTermChangeModelPatterns on LeaseTermChangeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseTermChangeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseTermChangeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseTermChangeModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaseTermChangeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseTermChangeModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseTermChangeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? changeType,  String? effectiveOn, @JsonKey(fromJson: parseDoubleNullable)  double? rentBefore, @JsonKey(fromJson: parseDoubleNullable)  double? rentAfter,  int? dueDayBefore,  int? dueDayAfter,  String? expiresBefore,  String? expiresAfter,  String? reason,  String? recordedOn,  String? recordedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseTermChangeModel() when $default != null:
return $default(_that.id,_that.changeType,_that.effectiveOn,_that.rentBefore,_that.rentAfter,_that.dueDayBefore,_that.dueDayAfter,_that.expiresBefore,_that.expiresAfter,_that.reason,_that.recordedOn,_that.recordedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? changeType,  String? effectiveOn, @JsonKey(fromJson: parseDoubleNullable)  double? rentBefore, @JsonKey(fromJson: parseDoubleNullable)  double? rentAfter,  int? dueDayBefore,  int? dueDayAfter,  String? expiresBefore,  String? expiresAfter,  String? reason,  String? recordedOn,  String? recordedBy)  $default,) {final _that = this;
switch (_that) {
case _LeaseTermChangeModel():
return $default(_that.id,_that.changeType,_that.effectiveOn,_that.rentBefore,_that.rentAfter,_that.dueDayBefore,_that.dueDayAfter,_that.expiresBefore,_that.expiresAfter,_that.reason,_that.recordedOn,_that.recordedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? changeType,  String? effectiveOn, @JsonKey(fromJson: parseDoubleNullable)  double? rentBefore, @JsonKey(fromJson: parseDoubleNullable)  double? rentAfter,  int? dueDayBefore,  int? dueDayAfter,  String? expiresBefore,  String? expiresAfter,  String? reason,  String? recordedOn,  String? recordedBy)?  $default,) {final _that = this;
switch (_that) {
case _LeaseTermChangeModel() when $default != null:
return $default(_that.id,_that.changeType,_that.effectiveOn,_that.rentBefore,_that.rentAfter,_that.dueDayBefore,_that.dueDayAfter,_that.expiresBefore,_that.expiresAfter,_that.reason,_that.recordedOn,_that.recordedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaseTermChangeModel extends LeaseTermChangeModel {
  const _LeaseTermChangeModel({required this.id, this.changeType, this.effectiveOn, @JsonKey(fromJson: parseDoubleNullable) this.rentBefore, @JsonKey(fromJson: parseDoubleNullable) this.rentAfter, this.dueDayBefore, this.dueDayAfter, this.expiresBefore, this.expiresAfter, this.reason, this.recordedOn, this.recordedBy}): super._();
  factory _LeaseTermChangeModel.fromJson(Map<String, dynamic> json) => _$LeaseTermChangeModelFromJson(json);

@override final  String id;
@override final  String? changeType;
@override final  String? effectiveOn;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? rentBefore;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? rentAfter;
@override final  int? dueDayBefore;
@override final  int? dueDayAfter;
@override final  String? expiresBefore;
@override final  String? expiresAfter;
@override final  String? reason;
@override final  String? recordedOn;
@override final  String? recordedBy;

/// Create a copy of LeaseTermChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseTermChangeModelCopyWith<_LeaseTermChangeModel> get copyWith => __$LeaseTermChangeModelCopyWithImpl<_LeaseTermChangeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseTermChangeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseTermChangeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.effectiveOn, effectiveOn) || other.effectiveOn == effectiveOn)&&(identical(other.rentBefore, rentBefore) || other.rentBefore == rentBefore)&&(identical(other.rentAfter, rentAfter) || other.rentAfter == rentAfter)&&(identical(other.dueDayBefore, dueDayBefore) || other.dueDayBefore == dueDayBefore)&&(identical(other.dueDayAfter, dueDayAfter) || other.dueDayAfter == dueDayAfter)&&(identical(other.expiresBefore, expiresBefore) || other.expiresBefore == expiresBefore)&&(identical(other.expiresAfter, expiresAfter) || other.expiresAfter == expiresAfter)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.recordedOn, recordedOn) || other.recordedOn == recordedOn)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,changeType,effectiveOn,rentBefore,rentAfter,dueDayBefore,dueDayAfter,expiresBefore,expiresAfter,reason,recordedOn,recordedBy);

@override
String toString() {
  return 'LeaseTermChangeModel(id: $id, changeType: $changeType, effectiveOn: $effectiveOn, rentBefore: $rentBefore, rentAfter: $rentAfter, dueDayBefore: $dueDayBefore, dueDayAfter: $dueDayAfter, expiresBefore: $expiresBefore, expiresAfter: $expiresAfter, reason: $reason, recordedOn: $recordedOn, recordedBy: $recordedBy)';
}


}

/// @nodoc
abstract mixin class _$LeaseTermChangeModelCopyWith<$Res> implements $LeaseTermChangeModelCopyWith<$Res> {
  factory _$LeaseTermChangeModelCopyWith(_LeaseTermChangeModel value, $Res Function(_LeaseTermChangeModel) _then) = __$LeaseTermChangeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? changeType, String? effectiveOn,@JsonKey(fromJson: parseDoubleNullable) double? rentBefore,@JsonKey(fromJson: parseDoubleNullable) double? rentAfter, int? dueDayBefore, int? dueDayAfter, String? expiresBefore, String? expiresAfter, String? reason, String? recordedOn, String? recordedBy
});




}
/// @nodoc
class __$LeaseTermChangeModelCopyWithImpl<$Res>
    implements _$LeaseTermChangeModelCopyWith<$Res> {
  __$LeaseTermChangeModelCopyWithImpl(this._self, this._then);

  final _LeaseTermChangeModel _self;
  final $Res Function(_LeaseTermChangeModel) _then;

/// Create a copy of LeaseTermChangeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? changeType = freezed,Object? effectiveOn = freezed,Object? rentBefore = freezed,Object? rentAfter = freezed,Object? dueDayBefore = freezed,Object? dueDayAfter = freezed,Object? expiresBefore = freezed,Object? expiresAfter = freezed,Object? reason = freezed,Object? recordedOn = freezed,Object? recordedBy = freezed,}) {
  return _then(_LeaseTermChangeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,changeType: freezed == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String?,effectiveOn: freezed == effectiveOn ? _self.effectiveOn : effectiveOn // ignore: cast_nullable_to_non_nullable
as String?,rentBefore: freezed == rentBefore ? _self.rentBefore : rentBefore // ignore: cast_nullable_to_non_nullable
as double?,rentAfter: freezed == rentAfter ? _self.rentAfter : rentAfter // ignore: cast_nullable_to_non_nullable
as double?,dueDayBefore: freezed == dueDayBefore ? _self.dueDayBefore : dueDayBefore // ignore: cast_nullable_to_non_nullable
as int?,dueDayAfter: freezed == dueDayAfter ? _self.dueDayAfter : dueDayAfter // ignore: cast_nullable_to_non_nullable
as int?,expiresBefore: freezed == expiresBefore ? _self.expiresBefore : expiresBefore // ignore: cast_nullable_to_non_nullable
as String?,expiresAfter: freezed == expiresAfter ? _self.expiresAfter : expiresAfter // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,recordedOn: freezed == recordedOn ? _self.recordedOn : recordedOn // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: freezed == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
