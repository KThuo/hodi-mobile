// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitModel {

 String get id; String get visitRef; String? get propertyName; String? get houseCode; String? get houseNumber;/// The unit as somebody reads it out — composed by the server, as everywhere else.
 String? get unitLabel; String? get tenantName; String get visitorName; String? get visitorPhone; String? get idType;/// **Already masked.** Never the number itself.
 String? get idNumber;/// Whether identification was taken at all, which is the question a gate actually asks.
 bool get hasIdNumber; int get visitorCount; String? get vehicleReg; String? get vehicleMake; String? get vehicleColour; String? get purpose; String? get purposeNotes; String? get checkedInOn; String? get checkedOutOn; int? get dwellMinutes;/// How long they have been here, in the server's words.
 String? get onSiteFor; bool get onSite;/// `NOT_REQUIRED`, `PENDING`, `APPROVED`, `REJECTED`.
 String get approvalStatus; String? get approvalDecidedOn; String? get overrideReason; String? get gateName; String? get checkedInByName; String? get checkedOutByName; int get status;
/// Create a copy of VisitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitModelCopyWith<VisitModel> get copyWith => _$VisitModelCopyWithImpl<VisitModel>(this as VisitModel, _$identity);

  /// Serializes this VisitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitModel&&(identical(other.id, id) || other.id == id)&&(identical(other.visitRef, visitRef) || other.visitRef == visitRef)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.visitorName, visitorName) || other.visitorName == visitorName)&&(identical(other.visitorPhone, visitorPhone) || other.visitorPhone == visitorPhone)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.hasIdNumber, hasIdNumber) || other.hasIdNumber == hasIdNumber)&&(identical(other.visitorCount, visitorCount) || other.visitorCount == visitorCount)&&(identical(other.vehicleReg, vehicleReg) || other.vehicleReg == vehicleReg)&&(identical(other.vehicleMake, vehicleMake) || other.vehicleMake == vehicleMake)&&(identical(other.vehicleColour, vehicleColour) || other.vehicleColour == vehicleColour)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.purposeNotes, purposeNotes) || other.purposeNotes == purposeNotes)&&(identical(other.checkedInOn, checkedInOn) || other.checkedInOn == checkedInOn)&&(identical(other.checkedOutOn, checkedOutOn) || other.checkedOutOn == checkedOutOn)&&(identical(other.dwellMinutes, dwellMinutes) || other.dwellMinutes == dwellMinutes)&&(identical(other.onSiteFor, onSiteFor) || other.onSiteFor == onSiteFor)&&(identical(other.onSite, onSite) || other.onSite == onSite)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.approvalDecidedOn, approvalDecidedOn) || other.approvalDecidedOn == approvalDecidedOn)&&(identical(other.overrideReason, overrideReason) || other.overrideReason == overrideReason)&&(identical(other.gateName, gateName) || other.gateName == gateName)&&(identical(other.checkedInByName, checkedInByName) || other.checkedInByName == checkedInByName)&&(identical(other.checkedOutByName, checkedOutByName) || other.checkedOutByName == checkedOutByName)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,visitRef,propertyName,houseCode,houseNumber,unitLabel,tenantName,visitorName,visitorPhone,idType,idNumber,hasIdNumber,visitorCount,vehicleReg,vehicleMake,vehicleColour,purpose,purposeNotes,checkedInOn,checkedOutOn,dwellMinutes,onSiteFor,onSite,approvalStatus,approvalDecidedOn,overrideReason,gateName,checkedInByName,checkedOutByName,status]);

@override
String toString() {
  return 'VisitModel(id: $id, visitRef: $visitRef, propertyName: $propertyName, houseCode: $houseCode, houseNumber: $houseNumber, unitLabel: $unitLabel, tenantName: $tenantName, visitorName: $visitorName, visitorPhone: $visitorPhone, idType: $idType, idNumber: $idNumber, hasIdNumber: $hasIdNumber, visitorCount: $visitorCount, vehicleReg: $vehicleReg, vehicleMake: $vehicleMake, vehicleColour: $vehicleColour, purpose: $purpose, purposeNotes: $purposeNotes, checkedInOn: $checkedInOn, checkedOutOn: $checkedOutOn, dwellMinutes: $dwellMinutes, onSiteFor: $onSiteFor, onSite: $onSite, approvalStatus: $approvalStatus, approvalDecidedOn: $approvalDecidedOn, overrideReason: $overrideReason, gateName: $gateName, checkedInByName: $checkedInByName, checkedOutByName: $checkedOutByName, status: $status)';
}


}

/// @nodoc
abstract mixin class $VisitModelCopyWith<$Res>  {
  factory $VisitModelCopyWith(VisitModel value, $Res Function(VisitModel) _then) = _$VisitModelCopyWithImpl;
@useResult
$Res call({
 String id, String visitRef, String? propertyName, String? houseCode, String? houseNumber, String? unitLabel, String? tenantName, String visitorName, String? visitorPhone, String? idType, String? idNumber, bool hasIdNumber, int visitorCount, String? vehicleReg, String? vehicleMake, String? vehicleColour, String? purpose, String? purposeNotes, String? checkedInOn, String? checkedOutOn, int? dwellMinutes, String? onSiteFor, bool onSite, String approvalStatus, String? approvalDecidedOn, String? overrideReason, String? gateName, String? checkedInByName, String? checkedOutByName, int status
});




}
/// @nodoc
class _$VisitModelCopyWithImpl<$Res>
    implements $VisitModelCopyWith<$Res> {
  _$VisitModelCopyWithImpl(this._self, this._then);

  final VisitModel _self;
  final $Res Function(VisitModel) _then;

/// Create a copy of VisitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? visitRef = null,Object? propertyName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? unitLabel = freezed,Object? tenantName = freezed,Object? visitorName = null,Object? visitorPhone = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? hasIdNumber = null,Object? visitorCount = null,Object? vehicleReg = freezed,Object? vehicleMake = freezed,Object? vehicleColour = freezed,Object? purpose = freezed,Object? purposeNotes = freezed,Object? checkedInOn = freezed,Object? checkedOutOn = freezed,Object? dwellMinutes = freezed,Object? onSiteFor = freezed,Object? onSite = null,Object? approvalStatus = null,Object? approvalDecidedOn = freezed,Object? overrideReason = freezed,Object? gateName = freezed,Object? checkedInByName = freezed,Object? checkedOutByName = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visitRef: null == visitRef ? _self.visitRef : visitRef // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,visitorName: null == visitorName ? _self.visitorName : visitorName // ignore: cast_nullable_to_non_nullable
as String,visitorPhone: freezed == visitorPhone ? _self.visitorPhone : visitorPhone // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,hasIdNumber: null == hasIdNumber ? _self.hasIdNumber : hasIdNumber // ignore: cast_nullable_to_non_nullable
as bool,visitorCount: null == visitorCount ? _self.visitorCount : visitorCount // ignore: cast_nullable_to_non_nullable
as int,vehicleReg: freezed == vehicleReg ? _self.vehicleReg : vehicleReg // ignore: cast_nullable_to_non_nullable
as String?,vehicleMake: freezed == vehicleMake ? _self.vehicleMake : vehicleMake // ignore: cast_nullable_to_non_nullable
as String?,vehicleColour: freezed == vehicleColour ? _self.vehicleColour : vehicleColour // ignore: cast_nullable_to_non_nullable
as String?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,purposeNotes: freezed == purposeNotes ? _self.purposeNotes : purposeNotes // ignore: cast_nullable_to_non_nullable
as String?,checkedInOn: freezed == checkedInOn ? _self.checkedInOn : checkedInOn // ignore: cast_nullable_to_non_nullable
as String?,checkedOutOn: freezed == checkedOutOn ? _self.checkedOutOn : checkedOutOn // ignore: cast_nullable_to_non_nullable
as String?,dwellMinutes: freezed == dwellMinutes ? _self.dwellMinutes : dwellMinutes // ignore: cast_nullable_to_non_nullable
as int?,onSiteFor: freezed == onSiteFor ? _self.onSiteFor : onSiteFor // ignore: cast_nullable_to_non_nullable
as String?,onSite: null == onSite ? _self.onSite : onSite // ignore: cast_nullable_to_non_nullable
as bool,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String,approvalDecidedOn: freezed == approvalDecidedOn ? _self.approvalDecidedOn : approvalDecidedOn // ignore: cast_nullable_to_non_nullable
as String?,overrideReason: freezed == overrideReason ? _self.overrideReason : overrideReason // ignore: cast_nullable_to_non_nullable
as String?,gateName: freezed == gateName ? _self.gateName : gateName // ignore: cast_nullable_to_non_nullable
as String?,checkedInByName: freezed == checkedInByName ? _self.checkedInByName : checkedInByName // ignore: cast_nullable_to_non_nullable
as String?,checkedOutByName: freezed == checkedOutByName ? _self.checkedOutByName : checkedOutByName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitModel].
extension VisitModelPatterns on VisitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitModel value)  $default,){
final _that = this;
switch (_that) {
case _VisitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitModel value)?  $default,){
final _that = this;
switch (_that) {
case _VisitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String visitRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? tenantName,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String? vehicleMake,  String? vehicleColour,  String? purpose,  String? purposeNotes,  String? checkedInOn,  String? checkedOutOn,  int? dwellMinutes,  String? onSiteFor,  bool onSite,  String approvalStatus,  String? approvalDecidedOn,  String? overrideReason,  String? gateName,  String? checkedInByName,  String? checkedOutByName,  int status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitModel() when $default != null:
return $default(_that.id,_that.visitRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.tenantName,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.vehicleMake,_that.vehicleColour,_that.purpose,_that.purposeNotes,_that.checkedInOn,_that.checkedOutOn,_that.dwellMinutes,_that.onSiteFor,_that.onSite,_that.approvalStatus,_that.approvalDecidedOn,_that.overrideReason,_that.gateName,_that.checkedInByName,_that.checkedOutByName,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String visitRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? tenantName,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String? vehicleMake,  String? vehicleColour,  String? purpose,  String? purposeNotes,  String? checkedInOn,  String? checkedOutOn,  int? dwellMinutes,  String? onSiteFor,  bool onSite,  String approvalStatus,  String? approvalDecidedOn,  String? overrideReason,  String? gateName,  String? checkedInByName,  String? checkedOutByName,  int status)  $default,) {final _that = this;
switch (_that) {
case _VisitModel():
return $default(_that.id,_that.visitRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.tenantName,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.vehicleMake,_that.vehicleColour,_that.purpose,_that.purposeNotes,_that.checkedInOn,_that.checkedOutOn,_that.dwellMinutes,_that.onSiteFor,_that.onSite,_that.approvalStatus,_that.approvalDecidedOn,_that.overrideReason,_that.gateName,_that.checkedInByName,_that.checkedOutByName,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String visitRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? tenantName,  String visitorName,  String? visitorPhone,  String? idType,  String? idNumber,  bool hasIdNumber,  int visitorCount,  String? vehicleReg,  String? vehicleMake,  String? vehicleColour,  String? purpose,  String? purposeNotes,  String? checkedInOn,  String? checkedOutOn,  int? dwellMinutes,  String? onSiteFor,  bool onSite,  String approvalStatus,  String? approvalDecidedOn,  String? overrideReason,  String? gateName,  String? checkedInByName,  String? checkedOutByName,  int status)?  $default,) {final _that = this;
switch (_that) {
case _VisitModel() when $default != null:
return $default(_that.id,_that.visitRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.tenantName,_that.visitorName,_that.visitorPhone,_that.idType,_that.idNumber,_that.hasIdNumber,_that.visitorCount,_that.vehicleReg,_that.vehicleMake,_that.vehicleColour,_that.purpose,_that.purposeNotes,_that.checkedInOn,_that.checkedOutOn,_that.dwellMinutes,_that.onSiteFor,_that.onSite,_that.approvalStatus,_that.approvalDecidedOn,_that.overrideReason,_that.gateName,_that.checkedInByName,_that.checkedOutByName,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VisitModel extends VisitModel {
  const _VisitModel({required this.id, required this.visitRef, this.propertyName, this.houseCode, this.houseNumber, this.unitLabel, this.tenantName, required this.visitorName, this.visitorPhone, this.idType, this.idNumber, this.hasIdNumber = false, this.visitorCount = 1, this.vehicleReg, this.vehicleMake, this.vehicleColour, this.purpose, this.purposeNotes, this.checkedInOn, this.checkedOutOn, this.dwellMinutes, this.onSiteFor, this.onSite = false, required this.approvalStatus, this.approvalDecidedOn, this.overrideReason, this.gateName, this.checkedInByName, this.checkedOutByName, this.status = 0}): super._();
  factory _VisitModel.fromJson(Map<String, dynamic> json) => _$VisitModelFromJson(json);

@override final  String id;
@override final  String visitRef;
@override final  String? propertyName;
@override final  String? houseCode;
@override final  String? houseNumber;
/// The unit as somebody reads it out — composed by the server, as everywhere else.
@override final  String? unitLabel;
@override final  String? tenantName;
@override final  String visitorName;
@override final  String? visitorPhone;
@override final  String? idType;
/// **Already masked.** Never the number itself.
@override final  String? idNumber;
/// Whether identification was taken at all, which is the question a gate actually asks.
@override@JsonKey() final  bool hasIdNumber;
@override@JsonKey() final  int visitorCount;
@override final  String? vehicleReg;
@override final  String? vehicleMake;
@override final  String? vehicleColour;
@override final  String? purpose;
@override final  String? purposeNotes;
@override final  String? checkedInOn;
@override final  String? checkedOutOn;
@override final  int? dwellMinutes;
/// How long they have been here, in the server's words.
@override final  String? onSiteFor;
@override@JsonKey() final  bool onSite;
/// `NOT_REQUIRED`, `PENDING`, `APPROVED`, `REJECTED`.
@override final  String approvalStatus;
@override final  String? approvalDecidedOn;
@override final  String? overrideReason;
@override final  String? gateName;
@override final  String? checkedInByName;
@override final  String? checkedOutByName;
@override@JsonKey() final  int status;

/// Create a copy of VisitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitModelCopyWith<_VisitModel> get copyWith => __$VisitModelCopyWithImpl<_VisitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitModel&&(identical(other.id, id) || other.id == id)&&(identical(other.visitRef, visitRef) || other.visitRef == visitRef)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.visitorName, visitorName) || other.visitorName == visitorName)&&(identical(other.visitorPhone, visitorPhone) || other.visitorPhone == visitorPhone)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.hasIdNumber, hasIdNumber) || other.hasIdNumber == hasIdNumber)&&(identical(other.visitorCount, visitorCount) || other.visitorCount == visitorCount)&&(identical(other.vehicleReg, vehicleReg) || other.vehicleReg == vehicleReg)&&(identical(other.vehicleMake, vehicleMake) || other.vehicleMake == vehicleMake)&&(identical(other.vehicleColour, vehicleColour) || other.vehicleColour == vehicleColour)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.purposeNotes, purposeNotes) || other.purposeNotes == purposeNotes)&&(identical(other.checkedInOn, checkedInOn) || other.checkedInOn == checkedInOn)&&(identical(other.checkedOutOn, checkedOutOn) || other.checkedOutOn == checkedOutOn)&&(identical(other.dwellMinutes, dwellMinutes) || other.dwellMinutes == dwellMinutes)&&(identical(other.onSiteFor, onSiteFor) || other.onSiteFor == onSiteFor)&&(identical(other.onSite, onSite) || other.onSite == onSite)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.approvalDecidedOn, approvalDecidedOn) || other.approvalDecidedOn == approvalDecidedOn)&&(identical(other.overrideReason, overrideReason) || other.overrideReason == overrideReason)&&(identical(other.gateName, gateName) || other.gateName == gateName)&&(identical(other.checkedInByName, checkedInByName) || other.checkedInByName == checkedInByName)&&(identical(other.checkedOutByName, checkedOutByName) || other.checkedOutByName == checkedOutByName)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,visitRef,propertyName,houseCode,houseNumber,unitLabel,tenantName,visitorName,visitorPhone,idType,idNumber,hasIdNumber,visitorCount,vehicleReg,vehicleMake,vehicleColour,purpose,purposeNotes,checkedInOn,checkedOutOn,dwellMinutes,onSiteFor,onSite,approvalStatus,approvalDecidedOn,overrideReason,gateName,checkedInByName,checkedOutByName,status]);

@override
String toString() {
  return 'VisitModel(id: $id, visitRef: $visitRef, propertyName: $propertyName, houseCode: $houseCode, houseNumber: $houseNumber, unitLabel: $unitLabel, tenantName: $tenantName, visitorName: $visitorName, visitorPhone: $visitorPhone, idType: $idType, idNumber: $idNumber, hasIdNumber: $hasIdNumber, visitorCount: $visitorCount, vehicleReg: $vehicleReg, vehicleMake: $vehicleMake, vehicleColour: $vehicleColour, purpose: $purpose, purposeNotes: $purposeNotes, checkedInOn: $checkedInOn, checkedOutOn: $checkedOutOn, dwellMinutes: $dwellMinutes, onSiteFor: $onSiteFor, onSite: $onSite, approvalStatus: $approvalStatus, approvalDecidedOn: $approvalDecidedOn, overrideReason: $overrideReason, gateName: $gateName, checkedInByName: $checkedInByName, checkedOutByName: $checkedOutByName, status: $status)';
}


}

/// @nodoc
abstract mixin class _$VisitModelCopyWith<$Res> implements $VisitModelCopyWith<$Res> {
  factory _$VisitModelCopyWith(_VisitModel value, $Res Function(_VisitModel) _then) = __$VisitModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String visitRef, String? propertyName, String? houseCode, String? houseNumber, String? unitLabel, String? tenantName, String visitorName, String? visitorPhone, String? idType, String? idNumber, bool hasIdNumber, int visitorCount, String? vehicleReg, String? vehicleMake, String? vehicleColour, String? purpose, String? purposeNotes, String? checkedInOn, String? checkedOutOn, int? dwellMinutes, String? onSiteFor, bool onSite, String approvalStatus, String? approvalDecidedOn, String? overrideReason, String? gateName, String? checkedInByName, String? checkedOutByName, int status
});




}
/// @nodoc
class __$VisitModelCopyWithImpl<$Res>
    implements _$VisitModelCopyWith<$Res> {
  __$VisitModelCopyWithImpl(this._self, this._then);

  final _VisitModel _self;
  final $Res Function(_VisitModel) _then;

/// Create a copy of VisitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? visitRef = null,Object? propertyName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? unitLabel = freezed,Object? tenantName = freezed,Object? visitorName = null,Object? visitorPhone = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? hasIdNumber = null,Object? visitorCount = null,Object? vehicleReg = freezed,Object? vehicleMake = freezed,Object? vehicleColour = freezed,Object? purpose = freezed,Object? purposeNotes = freezed,Object? checkedInOn = freezed,Object? checkedOutOn = freezed,Object? dwellMinutes = freezed,Object? onSiteFor = freezed,Object? onSite = null,Object? approvalStatus = null,Object? approvalDecidedOn = freezed,Object? overrideReason = freezed,Object? gateName = freezed,Object? checkedInByName = freezed,Object? checkedOutByName = freezed,Object? status = null,}) {
  return _then(_VisitModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,visitRef: null == visitRef ? _self.visitRef : visitRef // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,visitorName: null == visitorName ? _self.visitorName : visitorName // ignore: cast_nullable_to_non_nullable
as String,visitorPhone: freezed == visitorPhone ? _self.visitorPhone : visitorPhone // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,hasIdNumber: null == hasIdNumber ? _self.hasIdNumber : hasIdNumber // ignore: cast_nullable_to_non_nullable
as bool,visitorCount: null == visitorCount ? _self.visitorCount : visitorCount // ignore: cast_nullable_to_non_nullable
as int,vehicleReg: freezed == vehicleReg ? _self.vehicleReg : vehicleReg // ignore: cast_nullable_to_non_nullable
as String?,vehicleMake: freezed == vehicleMake ? _self.vehicleMake : vehicleMake // ignore: cast_nullable_to_non_nullable
as String?,vehicleColour: freezed == vehicleColour ? _self.vehicleColour : vehicleColour // ignore: cast_nullable_to_non_nullable
as String?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,purposeNotes: freezed == purposeNotes ? _self.purposeNotes : purposeNotes // ignore: cast_nullable_to_non_nullable
as String?,checkedInOn: freezed == checkedInOn ? _self.checkedInOn : checkedInOn // ignore: cast_nullable_to_non_nullable
as String?,checkedOutOn: freezed == checkedOutOn ? _self.checkedOutOn : checkedOutOn // ignore: cast_nullable_to_non_nullable
as String?,dwellMinutes: freezed == dwellMinutes ? _self.dwellMinutes : dwellMinutes // ignore: cast_nullable_to_non_nullable
as int?,onSiteFor: freezed == onSiteFor ? _self.onSiteFor : onSiteFor // ignore: cast_nullable_to_non_nullable
as String?,onSite: null == onSite ? _self.onSite : onSite // ignore: cast_nullable_to_non_nullable
as bool,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String,approvalDecidedOn: freezed == approvalDecidedOn ? _self.approvalDecidedOn : approvalDecidedOn // ignore: cast_nullable_to_non_nullable
as String?,overrideReason: freezed == overrideReason ? _self.overrideReason : overrideReason // ignore: cast_nullable_to_non_nullable
as String?,gateName: freezed == gateName ? _self.gateName : gateName // ignore: cast_nullable_to_non_nullable
as String?,checkedInByName: freezed == checkedInByName ? _self.checkedInByName : checkedInByName // ignore: cast_nullable_to_non_nullable
as String?,checkedOutByName: freezed == checkedOutByName ? _self.checkedOutByName : checkedOutByName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OnSiteSummaryModel {

 int get onSite;/// People waiting on somebody to say yes or no. The number this screen is for.
 int get awaitingApproval;
/// Create a copy of OnSiteSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSiteSummaryModelCopyWith<OnSiteSummaryModel> get copyWith => _$OnSiteSummaryModelCopyWithImpl<OnSiteSummaryModel>(this as OnSiteSummaryModel, _$identity);

  /// Serializes this OnSiteSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSiteSummaryModel&&(identical(other.onSite, onSite) || other.onSite == onSite)&&(identical(other.awaitingApproval, awaitingApproval) || other.awaitingApproval == awaitingApproval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,onSite,awaitingApproval);

@override
String toString() {
  return 'OnSiteSummaryModel(onSite: $onSite, awaitingApproval: $awaitingApproval)';
}


}

/// @nodoc
abstract mixin class $OnSiteSummaryModelCopyWith<$Res>  {
  factory $OnSiteSummaryModelCopyWith(OnSiteSummaryModel value, $Res Function(OnSiteSummaryModel) _then) = _$OnSiteSummaryModelCopyWithImpl;
@useResult
$Res call({
 int onSite, int awaitingApproval
});




}
/// @nodoc
class _$OnSiteSummaryModelCopyWithImpl<$Res>
    implements $OnSiteSummaryModelCopyWith<$Res> {
  _$OnSiteSummaryModelCopyWithImpl(this._self, this._then);

  final OnSiteSummaryModel _self;
  final $Res Function(OnSiteSummaryModel) _then;

/// Create a copy of OnSiteSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onSite = null,Object? awaitingApproval = null,}) {
  return _then(_self.copyWith(
onSite: null == onSite ? _self.onSite : onSite // ignore: cast_nullable_to_non_nullable
as int,awaitingApproval: null == awaitingApproval ? _self.awaitingApproval : awaitingApproval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OnSiteSummaryModel].
extension OnSiteSummaryModelPatterns on OnSiteSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnSiteSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnSiteSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnSiteSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _OnSiteSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnSiteSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OnSiteSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int onSite,  int awaitingApproval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnSiteSummaryModel() when $default != null:
return $default(_that.onSite,_that.awaitingApproval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int onSite,  int awaitingApproval)  $default,) {final _that = this;
switch (_that) {
case _OnSiteSummaryModel():
return $default(_that.onSite,_that.awaitingApproval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int onSite,  int awaitingApproval)?  $default,) {final _that = this;
switch (_that) {
case _OnSiteSummaryModel() when $default != null:
return $default(_that.onSite,_that.awaitingApproval);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnSiteSummaryModel extends OnSiteSummaryModel {
  const _OnSiteSummaryModel({this.onSite = 0, this.awaitingApproval = 0}): super._();
  factory _OnSiteSummaryModel.fromJson(Map<String, dynamic> json) => _$OnSiteSummaryModelFromJson(json);

@override@JsonKey() final  int onSite;
/// People waiting on somebody to say yes or no. The number this screen is for.
@override@JsonKey() final  int awaitingApproval;

/// Create a copy of OnSiteSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnSiteSummaryModelCopyWith<_OnSiteSummaryModel> get copyWith => __$OnSiteSummaryModelCopyWithImpl<_OnSiteSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnSiteSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnSiteSummaryModel&&(identical(other.onSite, onSite) || other.onSite == onSite)&&(identical(other.awaitingApproval, awaitingApproval) || other.awaitingApproval == awaitingApproval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,onSite,awaitingApproval);

@override
String toString() {
  return 'OnSiteSummaryModel(onSite: $onSite, awaitingApproval: $awaitingApproval)';
}


}

/// @nodoc
abstract mixin class _$OnSiteSummaryModelCopyWith<$Res> implements $OnSiteSummaryModelCopyWith<$Res> {
  factory _$OnSiteSummaryModelCopyWith(_OnSiteSummaryModel value, $Res Function(_OnSiteSummaryModel) _then) = __$OnSiteSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int onSite, int awaitingApproval
});




}
/// @nodoc
class __$OnSiteSummaryModelCopyWithImpl<$Res>
    implements _$OnSiteSummaryModelCopyWith<$Res> {
  __$OnSiteSummaryModelCopyWithImpl(this._self, this._then);

  final _OnSiteSummaryModel _self;
  final $Res Function(_OnSiteSummaryModel) _then;

/// Create a copy of OnSiteSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onSite = null,Object? awaitingApproval = null,}) {
  return _then(_OnSiteSummaryModel(
onSite: null == onSite ? _self.onSite : onSite // ignore: cast_nullable_to_non_nullable
as int,awaitingApproval: null == awaitingApproval ? _self.awaitingApproval : awaitingApproval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
