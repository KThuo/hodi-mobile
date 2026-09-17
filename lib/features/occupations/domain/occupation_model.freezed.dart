// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occupation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OccupationModel {

 String get id;/// The tenant's user id — a tenant is a user.
 String? get tenantUserId; String? get tenantName; String? get tenantPhone; bool get tenantIsOrganisation; String get houseId; String get houseCode; String? get houseNumber;/// The unit as a person reads it: "G06 (Ground Floor)". Beside the code rather than instead
/// of it — the code is what goes on a payment reference, the label is the door knocked on.
 String? get houseLabel; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String? get categoryId; String? get categoryName; String? get usageClassName; String? get tenure;@JsonKey(fromJson: parseDouble) double get rent;@JsonKey(fromJson: parseDouble) double get deposit;@JsonKey(fromJson: parseDouble) double get refundableDeposit;/// Positive is arrears, negative is credit. The legacy portal's convention, kept.
@JsonKey(fromJson: parseDouble) double get rentOwed; int? get dueDay;/// The next date rent falls due. Derived by the server rather than stored, so a missed
/// invoice run cannot leave two clients showing two different wrong answers.
 String? get nextDueOn; String? get occupiedOn;/// Null where there is no agreed end.
 String? get expiresOn;/// Negative means the term has already passed, which is a normal state for a periodic
/// tenancy that ran past its first term.
 int? get daysToExpiry; int? get noticeDays; int get status; String? get createdOn;
/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccupationModelCopyWith<OccupationModel> get copyWith => _$OccupationModelCopyWithImpl<OccupationModel>(this as OccupationModel, _$identity);

  /// Serializes this OccupationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccupationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantIsOrganisation, tenantIsOrganisation) || other.tenantIsOrganisation == tenantIsOrganisation)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.nextDueOn, nextDueOn) || other.nextDueOn == nextDueOn)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantUserId,tenantName,tenantPhone,tenantIsOrganisation,houseId,houseCode,houseNumber,houseLabel,propertyId,propertyName,estateId,estateName,categoryId,categoryName,usageClassName,tenure,rent,deposit,refundableDeposit,rentOwed,dueDay,nextDueOn,occupiedOn,expiresOn,daysToExpiry,noticeDays,status,createdOn]);

@override
String toString() {
  return 'OccupationModel(id: $id, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantIsOrganisation: $tenantIsOrganisation, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, categoryId: $categoryId, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, rentOwed: $rentOwed, dueDay: $dueDay, nextDueOn: $nextDueOn, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $OccupationModelCopyWith<$Res>  {
  factory $OccupationModelCopyWith(OccupationModel value, $Res Function(OccupationModel) _then) = _$OccupationModelCopyWithImpl;
@useResult
$Res call({
 String id, String? tenantUserId, String? tenantName, String? tenantPhone, bool tenantIsOrganisation, String houseId, String houseCode, String? houseNumber, String? houseLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? categoryId, String? categoryName, String? usageClassName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit,@JsonKey(fromJson: parseDouble) double rentOwed, int? dueDay, String? nextDueOn, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, int status, String? createdOn
});




}
/// @nodoc
class _$OccupationModelCopyWithImpl<$Res>
    implements $OccupationModelCopyWith<$Res> {
  _$OccupationModelCopyWithImpl(this._self, this._then);

  final OccupationModel _self;
  final $Res Function(OccupationModel) _then;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantUserId = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantIsOrganisation = null,Object? houseId = null,Object? houseCode = null,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? rentOwed = null,Object? dueDay = freezed,Object? nextDueOn = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantIsOrganisation: null == tenantIsOrganisation ? _self.tenantIsOrganisation : tenantIsOrganisation // ignore: cast_nullable_to_non_nullable
as bool,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,nextDueOn: freezed == nextDueOn ? _self.nextDueOn : nextDueOn // ignore: cast_nullable_to_non_nullable
as String?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OccupationModel].
extension OccupationModelPatterns on OccupationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccupationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccupationModel value)  $default,){
final _that = this;
switch (_that) {
case _OccupationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccupationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? tenantUserId,  String? tenantName,  String? tenantPhone,  bool tenantIsOrganisation,  String houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryId,  String? categoryName,  String? usageClassName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double rentOwed,  int? dueDay,  String? nextDueOn,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int status,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantIsOrganisation,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryId,_that.categoryName,_that.usageClassName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.rentOwed,_that.dueDay,_that.nextDueOn,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? tenantUserId,  String? tenantName,  String? tenantPhone,  bool tenantIsOrganisation,  String houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryId,  String? categoryName,  String? usageClassName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double rentOwed,  int? dueDay,  String? nextDueOn,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int status,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _OccupationModel():
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantIsOrganisation,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryId,_that.categoryName,_that.usageClassName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.rentOwed,_that.dueDay,_that.nextDueOn,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? tenantUserId,  String? tenantName,  String? tenantPhone,  bool tenantIsOrganisation,  String houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? categoryId,  String? categoryName,  String? usageClassName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double rentOwed,  int? dueDay,  String? nextDueOn,  String? occupiedOn,  String? expiresOn,  int? daysToExpiry,  int? noticeDays,  int status,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantIsOrganisation,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.categoryId,_that.categoryName,_that.usageClassName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.rentOwed,_that.dueDay,_that.nextDueOn,_that.occupiedOn,_that.expiresOn,_that.daysToExpiry,_that.noticeDays,_that.status,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccupationModel extends OccupationModel {
  const _OccupationModel({required this.id, this.tenantUserId, this.tenantName, this.tenantPhone, this.tenantIsOrganisation = false, required this.houseId, required this.houseCode, this.houseNumber, this.houseLabel, this.propertyId, this.propertyName, this.estateId, this.estateName, this.categoryId, this.categoryName, this.usageClassName, this.tenure, @JsonKey(fromJson: parseDouble) this.rent = 0, @JsonKey(fromJson: parseDouble) this.deposit = 0, @JsonKey(fromJson: parseDouble) this.refundableDeposit = 0, @JsonKey(fromJson: parseDouble) this.rentOwed = 0, this.dueDay, this.nextDueOn, this.occupiedOn, this.expiresOn, this.daysToExpiry, this.noticeDays, this.status = 0, this.createdOn}): super._();
  factory _OccupationModel.fromJson(Map<String, dynamic> json) => _$OccupationModelFromJson(json);

@override final  String id;
/// The tenant's user id — a tenant is a user.
@override final  String? tenantUserId;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override@JsonKey() final  bool tenantIsOrganisation;
@override final  String houseId;
@override final  String houseCode;
@override final  String? houseNumber;
/// The unit as a person reads it: "G06 (Ground Floor)". Beside the code rather than instead
/// of it — the code is what goes on a payment reference, the label is the door knocked on.
@override final  String? houseLabel;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? categoryId;
@override final  String? categoryName;
@override final  String? usageClassName;
@override final  String? tenure;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override@JsonKey(fromJson: parseDouble) final  double deposit;
@override@JsonKey(fromJson: parseDouble) final  double refundableDeposit;
/// Positive is arrears, negative is credit. The legacy portal's convention, kept.
@override@JsonKey(fromJson: parseDouble) final  double rentOwed;
@override final  int? dueDay;
/// The next date rent falls due. Derived by the server rather than stored, so a missed
/// invoice run cannot leave two clients showing two different wrong answers.
@override final  String? nextDueOn;
@override final  String? occupiedOn;
/// Null where there is no agreed end.
@override final  String? expiresOn;
/// Negative means the term has already passed, which is a normal state for a periodic
/// tenancy that ran past its first term.
@override final  int? daysToExpiry;
@override final  int? noticeDays;
@override@JsonKey() final  int status;
@override final  String? createdOn;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccupationModelCopyWith<_OccupationModel> get copyWith => __$OccupationModelCopyWithImpl<_OccupationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccupationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccupationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantIsOrganisation, tenantIsOrganisation) || other.tenantIsOrganisation == tenantIsOrganisation)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.dueDay, dueDay) || other.dueDay == dueDay)&&(identical(other.nextDueOn, nextDueOn) || other.nextDueOn == nextDueOn)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.daysToExpiry, daysToExpiry) || other.daysToExpiry == daysToExpiry)&&(identical(other.noticeDays, noticeDays) || other.noticeDays == noticeDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantUserId,tenantName,tenantPhone,tenantIsOrganisation,houseId,houseCode,houseNumber,houseLabel,propertyId,propertyName,estateId,estateName,categoryId,categoryName,usageClassName,tenure,rent,deposit,refundableDeposit,rentOwed,dueDay,nextDueOn,occupiedOn,expiresOn,daysToExpiry,noticeDays,status,createdOn]);

@override
String toString() {
  return 'OccupationModel(id: $id, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantIsOrganisation: $tenantIsOrganisation, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, categoryId: $categoryId, categoryName: $categoryName, usageClassName: $usageClassName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, rentOwed: $rentOwed, dueDay: $dueDay, nextDueOn: $nextDueOn, occupiedOn: $occupiedOn, expiresOn: $expiresOn, daysToExpiry: $daysToExpiry, noticeDays: $noticeDays, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$OccupationModelCopyWith<$Res> implements $OccupationModelCopyWith<$Res> {
  factory _$OccupationModelCopyWith(_OccupationModel value, $Res Function(_OccupationModel) _then) = __$OccupationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? tenantUserId, String? tenantName, String? tenantPhone, bool tenantIsOrganisation, String houseId, String houseCode, String? houseNumber, String? houseLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? categoryId, String? categoryName, String? usageClassName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit,@JsonKey(fromJson: parseDouble) double rentOwed, int? dueDay, String? nextDueOn, String? occupiedOn, String? expiresOn, int? daysToExpiry, int? noticeDays, int status, String? createdOn
});




}
/// @nodoc
class __$OccupationModelCopyWithImpl<$Res>
    implements _$OccupationModelCopyWith<$Res> {
  __$OccupationModelCopyWithImpl(this._self, this._then);

  final _OccupationModel _self;
  final $Res Function(_OccupationModel) _then;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantUserId = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantIsOrganisation = null,Object? houseId = null,Object? houseCode = null,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? usageClassName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? rentOwed = null,Object? dueDay = freezed,Object? nextDueOn = freezed,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? daysToExpiry = freezed,Object? noticeDays = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_OccupationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantIsOrganisation: null == tenantIsOrganisation ? _self.tenantIsOrganisation : tenantIsOrganisation // ignore: cast_nullable_to_non_nullable
as bool,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,dueDay: freezed == dueDay ? _self.dueDay : dueDay // ignore: cast_nullable_to_non_nullable
as int?,nextDueOn: freezed == nextDueOn ? _self.nextDueOn : nextDueOn // ignore: cast_nullable_to_non_nullable
as String?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,daysToExpiry: freezed == daysToExpiry ? _self.daysToExpiry : daysToExpiry // ignore: cast_nullable_to_non_nullable
as int?,noticeDays: freezed == noticeDays ? _self.noticeDays : noticeDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
