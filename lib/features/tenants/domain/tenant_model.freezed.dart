// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantModel {

 int? get id; String? get houseCode; String? get houseName; String? get tenantName; String? get tenantPhone; String? get category; String? get estate; String? get property; String? get houseType; double get rentOwed; String? get dueDate; int? get houseId; int? get propertyId; double get rent; String? get payDate; String? get userId; bool get self;
/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantModelCopyWith<TenantModel> get copyWith => _$TenantModelCopyWithImpl<TenantModel>(this as TenantModel, _$identity);

  /// Serializes this TenantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.category, category) || other.category == category)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.property, property) || other.property == property)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.payDate, payDate) || other.payDate == payDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.self, self) || other.self == self));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseCode,houseName,tenantName,tenantPhone,category,estate,property,houseType,rentOwed,dueDate,houseId,propertyId,rent,payDate,userId,self);

@override
String toString() {
  return 'TenantModel(id: $id, houseCode: $houseCode, houseName: $houseName, tenantName: $tenantName, tenantPhone: $tenantPhone, category: $category, estate: $estate, property: $property, houseType: $houseType, rentOwed: $rentOwed, dueDate: $dueDate, houseId: $houseId, propertyId: $propertyId, rent: $rent, payDate: $payDate, userId: $userId, self: $self)';
}


}

/// @nodoc
abstract mixin class $TenantModelCopyWith<$Res>  {
  factory $TenantModelCopyWith(TenantModel value, $Res Function(TenantModel) _then) = _$TenantModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? houseCode, String? houseName, String? tenantName, String? tenantPhone, String? category, String? estate, String? property, String? houseType, double rentOwed, String? dueDate, int? houseId, int? propertyId, double rent, String? payDate, String? userId, bool self
});




}
/// @nodoc
class _$TenantModelCopyWithImpl<$Res>
    implements $TenantModelCopyWith<$Res> {
  _$TenantModelCopyWithImpl(this._self, this._then);

  final TenantModel _self;
  final $Res Function(TenantModel) _then;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? houseCode = freezed,Object? houseName = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? category = freezed,Object? estate = freezed,Object? property = freezed,Object? houseType = freezed,Object? rentOwed = null,Object? dueDate = freezed,Object? houseId = freezed,Object? propertyId = freezed,Object? rent = null,Object? payDate = freezed,Object? userId = freezed,Object? self = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,payDate: freezed == payDate ? _self.payDate : payDate // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantModel].
extension TenantModelPatterns on TenantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? houseCode,  String? houseName,  String? tenantName,  String? tenantPhone,  String? category,  String? estate,  String? property,  String? houseType,  double rentOwed,  String? dueDate,  int? houseId,  int? propertyId,  double rent,  String? payDate,  String? userId,  bool self)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseName,_that.tenantName,_that.tenantPhone,_that.category,_that.estate,_that.property,_that.houseType,_that.rentOwed,_that.dueDate,_that.houseId,_that.propertyId,_that.rent,_that.payDate,_that.userId,_that.self);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? houseCode,  String? houseName,  String? tenantName,  String? tenantPhone,  String? category,  String? estate,  String? property,  String? houseType,  double rentOwed,  String? dueDate,  int? houseId,  int? propertyId,  double rent,  String? payDate,  String? userId,  bool self)  $default,) {final _that = this;
switch (_that) {
case _TenantModel():
return $default(_that.id,_that.houseCode,_that.houseName,_that.tenantName,_that.tenantPhone,_that.category,_that.estate,_that.property,_that.houseType,_that.rentOwed,_that.dueDate,_that.houseId,_that.propertyId,_that.rent,_that.payDate,_that.userId,_that.self);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? houseCode,  String? houseName,  String? tenantName,  String? tenantPhone,  String? category,  String? estate,  String? property,  String? houseType,  double rentOwed,  String? dueDate,  int? houseId,  int? propertyId,  double rent,  String? payDate,  String? userId,  bool self)?  $default,) {final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
return $default(_that.id,_that.houseCode,_that.houseName,_that.tenantName,_that.tenantPhone,_that.category,_that.estate,_that.property,_that.houseType,_that.rentOwed,_that.dueDate,_that.houseId,_that.propertyId,_that.rent,_that.payDate,_that.userId,_that.self);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantModel extends TenantModel {
  const _TenantModel({this.id, this.houseCode, this.houseName, this.tenantName, this.tenantPhone, this.category, this.estate, this.property, this.houseType, this.rentOwed = 0, this.dueDate, this.houseId, this.propertyId, this.rent = 0, this.payDate, this.userId, this.self = false}): super._();
  factory _TenantModel.fromJson(Map<String, dynamic> json) => _$TenantModelFromJson(json);

@override final  int? id;
@override final  String? houseCode;
@override final  String? houseName;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? category;
@override final  String? estate;
@override final  String? property;
@override final  String? houseType;
@override@JsonKey() final  double rentOwed;
@override final  String? dueDate;
@override final  int? houseId;
@override final  int? propertyId;
@override@JsonKey() final  double rent;
@override final  String? payDate;
@override final  String? userId;
@override@JsonKey() final  bool self;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantModelCopyWith<_TenantModel> get copyWith => __$TenantModelCopyWithImpl<_TenantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.category, category) || other.category == category)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.property, property) || other.property == property)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.payDate, payDate) || other.payDate == payDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.self, self) || other.self == self));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseCode,houseName,tenantName,tenantPhone,category,estate,property,houseType,rentOwed,dueDate,houseId,propertyId,rent,payDate,userId,self);

@override
String toString() {
  return 'TenantModel(id: $id, houseCode: $houseCode, houseName: $houseName, tenantName: $tenantName, tenantPhone: $tenantPhone, category: $category, estate: $estate, property: $property, houseType: $houseType, rentOwed: $rentOwed, dueDate: $dueDate, houseId: $houseId, propertyId: $propertyId, rent: $rent, payDate: $payDate, userId: $userId, self: $self)';
}


}

/// @nodoc
abstract mixin class _$TenantModelCopyWith<$Res> implements $TenantModelCopyWith<$Res> {
  factory _$TenantModelCopyWith(_TenantModel value, $Res Function(_TenantModel) _then) = __$TenantModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? houseCode, String? houseName, String? tenantName, String? tenantPhone, String? category, String? estate, String? property, String? houseType, double rentOwed, String? dueDate, int? houseId, int? propertyId, double rent, String? payDate, String? userId, bool self
});




}
/// @nodoc
class __$TenantModelCopyWithImpl<$Res>
    implements _$TenantModelCopyWith<$Res> {
  __$TenantModelCopyWithImpl(this._self, this._then);

  final _TenantModel _self;
  final $Res Function(_TenantModel) _then;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? houseCode = freezed,Object? houseName = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? category = freezed,Object? estate = freezed,Object? property = freezed,Object? houseType = freezed,Object? rentOwed = null,Object? dueDate = freezed,Object? houseId = freezed,Object? propertyId = freezed,Object? rent = null,Object? payDate = freezed,Object? userId = freezed,Object? self = null,}) {
  return _then(_TenantModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as int?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,payDate: freezed == payDate ? _self.payDate : payDate // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
