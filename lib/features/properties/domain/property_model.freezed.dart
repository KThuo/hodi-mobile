// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyModel {

 String get id; String get name; String? get estateId; String? get estateName; String? get location; String? get contactName; String? get phone; String? get email; int? get floors; int get units; int get occupiedUnits; int get vacantUnits; int? get invoiceGenerationDay;/// HODI's cut on this property's collections.
@JsonKey(fromJson: parseDoubleNullable) double? get commission; String? get bankId; String? get bankName; int get status; String? get createdOn;
/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyModelCopyWith<PropertyModel> get copyWith => _$PropertyModelCopyWithImpl<PropertyModel>(this as PropertyModel, _$identity);

  /// Serializes this PropertyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.vacantUnits, vacantUnits) || other.vacantUnits == vacantUnits)&&(identical(other.invoiceGenerationDay, invoiceGenerationDay) || other.invoiceGenerationDay == invoiceGenerationDay)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estateId,estateName,location,contactName,phone,email,floors,units,occupiedUnits,vacantUnits,invoiceGenerationDay,commission,bankId,bankName,status,createdOn);

@override
String toString() {
  return 'PropertyModel(id: $id, name: $name, estateId: $estateId, estateName: $estateName, location: $location, contactName: $contactName, phone: $phone, email: $email, floors: $floors, units: $units, occupiedUnits: $occupiedUnits, vacantUnits: $vacantUnits, invoiceGenerationDay: $invoiceGenerationDay, commission: $commission, bankId: $bankId, bankName: $bankName, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $PropertyModelCopyWith<$Res>  {
  factory $PropertyModelCopyWith(PropertyModel value, $Res Function(PropertyModel) _then) = _$PropertyModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? estateId, String? estateName, String? location, String? contactName, String? phone, String? email, int? floors, int units, int occupiedUnits, int vacantUnits, int? invoiceGenerationDay,@JsonKey(fromJson: parseDoubleNullable) double? commission, String? bankId, String? bankName, int status, String? createdOn
});




}
/// @nodoc
class _$PropertyModelCopyWithImpl<$Res>
    implements $PropertyModelCopyWith<$Res> {
  _$PropertyModelCopyWithImpl(this._self, this._then);

  final PropertyModel _self;
  final $Res Function(PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? floors = freezed,Object? units = null,Object? occupiedUnits = null,Object? vacantUnits = null,Object? invoiceGenerationDay = freezed,Object? commission = freezed,Object? bankId = freezed,Object? bankName = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int?,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,vacantUnits: null == vacantUnits ? _self.vacantUnits : vacantUnits // ignore: cast_nullable_to_non_nullable
as int,invoiceGenerationDay: freezed == invoiceGenerationDay ? _self.invoiceGenerationDay : invoiceGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,commission: freezed == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyModel].
extension PropertyModelPatterns on PropertyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyModel value)  $default,){
final _that = this;
switch (_that) {
case _PropertyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  String? contactName,  String? phone,  String? email,  int? floors,  int units,  int occupiedUnits,  int vacantUnits,  int? invoiceGenerationDay, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  String? bankId,  String? bankName,  int status,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.contactName,_that.phone,_that.email,_that.floors,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.invoiceGenerationDay,_that.commission,_that.bankId,_that.bankName,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  String? contactName,  String? phone,  String? email,  int? floors,  int units,  int occupiedUnits,  int vacantUnits,  int? invoiceGenerationDay, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  String? bankId,  String? bankName,  int status,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _PropertyModel():
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.contactName,_that.phone,_that.email,_that.floors,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.invoiceGenerationDay,_that.commission,_that.bankId,_that.bankName,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  String? contactName,  String? phone,  String? email,  int? floors,  int units,  int occupiedUnits,  int vacantUnits,  int? invoiceGenerationDay, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  String? bankId,  String? bankName,  int status,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _PropertyModel() when $default != null:
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.contactName,_that.phone,_that.email,_that.floors,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.invoiceGenerationDay,_that.commission,_that.bankId,_that.bankName,_that.status,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyModel extends PropertyModel {
  const _PropertyModel({required this.id, required this.name, this.estateId, this.estateName, this.location, this.contactName, this.phone, this.email, this.floors, this.units = 0, this.occupiedUnits = 0, this.vacantUnits = 0, this.invoiceGenerationDay, @JsonKey(fromJson: parseDoubleNullable) this.commission, this.bankId, this.bankName, this.status = 0, this.createdOn}): super._();
  factory _PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? location;
@override final  String? contactName;
@override final  String? phone;
@override final  String? email;
@override final  int? floors;
@override@JsonKey() final  int units;
@override@JsonKey() final  int occupiedUnits;
@override@JsonKey() final  int vacantUnits;
@override final  int? invoiceGenerationDay;
/// HODI's cut on this property's collections.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? commission;
@override final  String? bankId;
@override final  String? bankName;
@override@JsonKey() final  int status;
@override final  String? createdOn;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyModelCopyWith<_PropertyModel> get copyWith => __$PropertyModelCopyWithImpl<_PropertyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.vacantUnits, vacantUnits) || other.vacantUnits == vacantUnits)&&(identical(other.invoiceGenerationDay, invoiceGenerationDay) || other.invoiceGenerationDay == invoiceGenerationDay)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estateId,estateName,location,contactName,phone,email,floors,units,occupiedUnits,vacantUnits,invoiceGenerationDay,commission,bankId,bankName,status,createdOn);

@override
String toString() {
  return 'PropertyModel(id: $id, name: $name, estateId: $estateId, estateName: $estateName, location: $location, contactName: $contactName, phone: $phone, email: $email, floors: $floors, units: $units, occupiedUnits: $occupiedUnits, vacantUnits: $vacantUnits, invoiceGenerationDay: $invoiceGenerationDay, commission: $commission, bankId: $bankId, bankName: $bankName, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$PropertyModelCopyWith<$Res> implements $PropertyModelCopyWith<$Res> {
  factory _$PropertyModelCopyWith(_PropertyModel value, $Res Function(_PropertyModel) _then) = __$PropertyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? estateId, String? estateName, String? location, String? contactName, String? phone, String? email, int? floors, int units, int occupiedUnits, int vacantUnits, int? invoiceGenerationDay,@JsonKey(fromJson: parseDoubleNullable) double? commission, String? bankId, String? bankName, int status, String? createdOn
});




}
/// @nodoc
class __$PropertyModelCopyWithImpl<$Res>
    implements _$PropertyModelCopyWith<$Res> {
  __$PropertyModelCopyWithImpl(this._self, this._then);

  final _PropertyModel _self;
  final $Res Function(_PropertyModel) _then;

/// Create a copy of PropertyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? floors = freezed,Object? units = null,Object? occupiedUnits = null,Object? vacantUnits = null,Object? invoiceGenerationDay = freezed,Object? commission = freezed,Object? bankId = freezed,Object? bankName = freezed,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_PropertyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int?,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,vacantUnits: null == vacantUnits ? _self.vacantUnits : vacantUnits // ignore: cast_nullable_to_non_nullable
as int,invoiceGenerationDay: freezed == invoiceGenerationDay ? _self.invoiceGenerationDay : invoiceGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,commission: freezed == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
