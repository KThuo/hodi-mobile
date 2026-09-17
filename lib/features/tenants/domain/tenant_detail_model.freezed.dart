// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantDetailModel {

 TenantModel get tenant;/// Live tenancies. More than one is normal.
 List<OccupationModel> get current;/// Where they have lived before, most recent first.
 List<TenancyHistoryModel> get history;/// Sections whose data belongs to a module that does not exist yet. Named rather than sent as
/// zeroes, because a zero in a money field reads as "nothing owed".
 List<String> get pending;
/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantDetailModelCopyWith<TenantDetailModel> get copyWith => _$TenantDetailModelCopyWithImpl<TenantDetailModel>(this as TenantDetailModel, _$identity);

  /// Serializes this TenantDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantDetailModel&&(identical(other.tenant, tenant) || other.tenant == tenant)&&const DeepCollectionEquality().equals(other.current, current)&&const DeepCollectionEquality().equals(other.history, history)&&const DeepCollectionEquality().equals(other.pending, pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,const DeepCollectionEquality().hash(current),const DeepCollectionEquality().hash(history),const DeepCollectionEquality().hash(pending));

@override
String toString() {
  return 'TenantDetailModel(tenant: $tenant, current: $current, history: $history, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $TenantDetailModelCopyWith<$Res>  {
  factory $TenantDetailModelCopyWith(TenantDetailModel value, $Res Function(TenantDetailModel) _then) = _$TenantDetailModelCopyWithImpl;
@useResult
$Res call({
 TenantModel tenant, List<OccupationModel> current, List<TenancyHistoryModel> history, List<String> pending
});


$TenantModelCopyWith<$Res> get tenant;

}
/// @nodoc
class _$TenantDetailModelCopyWithImpl<$Res>
    implements $TenantDetailModelCopyWith<$Res> {
  _$TenantDetailModelCopyWithImpl(this._self, this._then);

  final TenantDetailModel _self;
  final $Res Function(TenantDetailModel) _then;

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenant = null,Object? current = null,Object? history = null,Object? pending = null,}) {
  return _then(_self.copyWith(
tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantModel,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as List<OccupationModel>,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<TenancyHistoryModel>,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantModelCopyWith<$Res> get tenant {
  
  return $TenantModelCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// Adds pattern-matching-related methods to [TenantDetailModel].
extension TenantDetailModelPatterns on TenantDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TenantModel tenant,  List<OccupationModel> current,  List<TenancyHistoryModel> history,  List<String> pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
return $default(_that.tenant,_that.current,_that.history,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TenantModel tenant,  List<OccupationModel> current,  List<TenancyHistoryModel> history,  List<String> pending)  $default,) {final _that = this;
switch (_that) {
case _TenantDetailModel():
return $default(_that.tenant,_that.current,_that.history,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TenantModel tenant,  List<OccupationModel> current,  List<TenancyHistoryModel> history,  List<String> pending)?  $default,) {final _that = this;
switch (_that) {
case _TenantDetailModel() when $default != null:
return $default(_that.tenant,_that.current,_that.history,_that.pending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantDetailModel extends TenantDetailModel {
  const _TenantDetailModel({required this.tenant, final  List<OccupationModel> current = const <OccupationModel>[], final  List<TenancyHistoryModel> history = const <TenancyHistoryModel>[], final  List<String> pending = const <String>[]}): _current = current,_history = history,_pending = pending,super._();
  factory _TenantDetailModel.fromJson(Map<String, dynamic> json) => _$TenantDetailModelFromJson(json);

@override final  TenantModel tenant;
/// Live tenancies. More than one is normal.
 final  List<OccupationModel> _current;
/// Live tenancies. More than one is normal.
@override@JsonKey() List<OccupationModel> get current {
  if (_current is EqualUnmodifiableListView) return _current;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_current);
}

/// Where they have lived before, most recent first.
 final  List<TenancyHistoryModel> _history;
/// Where they have lived before, most recent first.
@override@JsonKey() List<TenancyHistoryModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

/// Sections whose data belongs to a module that does not exist yet. Named rather than sent as
/// zeroes, because a zero in a money field reads as "nothing owed".
 final  List<String> _pending;
/// Sections whose data belongs to a module that does not exist yet. Named rather than sent as
/// zeroes, because a zero in a money field reads as "nothing owed".
@override@JsonKey() List<String> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}


/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantDetailModelCopyWith<_TenantDetailModel> get copyWith => __$TenantDetailModelCopyWithImpl<_TenantDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantDetailModel&&(identical(other.tenant, tenant) || other.tenant == tenant)&&const DeepCollectionEquality().equals(other._current, _current)&&const DeepCollectionEquality().equals(other._history, _history)&&const DeepCollectionEquality().equals(other._pending, _pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenant,const DeepCollectionEquality().hash(_current),const DeepCollectionEquality().hash(_history),const DeepCollectionEquality().hash(_pending));

@override
String toString() {
  return 'TenantDetailModel(tenant: $tenant, current: $current, history: $history, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$TenantDetailModelCopyWith<$Res> implements $TenantDetailModelCopyWith<$Res> {
  factory _$TenantDetailModelCopyWith(_TenantDetailModel value, $Res Function(_TenantDetailModel) _then) = __$TenantDetailModelCopyWithImpl;
@override @useResult
$Res call({
 TenantModel tenant, List<OccupationModel> current, List<TenancyHistoryModel> history, List<String> pending
});


@override $TenantModelCopyWith<$Res> get tenant;

}
/// @nodoc
class __$TenantDetailModelCopyWithImpl<$Res>
    implements _$TenantDetailModelCopyWith<$Res> {
  __$TenantDetailModelCopyWithImpl(this._self, this._then);

  final _TenantDetailModel _self;
  final $Res Function(_TenantDetailModel) _then;

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenant = null,Object? current = null,Object? history = null,Object? pending = null,}) {
  return _then(_TenantDetailModel(
tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as TenantModel,current: null == current ? _self._current : current // ignore: cast_nullable_to_non_nullable
as List<OccupationModel>,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<TenancyHistoryModel>,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of TenantDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantModelCopyWith<$Res> get tenant {
  
  return $TenantModelCopyWith<$Res>(_self.tenant, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}
}


/// @nodoc
mixin _$TenancyHistoryModel {

 String get id; String? get occupationId; String? get houseId; String get houseCode; String? get houseLabel; String? get propertyName; String? get tenure;@JsonKey(fromJson: parseDouble) double get rent;@JsonKey(fromJson: parseDouble) double get deposit;@JsonKey(fromJson: parseDouble) double get refundableDeposit; String? get occupiedOn; String? get vacatedOn;/// How long they were there, counted by the server.
 int get nights; String? get reason; String? get notes;
/// Create a copy of TenancyHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenancyHistoryModelCopyWith<TenancyHistoryModel> get copyWith => _$TenancyHistoryModelCopyWithImpl<TenancyHistoryModel>(this as TenancyHistoryModel, _$identity);

  /// Serializes this TenancyHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenancyHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.vacatedOn, vacatedOn) || other.vacatedOn == vacatedOn)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,occupationId,houseId,houseCode,houseLabel,propertyName,tenure,rent,deposit,refundableDeposit,occupiedOn,vacatedOn,nights,reason,notes);

@override
String toString() {
  return 'TenancyHistoryModel(id: $id, occupationId: $occupationId, houseId: $houseId, houseCode: $houseCode, houseLabel: $houseLabel, propertyName: $propertyName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, occupiedOn: $occupiedOn, vacatedOn: $vacatedOn, nights: $nights, reason: $reason, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TenancyHistoryModelCopyWith<$Res>  {
  factory $TenancyHistoryModelCopyWith(TenancyHistoryModel value, $Res Function(TenancyHistoryModel) _then) = _$TenancyHistoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String? occupationId, String? houseId, String houseCode, String? houseLabel, String? propertyName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit, String? occupiedOn, String? vacatedOn, int nights, String? reason, String? notes
});




}
/// @nodoc
class _$TenancyHistoryModelCopyWithImpl<$Res>
    implements $TenancyHistoryModelCopyWith<$Res> {
  _$TenancyHistoryModelCopyWithImpl(this._self, this._then);

  final TenancyHistoryModel _self;
  final $Res Function(TenancyHistoryModel) _then;

/// Create a copy of TenancyHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? occupationId = freezed,Object? houseId = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? propertyName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? occupiedOn = freezed,Object? vacatedOn = freezed,Object? nights = null,Object? reason = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,vacatedOn: freezed == vacatedOn ? _self.vacatedOn : vacatedOn // ignore: cast_nullable_to_non_nullable
as String?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TenancyHistoryModel].
extension TenancyHistoryModelPatterns on TenancyHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenancyHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenancyHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenancyHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TenancyHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenancyHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenancyHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? occupationId,  String? houseId,  String houseCode,  String? houseLabel,  String? propertyName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  String? occupiedOn,  String? vacatedOn,  int nights,  String? reason,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenancyHistoryModel() when $default != null:
return $default(_that.id,_that.occupationId,_that.houseId,_that.houseCode,_that.houseLabel,_that.propertyName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.occupiedOn,_that.vacatedOn,_that.nights,_that.reason,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? occupationId,  String? houseId,  String houseCode,  String? houseLabel,  String? propertyName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  String? occupiedOn,  String? vacatedOn,  int nights,  String? reason,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TenancyHistoryModel():
return $default(_that.id,_that.occupationId,_that.houseId,_that.houseCode,_that.houseLabel,_that.propertyName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.occupiedOn,_that.vacatedOn,_that.nights,_that.reason,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? occupationId,  String? houseId,  String houseCode,  String? houseLabel,  String? propertyName,  String? tenure, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double deposit, @JsonKey(fromJson: parseDouble)  double refundableDeposit,  String? occupiedOn,  String? vacatedOn,  int nights,  String? reason,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TenancyHistoryModel() when $default != null:
return $default(_that.id,_that.occupationId,_that.houseId,_that.houseCode,_that.houseLabel,_that.propertyName,_that.tenure,_that.rent,_that.deposit,_that.refundableDeposit,_that.occupiedOn,_that.vacatedOn,_that.nights,_that.reason,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenancyHistoryModel extends TenancyHistoryModel {
  const _TenancyHistoryModel({required this.id, this.occupationId, this.houseId, required this.houseCode, this.houseLabel, this.propertyName, this.tenure, @JsonKey(fromJson: parseDouble) this.rent = 0, @JsonKey(fromJson: parseDouble) this.deposit = 0, @JsonKey(fromJson: parseDouble) this.refundableDeposit = 0, this.occupiedOn, this.vacatedOn, this.nights = 0, this.reason, this.notes}): super._();
  factory _TenancyHistoryModel.fromJson(Map<String, dynamic> json) => _$TenancyHistoryModelFromJson(json);

@override final  String id;
@override final  String? occupationId;
@override final  String? houseId;
@override final  String houseCode;
@override final  String? houseLabel;
@override final  String? propertyName;
@override final  String? tenure;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override@JsonKey(fromJson: parseDouble) final  double deposit;
@override@JsonKey(fromJson: parseDouble) final  double refundableDeposit;
@override final  String? occupiedOn;
@override final  String? vacatedOn;
/// How long they were there, counted by the server.
@override@JsonKey() final  int nights;
@override final  String? reason;
@override final  String? notes;

/// Create a copy of TenancyHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenancyHistoryModelCopyWith<_TenancyHistoryModel> get copyWith => __$TenancyHistoryModelCopyWithImpl<_TenancyHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenancyHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenancyHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.vacatedOn, vacatedOn) || other.vacatedOn == vacatedOn)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,occupationId,houseId,houseCode,houseLabel,propertyName,tenure,rent,deposit,refundableDeposit,occupiedOn,vacatedOn,nights,reason,notes);

@override
String toString() {
  return 'TenancyHistoryModel(id: $id, occupationId: $occupationId, houseId: $houseId, houseCode: $houseCode, houseLabel: $houseLabel, propertyName: $propertyName, tenure: $tenure, rent: $rent, deposit: $deposit, refundableDeposit: $refundableDeposit, occupiedOn: $occupiedOn, vacatedOn: $vacatedOn, nights: $nights, reason: $reason, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TenancyHistoryModelCopyWith<$Res> implements $TenancyHistoryModelCopyWith<$Res> {
  factory _$TenancyHistoryModelCopyWith(_TenancyHistoryModel value, $Res Function(_TenancyHistoryModel) _then) = __$TenancyHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? occupationId, String? houseId, String houseCode, String? houseLabel, String? propertyName, String? tenure,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double deposit,@JsonKey(fromJson: parseDouble) double refundableDeposit, String? occupiedOn, String? vacatedOn, int nights, String? reason, String? notes
});




}
/// @nodoc
class __$TenancyHistoryModelCopyWithImpl<$Res>
    implements _$TenancyHistoryModelCopyWith<$Res> {
  __$TenancyHistoryModelCopyWithImpl(this._self, this._then);

  final _TenancyHistoryModel _self;
  final $Res Function(_TenancyHistoryModel) _then;

/// Create a copy of TenancyHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? occupationId = freezed,Object? houseId = freezed,Object? houseCode = null,Object? houseLabel = freezed,Object? propertyName = freezed,Object? tenure = freezed,Object? rent = null,Object? deposit = null,Object? refundableDeposit = null,Object? occupiedOn = freezed,Object? vacatedOn = freezed,Object? nights = null,Object? reason = freezed,Object? notes = freezed,}) {
  return _then(_TenancyHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,tenure: freezed == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,deposit: null == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,vacatedOn: freezed == vacatedOn ? _self.vacatedOn : vacatedOn // ignore: cast_nullable_to_non_nullable
as String?,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
