// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pass_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PassModel {

 String get id;/// As shown and read out: `7K2M9-XQ4TB`.
 String get passCode; String get state; String get stateLabel; String get validFrom; String get validUntil; String get visitorName; String? get visitorPhone; String? get idType;/// Masked, as on a visit.
 String? get idNumber; bool get hasIdNumber; int get visitorCount; String? get vehicleReg; String get purpose; String? get purposeNotes; String? get estateName; String? get propertyName; String? get houseId;/// The unit as somebody at the gate says it — `M08 (Second Floor)`.
 String get unitLabel;/// The host.
 String? get tenantName; String? get cancelledOn; String? get createdOn; int get admissions; String? get openVisitId; String? get onSiteSince; bool get admissible;
/// Create a copy of PassModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassModelCopyWith<PassModel> get copyWith => _$PassModelCopyWithImpl<PassModel>(this as PassModel, _$identity);

  /// Serializes this PassModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassModel&&(identical(other.id, id) || other.id == id)&&(identical(other.passCode, passCode) || other.passCode == passCode)&&(identical(other.state, state) || other.state == state)&&(identical(other.stateLabel, stateLabel) || other.stateLabel == stateLabel)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.visitorName, visitorName) || other.visitorName == visitorName)&&(identical(other.visitorPhone, visitorPhone) || other.visitorPhone == visitorPhone)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.hasIdNumber, hasIdNumber) || other.hasIdNumber == hasIdNumber)&&(identical(other.visitorCount, visitorCount) || other.visitorCount == visitorCount)&&(identical(other.vehicleReg, vehicleReg) || other.vehicleReg == vehicleReg)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.purposeNotes, purposeNotes) || other.purposeNotes == purposeNotes)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.cancelledOn, cancelledOn) || other.cancelledOn == cancelledOn)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.admissions, admissions) || other.admissions == admissions)&&(identical(other.openVisitId, openVisitId) || other.openVisitId == openVisitId)&&(identical(other.onSiteSince, onSiteSince) || other.onSiteSince == onSiteSince)&&(identical(other.admissible, admissible) || other.admissible == admissible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,passCode,state,stateLabel,validFrom,validUntil,visitorName,visitorPhone,idType,idNumber,hasIdNumber,visitorCount,vehicleReg,purpose,purposeNotes,estateName,propertyName,houseId,unitLabel,tenantName,cancelledOn,createdOn,admissions,openVisitId,onSiteSince,admissible]);

@override
String toString() {
  return 'PassModel(id: $id, passCode: $passCode, state: $state, stateLabel: $stateLabel, validFrom: $validFrom, validUntil: $validUntil, visitorName: $visitorName, visitorPhone: $visitorPhone, idType: $idType, idNumber: $idNumber, hasIdNumber: $hasIdNumber, visitorCount: $visitorCount, vehicleReg: $vehicleReg, purpose: $purpose, purposeNotes: $purposeNotes, estateName: $estateName, propertyName: $propertyName, houseId: $houseId, unitLabel: $unitLabel, tenantName: $tenantName, cancelledOn: $cancelledOn, createdOn: $createdOn, admissions: $admissions, openVisitId: $openVisitId, onSiteSince: $onSiteSince, admissible: $admissible)';
}


}

/// @nodoc
abstract mixin class $PassModelCopyWith<$Res>  {
  factory $PassModelCopyWith(PassModel value, $Res Function(PassModel) _then) = _$PassModelCopyWithImpl;
@useResult
$Res call({
 String id, String passCode, String state, String stateLabel, String validFrom, String validUntil, String visitorName, String? visitorPhone, String? idType, String? idNumber, bool hasIdNumber, int visitorCount, String? vehicleReg, String purpose, String? purposeNotes, String? estateName, String? propertyName, String? houseId, String unitLabel, String? tenantName, String? cancelledOn, String? createdOn, int admissions, String? openVisitId, String? onSiteSince, bool admissible
});




}
/// @nodoc
class _$PassModelCopyWithImpl<$Res>
    implements $PassModelCopyWith<$Res> {
  _$PassModelCopyWithImpl(this._self, this._then);

  final PassModel _self;
  final $Res Function(PassModel) _then;

/// Create a copy of PassModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? passCode = null,Object? state = null,Object? stateLabel = null,Object? validFrom = null,Object? validUntil = null,Object? visitorName = null,Object? visitorPhone = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? hasIdNumber = null,Object? visitorCount = null,Object? vehicleReg = freezed,Object? purpose = null,Object? purposeNotes = freezed,Object? estateName = freezed,Object? propertyName = freezed,Object? houseId = freezed,Object? unitLabel = null,Object? tenantName = freezed,Object? cancelledOn = freezed,Object? createdOn = freezed,Object? admissions = null,Object? openVisitId = freezed,Object? onSiteSince = freezed,Object? admissible = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,passCode: null == passCode ? _self.passCode : passCode // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,stateLabel: null == stateLabel ? _self.stateLabel : stateLabel // ignore: cast_nullable_to_non_nullable
as String,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,visitorName: null == visitorName ? _self.visitorName : visitorName // ignore: cast_nullable_to_non_nullable
as String,visitorPhone: freezed == visitorPhone ? _self.visitorPhone : visitorPhone // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,hasIdNumber: null == hasIdNumber ? _self.hasIdNumber : hasIdNumber // ignore: cast_nullable_to_non_nullable
as bool,visitorCount: null == visitorCount ? _self.visitorCount : visitorCount // ignore: cast_nullable_to_non_nullable
as int,vehicleReg: freezed == vehicleReg ? _self.vehicleReg : vehicleReg // ignore: cast_nullable_to_non_nullable
as String?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,purposeNotes: freezed == purposeNotes ? _self.purposeNotes : purposeNotes // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: null == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,cancelledOn: freezed == cancelledOn ? _self.cancelledOn : cancelledOn // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,admissions: null == admissions ? _self.admissions : admissions // ignore: cast_nullable_to_non_nullable
as int,openVisitId: freezed == openVisitId ? _self.openVisitId : openVisitId // ignore: cast_nullable_to_non_nullable
as String?,onSiteSince: freezed == onSiteSince ? _self.onSiteSince : onSiteSince // ignore: cast_nullable_to_non_nullable
as String?,admissible: null == admissible ? _self.admissible : admissible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PassModel].
extension PassModelPatterns on PassModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassModel value)  $default,){
final _that = this;
switch (_that) {
case _PassModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassModel value)?  $default,){
final _that = this;
switch (_that) {
case _PassModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String passCode,  String state,  String stateLabel,  String validFrom,  String validUntil,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String purpose,  String? purposeNotes,  String? estateName,  String? propertyName,  String? houseId,  String unitLabel,  String? tenantName,  String? cancelledOn,  String? createdOn,  int admissions,  String? openVisitId,  String? onSiteSince,  bool admissible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassModel() when $default != null:
return $default(_that.id,_that.passCode,_that.state,_that.stateLabel,_that.validFrom,_that.validUntil,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.purpose,_that.purposeNotes,_that.estateName,_that.propertyName,_that.houseId,_that.unitLabel,_that.tenantName,_that.cancelledOn,_that.createdOn,_that.admissions,_that.openVisitId,_that.onSiteSince,_that.admissible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String passCode,  String state,  String stateLabel,  String validFrom,  String validUntil,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String purpose,  String? purposeNotes,  String? estateName,  String? propertyName,  String? houseId,  String unitLabel,  String? tenantName,  String? cancelledOn,  String? createdOn,  int admissions,  String? openVisitId,  String? onSiteSince,  bool admissible)  $default,) {final _that = this;
switch (_that) {
case _PassModel():
return $default(_that.id,_that.passCode,_that.state,_that.stateLabel,_that.validFrom,_that.validUntil,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.purpose,_that.purposeNotes,_that.estateName,_that.propertyName,_that.houseId,_that.unitLabel,_that.tenantName,_that.cancelledOn,_that.createdOn,_that.admissions,_that.openVisitId,_that.onSiteSince,_that.admissible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String passCode,  String state,  String stateLabel,  String validFrom,  String validUntil,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String purpose,  String? purposeNotes,  String? estateName,  String? propertyName,  String? houseId,  String unitLabel,  String? tenantName,  String? cancelledOn,  String? createdOn,  int admissions,  String? openVisitId,  String? onSiteSince,  bool admissible)?  $default,) {final _that = this;
switch (_that) {
case _PassModel() when $default != null:
return $default(_that.id,_that.passCode,_that.state,_that.stateLabel,_that.validFrom,_that.validUntil,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.purpose,_that.purposeNotes,_that.estateName,_that.propertyName,_that.houseId,_that.unitLabel,_that.tenantName,_that.cancelledOn,_that.createdOn,_that.admissions,_that.openVisitId,_that.onSiteSince,_that.admissible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassModel extends PassModel {
  const _PassModel({required this.id, required this.passCode, required this.state, required this.stateLabel, required this.validFrom, required this.validUntil, required this.visitorName, this.visitorPhone, this.idType, this.idNumber, this.hasIdNumber = false, this.visitorCount = 1, this.vehicleReg, this.purpose = 'SOCIAL', this.purposeNotes, this.estateName, this.propertyName, this.houseId, this.unitLabel = '', this.tenantName, this.cancelledOn, this.createdOn, this.admissions = 0, this.openVisitId, this.onSiteSince, this.admissible = false}): super._();
  factory _PassModel.fromJson(Map<String, dynamic> json) => _$PassModelFromJson(json);

@override final  String id;
/// As shown and read out: `7K2M9-XQ4TB`.
@override final  String passCode;
@override final  String state;
@override final  String stateLabel;
@override final  String validFrom;
@override final  String validUntil;
@override final  String visitorName;
@override final  String? visitorPhone;
@override final  String? idType;
/// Masked, as on a visit.
@override final  String? idNumber;
@override@JsonKey() final  bool hasIdNumber;
@override@JsonKey() final  int visitorCount;
@override final  String? vehicleReg;
@override@JsonKey() final  String purpose;
@override final  String? purposeNotes;
@override final  String? estateName;
@override final  String? propertyName;
@override final  String? houseId;
/// The unit as somebody at the gate says it — `M08 (Second Floor)`.
@override@JsonKey() final  String unitLabel;
/// The host.
@override final  String? tenantName;
@override final  String? cancelledOn;
@override final  String? createdOn;
@override@JsonKey() final  int admissions;
@override final  String? openVisitId;
@override final  String? onSiteSince;
@override@JsonKey() final  bool admissible;

/// Create a copy of PassModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassModelCopyWith<_PassModel> get copyWith => __$PassModelCopyWithImpl<_PassModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassModel&&(identical(other.id, id) || other.id == id)&&(identical(other.passCode, passCode) || other.passCode == passCode)&&(identical(other.state, state) || other.state == state)&&(identical(other.stateLabel, stateLabel) || other.stateLabel == stateLabel)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.visitorName, visitorName) || other.visitorName == visitorName)&&(identical(other.visitorPhone, visitorPhone) || other.visitorPhone == visitorPhone)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.hasIdNumber, hasIdNumber) || other.hasIdNumber == hasIdNumber)&&(identical(other.visitorCount, visitorCount) || other.visitorCount == visitorCount)&&(identical(other.vehicleReg, vehicleReg) || other.vehicleReg == vehicleReg)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.purposeNotes, purposeNotes) || other.purposeNotes == purposeNotes)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.cancelledOn, cancelledOn) || other.cancelledOn == cancelledOn)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.admissions, admissions) || other.admissions == admissions)&&(identical(other.openVisitId, openVisitId) || other.openVisitId == openVisitId)&&(identical(other.onSiteSince, onSiteSince) || other.onSiteSince == onSiteSince)&&(identical(other.admissible, admissible) || other.admissible == admissible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,passCode,state,stateLabel,validFrom,validUntil,visitorName,visitorPhone,idType,idNumber,hasIdNumber,visitorCount,vehicleReg,purpose,purposeNotes,estateName,propertyName,houseId,unitLabel,tenantName,cancelledOn,createdOn,admissions,openVisitId,onSiteSince,admissible]);

@override
String toString() {
  return 'PassModel(id: $id, passCode: $passCode, state: $state, stateLabel: $stateLabel, validFrom: $validFrom, validUntil: $validUntil, visitorName: $visitorName, visitorPhone: $visitorPhone, idType: $idType, idNumber: $idNumber, hasIdNumber: $hasIdNumber, visitorCount: $visitorCount, vehicleReg: $vehicleReg, purpose: $purpose, purposeNotes: $purposeNotes, estateName: $estateName, propertyName: $propertyName, houseId: $houseId, unitLabel: $unitLabel, tenantName: $tenantName, cancelledOn: $cancelledOn, createdOn: $createdOn, admissions: $admissions, openVisitId: $openVisitId, onSiteSince: $onSiteSince, admissible: $admissible)';
}


}

/// @nodoc
abstract mixin class _$PassModelCopyWith<$Res> implements $PassModelCopyWith<$Res> {
  factory _$PassModelCopyWith(_PassModel value, $Res Function(_PassModel) _then) = __$PassModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String passCode, String state, String stateLabel, String validFrom, String validUntil, String visitorName, String? visitorPhone, String? idType, String? idNumber, bool hasIdNumber, int visitorCount, String? vehicleReg, String purpose, String? purposeNotes, String? estateName, String? propertyName, String? houseId, String unitLabel, String? tenantName, String? cancelledOn, String? createdOn, int admissions, String? openVisitId, String? onSiteSince, bool admissible
});




}
/// @nodoc
class __$PassModelCopyWithImpl<$Res>
    implements _$PassModelCopyWith<$Res> {
  __$PassModelCopyWithImpl(this._self, this._then);

  final _PassModel _self;
  final $Res Function(_PassModel) _then;

/// Create a copy of PassModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? passCode = null,Object? state = null,Object? stateLabel = null,Object? validFrom = null,Object? validUntil = null,Object? visitorName = null,Object? visitorPhone = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? hasIdNumber = null,Object? visitorCount = null,Object? vehicleReg = freezed,Object? purpose = null,Object? purposeNotes = freezed,Object? estateName = freezed,Object? propertyName = freezed,Object? houseId = freezed,Object? unitLabel = null,Object? tenantName = freezed,Object? cancelledOn = freezed,Object? createdOn = freezed,Object? admissions = null,Object? openVisitId = freezed,Object? onSiteSince = freezed,Object? admissible = null,}) {
  return _then(_PassModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,passCode: null == passCode ? _self.passCode : passCode // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,stateLabel: null == stateLabel ? _self.stateLabel : stateLabel // ignore: cast_nullable_to_non_nullable
as String,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,visitorName: null == visitorName ? _self.visitorName : visitorName // ignore: cast_nullable_to_non_nullable
as String,visitorPhone: freezed == visitorPhone ? _self.visitorPhone : visitorPhone // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,hasIdNumber: null == hasIdNumber ? _self.hasIdNumber : hasIdNumber // ignore: cast_nullable_to_non_nullable
as bool,visitorCount: null == visitorCount ? _self.visitorCount : visitorCount // ignore: cast_nullable_to_non_nullable
as int,vehicleReg: freezed == vehicleReg ? _self.vehicleReg : vehicleReg // ignore: cast_nullable_to_non_nullable
as String?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,purposeNotes: freezed == purposeNotes ? _self.purposeNotes : purposeNotes // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: null == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,cancelledOn: freezed == cancelledOn ? _self.cancelledOn : cancelledOn // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,admissions: null == admissions ? _self.admissions : admissions // ignore: cast_nullable_to_non_nullable
as int,openVisitId: freezed == openVisitId ? _self.openVisitId : openVisitId // ignore: cast_nullable_to_non_nullable
as String?,onSiteSince: freezed == onSiteSince ? _self.onSiteSince : onSiteSince // ignore: cast_nullable_to_non_nullable
as String?,admissible: null == admissible ? _self.admissible : admissible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
