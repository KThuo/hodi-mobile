// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseDetailModel {

 String? get houseName; String? get houseCode; int get floor; int get status;@JsonKey(name: 'occupied') bool get isOccupied; double get rent; String? get location; double? get squareFt; String? get property; String? get category; String? get houseType; String? get estate; HouseTenant? get tenant;
/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseDetailModelCopyWith<HouseDetailModel> get copyWith => _$HouseDetailModelCopyWithImpl<HouseDetailModel>(this as HouseDetailModel, _$identity);

  /// Serializes this HouseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseDetailModel&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOccupied, isOccupied) || other.isOccupied == isOccupied)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.location, location) || other.location == location)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.property, property) || other.property == property)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,houseName,houseCode,floor,status,isOccupied,rent,location,squareFt,property,category,houseType,estate,tenant);

@override
String toString() {
  return 'HouseDetailModel(houseName: $houseName, houseCode: $houseCode, floor: $floor, status: $status, isOccupied: $isOccupied, rent: $rent, location: $location, squareFt: $squareFt, property: $property, category: $category, houseType: $houseType, estate: $estate, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class $HouseDetailModelCopyWith<$Res>  {
  factory $HouseDetailModelCopyWith(HouseDetailModel value, $Res Function(HouseDetailModel) _then) = _$HouseDetailModelCopyWithImpl;
@useResult
$Res call({
 String? houseName, String? houseCode, int floor, int status,@JsonKey(name: 'occupied') bool isOccupied, double rent, String? location, double? squareFt, String? property, String? category, String? houseType, String? estate, HouseTenant? tenant
});


$HouseTenantCopyWith<$Res>? get tenant;

}
/// @nodoc
class _$HouseDetailModelCopyWithImpl<$Res>
    implements $HouseDetailModelCopyWith<$Res> {
  _$HouseDetailModelCopyWithImpl(this._self, this._then);

  final HouseDetailModel _self;
  final $Res Function(HouseDetailModel) _then;

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? houseName = freezed,Object? houseCode = freezed,Object? floor = null,Object? status = null,Object? isOccupied = null,Object? rent = null,Object? location = freezed,Object? squareFt = freezed,Object? property = freezed,Object? category = freezed,Object? houseType = freezed,Object? estate = freezed,Object? tenant = freezed,}) {
  return _then(_self.copyWith(
houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,isOccupied: null == isOccupied ? _self.isOccupied : isOccupied // ignore: cast_nullable_to_non_nullable
as bool,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as HouseTenant?,
  ));
}
/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $HouseTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [HouseDetailModel].
extension HouseDetailModelPatterns on HouseDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _HouseDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? houseName,  String? houseCode,  int floor,  int status, @JsonKey(name: 'occupied')  bool isOccupied,  double rent,  String? location,  double? squareFt,  String? property,  String? category,  String? houseType,  String? estate,  HouseTenant? tenant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
return $default(_that.houseName,_that.houseCode,_that.floor,_that.status,_that.isOccupied,_that.rent,_that.location,_that.squareFt,_that.property,_that.category,_that.houseType,_that.estate,_that.tenant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? houseName,  String? houseCode,  int floor,  int status, @JsonKey(name: 'occupied')  bool isOccupied,  double rent,  String? location,  double? squareFt,  String? property,  String? category,  String? houseType,  String? estate,  HouseTenant? tenant)  $default,) {final _that = this;
switch (_that) {
case _HouseDetailModel():
return $default(_that.houseName,_that.houseCode,_that.floor,_that.status,_that.isOccupied,_that.rent,_that.location,_that.squareFt,_that.property,_that.category,_that.houseType,_that.estate,_that.tenant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? houseName,  String? houseCode,  int floor,  int status, @JsonKey(name: 'occupied')  bool isOccupied,  double rent,  String? location,  double? squareFt,  String? property,  String? category,  String? houseType,  String? estate,  HouseTenant? tenant)?  $default,) {final _that = this;
switch (_that) {
case _HouseDetailModel() when $default != null:
return $default(_that.houseName,_that.houseCode,_that.floor,_that.status,_that.isOccupied,_that.rent,_that.location,_that.squareFt,_that.property,_that.category,_that.houseType,_that.estate,_that.tenant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseDetailModel extends HouseDetailModel {
  const _HouseDetailModel({this.houseName, this.houseCode, this.floor = 0, this.status = 0, @JsonKey(name: 'occupied') this.isOccupied = false, this.rent = 0, this.location, this.squareFt, this.property, this.category, this.houseType, this.estate, this.tenant}): super._();
  factory _HouseDetailModel.fromJson(Map<String, dynamic> json) => _$HouseDetailModelFromJson(json);

@override final  String? houseName;
@override final  String? houseCode;
@override@JsonKey() final  int floor;
@override@JsonKey() final  int status;
@override@JsonKey(name: 'occupied') final  bool isOccupied;
@override@JsonKey() final  double rent;
@override final  String? location;
@override final  double? squareFt;
@override final  String? property;
@override final  String? category;
@override final  String? houseType;
@override final  String? estate;
@override final  HouseTenant? tenant;

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseDetailModelCopyWith<_HouseDetailModel> get copyWith => __$HouseDetailModelCopyWithImpl<_HouseDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseDetailModel&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOccupied, isOccupied) || other.isOccupied == isOccupied)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.location, location) || other.location == location)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.property, property) || other.property == property)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.tenant, tenant) || other.tenant == tenant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,houseName,houseCode,floor,status,isOccupied,rent,location,squareFt,property,category,houseType,estate,tenant);

@override
String toString() {
  return 'HouseDetailModel(houseName: $houseName, houseCode: $houseCode, floor: $floor, status: $status, isOccupied: $isOccupied, rent: $rent, location: $location, squareFt: $squareFt, property: $property, category: $category, houseType: $houseType, estate: $estate, tenant: $tenant)';
}


}

/// @nodoc
abstract mixin class _$HouseDetailModelCopyWith<$Res> implements $HouseDetailModelCopyWith<$Res> {
  factory _$HouseDetailModelCopyWith(_HouseDetailModel value, $Res Function(_HouseDetailModel) _then) = __$HouseDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? houseName, String? houseCode, int floor, int status,@JsonKey(name: 'occupied') bool isOccupied, double rent, String? location, double? squareFt, String? property, String? category, String? houseType, String? estate, HouseTenant? tenant
});


@override $HouseTenantCopyWith<$Res>? get tenant;

}
/// @nodoc
class __$HouseDetailModelCopyWithImpl<$Res>
    implements _$HouseDetailModelCopyWith<$Res> {
  __$HouseDetailModelCopyWithImpl(this._self, this._then);

  final _HouseDetailModel _self;
  final $Res Function(_HouseDetailModel) _then;

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? houseName = freezed,Object? houseCode = freezed,Object? floor = null,Object? status = null,Object? isOccupied = null,Object? rent = null,Object? location = freezed,Object? squareFt = freezed,Object? property = freezed,Object? category = freezed,Object? houseType = freezed,Object? estate = freezed,Object? tenant = freezed,}) {
  return _then(_HouseDetailModel(
houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,isOccupied: null == isOccupied ? _self.isOccupied : isOccupied // ignore: cast_nullable_to_non_nullable
as bool,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as HouseTenant?,
  ));
}

/// Create a copy of HouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $HouseTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// @nodoc
mixin _$HouseTenant {

 String? get name; String? get phone; double get rentOwed; String? get invoiceRrn; String? get invoiceMonth; String? get dueDate; String? get occupiedOn; double get refundableAmount;
/// Create a copy of HouseTenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseTenantCopyWith<HouseTenant> get copyWith => _$HouseTenantCopyWithImpl<HouseTenant>(this as HouseTenant, _$identity);

  /// Serializes this HouseTenant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseTenant&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.invoiceMonth, invoiceMonth) || other.invoiceMonth == invoiceMonth)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.refundableAmount, refundableAmount) || other.refundableAmount == refundableAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,rentOwed,invoiceRrn,invoiceMonth,dueDate,occupiedOn,refundableAmount);

@override
String toString() {
  return 'HouseTenant(name: $name, phone: $phone, rentOwed: $rentOwed, invoiceRrn: $invoiceRrn, invoiceMonth: $invoiceMonth, dueDate: $dueDate, occupiedOn: $occupiedOn, refundableAmount: $refundableAmount)';
}


}

/// @nodoc
abstract mixin class $HouseTenantCopyWith<$Res>  {
  factory $HouseTenantCopyWith(HouseTenant value, $Res Function(HouseTenant) _then) = _$HouseTenantCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone, double rentOwed, String? invoiceRrn, String? invoiceMonth, String? dueDate, String? occupiedOn, double refundableAmount
});




}
/// @nodoc
class _$HouseTenantCopyWithImpl<$Res>
    implements $HouseTenantCopyWith<$Res> {
  _$HouseTenantCopyWithImpl(this._self, this._then);

  final HouseTenant _self;
  final $Res Function(HouseTenant) _then;

/// Create a copy of HouseTenant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,Object? rentOwed = null,Object? invoiceRrn = freezed,Object? invoiceMonth = freezed,Object? dueDate = freezed,Object? occupiedOn = freezed,Object? refundableAmount = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceMonth: freezed == invoiceMonth ? _self.invoiceMonth : invoiceMonth // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,refundableAmount: null == refundableAmount ? _self.refundableAmount : refundableAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseTenant].
extension HouseTenantPatterns on HouseTenant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseTenant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseTenant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseTenant value)  $default,){
final _that = this;
switch (_that) {
case _HouseTenant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseTenant value)?  $default,){
final _that = this;
switch (_that) {
case _HouseTenant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone,  double rentOwed,  String? invoiceRrn,  String? invoiceMonth,  String? dueDate,  String? occupiedOn,  double refundableAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseTenant() when $default != null:
return $default(_that.name,_that.phone,_that.rentOwed,_that.invoiceRrn,_that.invoiceMonth,_that.dueDate,_that.occupiedOn,_that.refundableAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone,  double rentOwed,  String? invoiceRrn,  String? invoiceMonth,  String? dueDate,  String? occupiedOn,  double refundableAmount)  $default,) {final _that = this;
switch (_that) {
case _HouseTenant():
return $default(_that.name,_that.phone,_that.rentOwed,_that.invoiceRrn,_that.invoiceMonth,_that.dueDate,_that.occupiedOn,_that.refundableAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone,  double rentOwed,  String? invoiceRrn,  String? invoiceMonth,  String? dueDate,  String? occupiedOn,  double refundableAmount)?  $default,) {final _that = this;
switch (_that) {
case _HouseTenant() when $default != null:
return $default(_that.name,_that.phone,_that.rentOwed,_that.invoiceRrn,_that.invoiceMonth,_that.dueDate,_that.occupiedOn,_that.refundableAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseTenant extends HouseTenant {
  const _HouseTenant({this.name, this.phone, this.rentOwed = 0, this.invoiceRrn, this.invoiceMonth, this.dueDate, this.occupiedOn, this.refundableAmount = 0}): super._();
  factory _HouseTenant.fromJson(Map<String, dynamic> json) => _$HouseTenantFromJson(json);

@override final  String? name;
@override final  String? phone;
@override@JsonKey() final  double rentOwed;
@override final  String? invoiceRrn;
@override final  String? invoiceMonth;
@override final  String? dueDate;
@override final  String? occupiedOn;
@override@JsonKey() final  double refundableAmount;

/// Create a copy of HouseTenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseTenantCopyWith<_HouseTenant> get copyWith => __$HouseTenantCopyWithImpl<_HouseTenant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseTenantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseTenant&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.invoiceMonth, invoiceMonth) || other.invoiceMonth == invoiceMonth)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.refundableAmount, refundableAmount) || other.refundableAmount == refundableAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,rentOwed,invoiceRrn,invoiceMonth,dueDate,occupiedOn,refundableAmount);

@override
String toString() {
  return 'HouseTenant(name: $name, phone: $phone, rentOwed: $rentOwed, invoiceRrn: $invoiceRrn, invoiceMonth: $invoiceMonth, dueDate: $dueDate, occupiedOn: $occupiedOn, refundableAmount: $refundableAmount)';
}


}

/// @nodoc
abstract mixin class _$HouseTenantCopyWith<$Res> implements $HouseTenantCopyWith<$Res> {
  factory _$HouseTenantCopyWith(_HouseTenant value, $Res Function(_HouseTenant) _then) = __$HouseTenantCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone, double rentOwed, String? invoiceRrn, String? invoiceMonth, String? dueDate, String? occupiedOn, double refundableAmount
});




}
/// @nodoc
class __$HouseTenantCopyWithImpl<$Res>
    implements _$HouseTenantCopyWith<$Res> {
  __$HouseTenantCopyWithImpl(this._self, this._then);

  final _HouseTenant _self;
  final $Res Function(_HouseTenant) _then;

/// Create a copy of HouseTenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,Object? rentOwed = null,Object? invoiceRrn = freezed,Object? invoiceMonth = freezed,Object? dueDate = freezed,Object? occupiedOn = freezed,Object? refundableAmount = null,}) {
  return _then(_HouseTenant(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceMonth: freezed == invoiceMonth ? _self.invoiceMonth : invoiceMonth // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,refundableAmount: null == refundableAmount ? _self.refundableAmount : refundableAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
