// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacate_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacateNoticeModel {

 String? get id; String? get rrn; String? get houseName; String? get houseCode; String? get houseNumber; String? get tenantName; String? get tenantPhone; String? get tenantEmail; String? get propertyName;@JsonKey(fromJson: parseIntNullable) int? get propertyId; String? get estateName;@JsonKey(fromJson: parseIntNullable) int? get estateId; String? get vacateDate; String? get reason; String? get flag;@JsonKey(fromJson: parseIntNullable) int? get status; String? get initiatedBy; String? get initiatedByName; String? get settlementType;@JsonKey(fromJson: parseDouble) double get netAmount;@JsonKey(fromJson: parseDouble) double get totalPaid; String? get createdOn;
/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacateNoticeModelCopyWith<VacateNoticeModel> get copyWith => _$VacateNoticeModelCopyWithImpl<VacateNoticeModel>(this as VacateNoticeModel, _$identity);

  /// Serializes this VacateNoticeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacateNoticeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.status, status) || other.status == status)&&(identical(other.initiatedBy, initiatedBy) || other.initiatedBy == initiatedBy)&&(identical(other.initiatedByName, initiatedByName) || other.initiatedByName == initiatedByName)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,houseName,houseCode,houseNumber,tenantName,tenantPhone,tenantEmail,propertyName,propertyId,estateName,estateId,vacateDate,reason,flag,status,initiatedBy,initiatedByName,settlementType,netAmount,totalPaid,createdOn]);

@override
String toString() {
  return 'VacateNoticeModel(id: $id, rrn: $rrn, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, propertyName: $propertyName, propertyId: $propertyId, estateName: $estateName, estateId: $estateId, vacateDate: $vacateDate, reason: $reason, flag: $flag, status: $status, initiatedBy: $initiatedBy, initiatedByName: $initiatedByName, settlementType: $settlementType, netAmount: $netAmount, totalPaid: $totalPaid, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $VacateNoticeModelCopyWith<$Res>  {
  factory $VacateNoticeModelCopyWith(VacateNoticeModel value, $Res Function(VacateNoticeModel) _then) = _$VacateNoticeModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rrn, String? houseName, String? houseCode, String? houseNumber, String? tenantName, String? tenantPhone, String? tenantEmail, String? propertyName,@JsonKey(fromJson: parseIntNullable) int? propertyId, String? estateName,@JsonKey(fromJson: parseIntNullable) int? estateId, String? vacateDate, String? reason, String? flag,@JsonKey(fromJson: parseIntNullable) int? status, String? initiatedBy, String? initiatedByName, String? settlementType,@JsonKey(fromJson: parseDouble) double netAmount,@JsonKey(fromJson: parseDouble) double totalPaid, String? createdOn
});




}
/// @nodoc
class _$VacateNoticeModelCopyWithImpl<$Res>
    implements $VacateNoticeModelCopyWith<$Res> {
  _$VacateNoticeModelCopyWithImpl(this._self, this._then);

  final VacateNoticeModel _self;
  final $Res Function(VacateNoticeModel) _then;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? propertyName = freezed,Object? propertyId = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? flag = freezed,Object? status = freezed,Object? initiatedBy = freezed,Object? initiatedByName = freezed,Object? settlementType = freezed,Object? netAmount = null,Object? totalPaid = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,initiatedBy: freezed == initiatedBy ? _self.initiatedBy : initiatedBy // ignore: cast_nullable_to_non_nullable
as String?,initiatedByName: freezed == initiatedByName ? _self.initiatedByName : initiatedByName // ignore: cast_nullable_to_non_nullable
as String?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacateNoticeModel].
extension VacateNoticeModelPatterns on VacateNoticeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacateNoticeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacateNoticeModel value)  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacateNoticeModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName,  String? settlementType, @JsonKey(fromJson: parseDouble)  double netAmount, @JsonKey(fromJson: parseDouble)  double totalPaid,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.settlementType,_that.netAmount,_that.totalPaid,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName,  String? settlementType, @JsonKey(fromJson: parseDouble)  double netAmount, @JsonKey(fromJson: parseDouble)  double totalPaid,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeModel():
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.settlementType,_that.netAmount,_that.totalPaid,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName,  String? settlementType, @JsonKey(fromJson: parseDouble)  double netAmount, @JsonKey(fromJson: parseDouble)  double totalPaid,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.settlementType,_that.netAmount,_that.totalPaid,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacateNoticeModel extends VacateNoticeModel {
  const _VacateNoticeModel({this.id, this.rrn, this.houseName, this.houseCode, this.houseNumber, this.tenantName, this.tenantPhone, this.tenantEmail, this.propertyName, @JsonKey(fromJson: parseIntNullable) this.propertyId, this.estateName, @JsonKey(fromJson: parseIntNullable) this.estateId, this.vacateDate, this.reason, this.flag, @JsonKey(fromJson: parseIntNullable) this.status, this.initiatedBy, this.initiatedByName, this.settlementType, @JsonKey(fromJson: parseDouble) this.netAmount = 0, @JsonKey(fromJson: parseDouble) this.totalPaid = 0, this.createdOn}): super._();
  factory _VacateNoticeModel.fromJson(Map<String, dynamic> json) => _$VacateNoticeModelFromJson(json);

@override final  String? id;
@override final  String? rrn;
@override final  String? houseName;
@override final  String? houseCode;
@override final  String? houseNumber;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? tenantEmail;
@override final  String? propertyName;
@override@JsonKey(fromJson: parseIntNullable) final  int? propertyId;
@override final  String? estateName;
@override@JsonKey(fromJson: parseIntNullable) final  int? estateId;
@override final  String? vacateDate;
@override final  String? reason;
@override final  String? flag;
@override@JsonKey(fromJson: parseIntNullable) final  int? status;
@override final  String? initiatedBy;
@override final  String? initiatedByName;
@override final  String? settlementType;
@override@JsonKey(fromJson: parseDouble) final  double netAmount;
@override@JsonKey(fromJson: parseDouble) final  double totalPaid;
@override final  String? createdOn;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacateNoticeModelCopyWith<_VacateNoticeModel> get copyWith => __$VacateNoticeModelCopyWithImpl<_VacateNoticeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacateNoticeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacateNoticeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.status, status) || other.status == status)&&(identical(other.initiatedBy, initiatedBy) || other.initiatedBy == initiatedBy)&&(identical(other.initiatedByName, initiatedByName) || other.initiatedByName == initiatedByName)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,houseName,houseCode,houseNumber,tenantName,tenantPhone,tenantEmail,propertyName,propertyId,estateName,estateId,vacateDate,reason,flag,status,initiatedBy,initiatedByName,settlementType,netAmount,totalPaid,createdOn]);

@override
String toString() {
  return 'VacateNoticeModel(id: $id, rrn: $rrn, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, propertyName: $propertyName, propertyId: $propertyId, estateName: $estateName, estateId: $estateId, vacateDate: $vacateDate, reason: $reason, flag: $flag, status: $status, initiatedBy: $initiatedBy, initiatedByName: $initiatedByName, settlementType: $settlementType, netAmount: $netAmount, totalPaid: $totalPaid, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$VacateNoticeModelCopyWith<$Res> implements $VacateNoticeModelCopyWith<$Res> {
  factory _$VacateNoticeModelCopyWith(_VacateNoticeModel value, $Res Function(_VacateNoticeModel) _then) = __$VacateNoticeModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rrn, String? houseName, String? houseCode, String? houseNumber, String? tenantName, String? tenantPhone, String? tenantEmail, String? propertyName,@JsonKey(fromJson: parseIntNullable) int? propertyId, String? estateName,@JsonKey(fromJson: parseIntNullable) int? estateId, String? vacateDate, String? reason, String? flag,@JsonKey(fromJson: parseIntNullable) int? status, String? initiatedBy, String? initiatedByName, String? settlementType,@JsonKey(fromJson: parseDouble) double netAmount,@JsonKey(fromJson: parseDouble) double totalPaid, String? createdOn
});




}
/// @nodoc
class __$VacateNoticeModelCopyWithImpl<$Res>
    implements _$VacateNoticeModelCopyWith<$Res> {
  __$VacateNoticeModelCopyWithImpl(this._self, this._then);

  final _VacateNoticeModel _self;
  final $Res Function(_VacateNoticeModel) _then;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? propertyName = freezed,Object? propertyId = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? flag = freezed,Object? status = freezed,Object? initiatedBy = freezed,Object? initiatedByName = freezed,Object? settlementType = freezed,Object? netAmount = null,Object? totalPaid = null,Object? createdOn = freezed,}) {
  return _then(_VacateNoticeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,initiatedBy: freezed == initiatedBy ? _self.initiatedBy : initiatedBy // ignore: cast_nullable_to_non_nullable
as String?,initiatedByName: freezed == initiatedByName ? _self.initiatedByName : initiatedByName // ignore: cast_nullable_to_non_nullable
as String?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
