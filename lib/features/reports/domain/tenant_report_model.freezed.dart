// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantReportModel {

 String get id; String? get tenantUserId; String get tenantName; String? get tenantPhone; String? get houseId; String? get houseCode; String? get houseNumber;/// Composed by the server, as everywhere else in the platform.
 String? get unitLabel; String? get categoryName; String? get propertyName; String? get estateName;@JsonKey(fromJson: parseDouble) double get rent;@JsonKey(fromJson: parseDouble) double get depositHeld; String? get occupiedOn; String? get expiresOn;@JsonKey(fromJson: parseDouble) double get invoicedAmount;@JsonKey(fromJson: parseDouble) double get paidAmount;@JsonKey(fromJson: parseDouble) double get rentInvoiced;@JsonKey(fromJson: parseDouble) double get arrears;@JsonKey(fromJson: parseDouble) double get credit;/// Arrears less credit — the one number that answers "where does this tenancy stand".
/// Computed by the server so every screen showing it shows the same thing.
@JsonKey(fromJson: parseDouble) double get accountBalance; int get unpaidInvoices;/// How many days old the oldest unpaid invoice is. Null where nothing is unpaid.
 int? get oldestUnpaid; String? get lastPaymentOn;@JsonKey(fromJson: parseDouble) double get lastPaymentAmount;/// Null where nothing was invoiced — a tenancy nobody has billed has no rate, which is not
/// the same as a rate of nought.
@JsonKey(fromJson: parseDoubleNullable) double? get collectionRate;
/// Create a copy of TenantReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantReportModelCopyWith<TenantReportModel> get copyWith => _$TenantReportModelCopyWithImpl<TenantReportModel>(this as TenantReportModel, _$identity);

  /// Serializes this TenantReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.depositHeld, depositHeld) || other.depositHeld == depositHeld)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.invoicedAmount, invoicedAmount) || other.invoicedAmount == invoicedAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.rentInvoiced, rentInvoiced) || other.rentInvoiced == rentInvoiced)&&(identical(other.arrears, arrears) || other.arrears == arrears)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.unpaidInvoices, unpaidInvoices) || other.unpaidInvoices == unpaidInvoices)&&(identical(other.oldestUnpaid, oldestUnpaid) || other.oldestUnpaid == oldestUnpaid)&&(identical(other.lastPaymentOn, lastPaymentOn) || other.lastPaymentOn == lastPaymentOn)&&(identical(other.lastPaymentAmount, lastPaymentAmount) || other.lastPaymentAmount == lastPaymentAmount)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantUserId,tenantName,tenantPhone,houseId,houseCode,houseNumber,unitLabel,categoryName,propertyName,estateName,rent,depositHeld,occupiedOn,expiresOn,invoicedAmount,paidAmount,rentInvoiced,arrears,credit,accountBalance,unpaidInvoices,oldestUnpaid,lastPaymentOn,lastPaymentAmount,collectionRate]);

@override
String toString() {
  return 'TenantReportModel(id: $id, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, unitLabel: $unitLabel, categoryName: $categoryName, propertyName: $propertyName, estateName: $estateName, rent: $rent, depositHeld: $depositHeld, occupiedOn: $occupiedOn, expiresOn: $expiresOn, invoicedAmount: $invoicedAmount, paidAmount: $paidAmount, rentInvoiced: $rentInvoiced, arrears: $arrears, credit: $credit, accountBalance: $accountBalance, unpaidInvoices: $unpaidInvoices, oldestUnpaid: $oldestUnpaid, lastPaymentOn: $lastPaymentOn, lastPaymentAmount: $lastPaymentAmount, collectionRate: $collectionRate)';
}


}

/// @nodoc
abstract mixin class $TenantReportModelCopyWith<$Res>  {
  factory $TenantReportModelCopyWith(TenantReportModel value, $Res Function(TenantReportModel) _then) = _$TenantReportModelCopyWithImpl;
@useResult
$Res call({
 String id, String? tenantUserId, String tenantName, String? tenantPhone, String? houseId, String? houseCode, String? houseNumber, String? unitLabel, String? categoryName, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double depositHeld, String? occupiedOn, String? expiresOn,@JsonKey(fromJson: parseDouble) double invoicedAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double rentInvoiced,@JsonKey(fromJson: parseDouble) double arrears,@JsonKey(fromJson: parseDouble) double credit,@JsonKey(fromJson: parseDouble) double accountBalance, int unpaidInvoices, int? oldestUnpaid, String? lastPaymentOn,@JsonKey(fromJson: parseDouble) double lastPaymentAmount,@JsonKey(fromJson: parseDoubleNullable) double? collectionRate
});




}
/// @nodoc
class _$TenantReportModelCopyWithImpl<$Res>
    implements $TenantReportModelCopyWith<$Res> {
  _$TenantReportModelCopyWithImpl(this._self, this._then);

  final TenantReportModel _self;
  final $Res Function(TenantReportModel) _then;

/// Create a copy of TenantReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tenantUserId = freezed,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? unitLabel = freezed,Object? categoryName = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? rent = null,Object? depositHeld = null,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? invoicedAmount = null,Object? paidAmount = null,Object? rentInvoiced = null,Object? arrears = null,Object? credit = null,Object? accountBalance = null,Object? unpaidInvoices = null,Object? oldestUnpaid = freezed,Object? lastPaymentOn = freezed,Object? lastPaymentAmount = null,Object? collectionRate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,depositHeld: null == depositHeld ? _self.depositHeld : depositHeld // ignore: cast_nullable_to_non_nullable
as double,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,invoicedAmount: null == invoicedAmount ? _self.invoicedAmount : invoicedAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,rentInvoiced: null == rentInvoiced ? _self.rentInvoiced : rentInvoiced // ignore: cast_nullable_to_non_nullable
as double,arrears: null == arrears ? _self.arrears : arrears // ignore: cast_nullable_to_non_nullable
as double,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as double,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,unpaidInvoices: null == unpaidInvoices ? _self.unpaidInvoices : unpaidInvoices // ignore: cast_nullable_to_non_nullable
as int,oldestUnpaid: freezed == oldestUnpaid ? _self.oldestUnpaid : oldestUnpaid // ignore: cast_nullable_to_non_nullable
as int?,lastPaymentOn: freezed == lastPaymentOn ? _self.lastPaymentOn : lastPaymentOn // ignore: cast_nullable_to_non_nullable
as String?,lastPaymentAmount: null == lastPaymentAmount ? _self.lastPaymentAmount : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
as double,collectionRate: freezed == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantReportModel].
extension TenantReportModelPatterns on TenantReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantReportModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? houseId,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? categoryName,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld,  String? occupiedOn,  String? expiresOn, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentInvoiced, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int unpaidInvoices,  int? oldestUnpaid,  String? lastPaymentOn, @JsonKey(fromJson: parseDouble)  double lastPaymentAmount, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantReportModel() when $default != null:
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.houseId,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.categoryName,_that.propertyName,_that.estateName,_that.rent,_that.depositHeld,_that.occupiedOn,_that.expiresOn,_that.invoicedAmount,_that.paidAmount,_that.rentInvoiced,_that.arrears,_that.credit,_that.accountBalance,_that.unpaidInvoices,_that.oldestUnpaid,_that.lastPaymentOn,_that.lastPaymentAmount,_that.collectionRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? houseId,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? categoryName,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld,  String? occupiedOn,  String? expiresOn, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentInvoiced, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int unpaidInvoices,  int? oldestUnpaid,  String? lastPaymentOn, @JsonKey(fromJson: parseDouble)  double lastPaymentAmount, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)  $default,) {final _that = this;
switch (_that) {
case _TenantReportModel():
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.houseId,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.categoryName,_that.propertyName,_that.estateName,_that.rent,_that.depositHeld,_that.occupiedOn,_that.expiresOn,_that.invoicedAmount,_that.paidAmount,_that.rentInvoiced,_that.arrears,_that.credit,_that.accountBalance,_that.unpaidInvoices,_that.oldestUnpaid,_that.lastPaymentOn,_that.lastPaymentAmount,_that.collectionRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? houseId,  String? houseCode,  String? houseNumber,  String? unitLabel,  String? categoryName,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld,  String? occupiedOn,  String? expiresOn, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentInvoiced, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int unpaidInvoices,  int? oldestUnpaid,  String? lastPaymentOn, @JsonKey(fromJson: parseDouble)  double lastPaymentAmount, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)?  $default,) {final _that = this;
switch (_that) {
case _TenantReportModel() when $default != null:
return $default(_that.id,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.houseId,_that.houseCode,_that.houseNumber,_that.unitLabel,_that.categoryName,_that.propertyName,_that.estateName,_that.rent,_that.depositHeld,_that.occupiedOn,_that.expiresOn,_that.invoicedAmount,_that.paidAmount,_that.rentInvoiced,_that.arrears,_that.credit,_that.accountBalance,_that.unpaidInvoices,_that.oldestUnpaid,_that.lastPaymentOn,_that.lastPaymentAmount,_that.collectionRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantReportModel extends TenantReportModel {
  const _TenantReportModel({required this.id, this.tenantUserId, required this.tenantName, this.tenantPhone, this.houseId, this.houseCode, this.houseNumber, this.unitLabel, this.categoryName, this.propertyName, this.estateName, @JsonKey(fromJson: parseDouble) this.rent = 0, @JsonKey(fromJson: parseDouble) this.depositHeld = 0, this.occupiedOn, this.expiresOn, @JsonKey(fromJson: parseDouble) this.invoicedAmount = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, @JsonKey(fromJson: parseDouble) this.rentInvoiced = 0, @JsonKey(fromJson: parseDouble) this.arrears = 0, @JsonKey(fromJson: parseDouble) this.credit = 0, @JsonKey(fromJson: parseDouble) this.accountBalance = 0, this.unpaidInvoices = 0, this.oldestUnpaid, this.lastPaymentOn, @JsonKey(fromJson: parseDouble) this.lastPaymentAmount = 0, @JsonKey(fromJson: parseDoubleNullable) this.collectionRate}): super._();
  factory _TenantReportModel.fromJson(Map<String, dynamic> json) => _$TenantReportModelFromJson(json);

@override final  String id;
@override final  String? tenantUserId;
@override final  String tenantName;
@override final  String? tenantPhone;
@override final  String? houseId;
@override final  String? houseCode;
@override final  String? houseNumber;
/// Composed by the server, as everywhere else in the platform.
@override final  String? unitLabel;
@override final  String? categoryName;
@override final  String? propertyName;
@override final  String? estateName;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override@JsonKey(fromJson: parseDouble) final  double depositHeld;
@override final  String? occupiedOn;
@override final  String? expiresOn;
@override@JsonKey(fromJson: parseDouble) final  double invoicedAmount;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
@override@JsonKey(fromJson: parseDouble) final  double rentInvoiced;
@override@JsonKey(fromJson: parseDouble) final  double arrears;
@override@JsonKey(fromJson: parseDouble) final  double credit;
/// Arrears less credit — the one number that answers "where does this tenancy stand".
/// Computed by the server so every screen showing it shows the same thing.
@override@JsonKey(fromJson: parseDouble) final  double accountBalance;
@override@JsonKey() final  int unpaidInvoices;
/// How many days old the oldest unpaid invoice is. Null where nothing is unpaid.
@override final  int? oldestUnpaid;
@override final  String? lastPaymentOn;
@override@JsonKey(fromJson: parseDouble) final  double lastPaymentAmount;
/// Null where nothing was invoiced — a tenancy nobody has billed has no rate, which is not
/// the same as a rate of nought.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? collectionRate;

/// Create a copy of TenantReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantReportModelCopyWith<_TenantReportModel> get copyWith => __$TenantReportModelCopyWithImpl<_TenantReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.unitLabel, unitLabel) || other.unitLabel == unitLabel)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.depositHeld, depositHeld) || other.depositHeld == depositHeld)&&(identical(other.occupiedOn, occupiedOn) || other.occupiedOn == occupiedOn)&&(identical(other.expiresOn, expiresOn) || other.expiresOn == expiresOn)&&(identical(other.invoicedAmount, invoicedAmount) || other.invoicedAmount == invoicedAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.rentInvoiced, rentInvoiced) || other.rentInvoiced == rentInvoiced)&&(identical(other.arrears, arrears) || other.arrears == arrears)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.unpaidInvoices, unpaidInvoices) || other.unpaidInvoices == unpaidInvoices)&&(identical(other.oldestUnpaid, oldestUnpaid) || other.oldestUnpaid == oldestUnpaid)&&(identical(other.lastPaymentOn, lastPaymentOn) || other.lastPaymentOn == lastPaymentOn)&&(identical(other.lastPaymentAmount, lastPaymentAmount) || other.lastPaymentAmount == lastPaymentAmount)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tenantUserId,tenantName,tenantPhone,houseId,houseCode,houseNumber,unitLabel,categoryName,propertyName,estateName,rent,depositHeld,occupiedOn,expiresOn,invoicedAmount,paidAmount,rentInvoiced,arrears,credit,accountBalance,unpaidInvoices,oldestUnpaid,lastPaymentOn,lastPaymentAmount,collectionRate]);

@override
String toString() {
  return 'TenantReportModel(id: $id, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, unitLabel: $unitLabel, categoryName: $categoryName, propertyName: $propertyName, estateName: $estateName, rent: $rent, depositHeld: $depositHeld, occupiedOn: $occupiedOn, expiresOn: $expiresOn, invoicedAmount: $invoicedAmount, paidAmount: $paidAmount, rentInvoiced: $rentInvoiced, arrears: $arrears, credit: $credit, accountBalance: $accountBalance, unpaidInvoices: $unpaidInvoices, oldestUnpaid: $oldestUnpaid, lastPaymentOn: $lastPaymentOn, lastPaymentAmount: $lastPaymentAmount, collectionRate: $collectionRate)';
}


}

/// @nodoc
abstract mixin class _$TenantReportModelCopyWith<$Res> implements $TenantReportModelCopyWith<$Res> {
  factory _$TenantReportModelCopyWith(_TenantReportModel value, $Res Function(_TenantReportModel) _then) = __$TenantReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? tenantUserId, String tenantName, String? tenantPhone, String? houseId, String? houseCode, String? houseNumber, String? unitLabel, String? categoryName, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double depositHeld, String? occupiedOn, String? expiresOn,@JsonKey(fromJson: parseDouble) double invoicedAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double rentInvoiced,@JsonKey(fromJson: parseDouble) double arrears,@JsonKey(fromJson: parseDouble) double credit,@JsonKey(fromJson: parseDouble) double accountBalance, int unpaidInvoices, int? oldestUnpaid, String? lastPaymentOn,@JsonKey(fromJson: parseDouble) double lastPaymentAmount,@JsonKey(fromJson: parseDoubleNullable) double? collectionRate
});




}
/// @nodoc
class __$TenantReportModelCopyWithImpl<$Res>
    implements _$TenantReportModelCopyWith<$Res> {
  __$TenantReportModelCopyWithImpl(this._self, this._then);

  final _TenantReportModel _self;
  final $Res Function(_TenantReportModel) _then;

/// Create a copy of TenantReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tenantUserId = freezed,Object? tenantName = null,Object? tenantPhone = freezed,Object? houseId = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? unitLabel = freezed,Object? categoryName = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? rent = null,Object? depositHeld = null,Object? occupiedOn = freezed,Object? expiresOn = freezed,Object? invoicedAmount = null,Object? paidAmount = null,Object? rentInvoiced = null,Object? arrears = null,Object? credit = null,Object? accountBalance = null,Object? unpaidInvoices = null,Object? oldestUnpaid = freezed,Object? lastPaymentOn = freezed,Object? lastPaymentAmount = null,Object? collectionRate = freezed,}) {
  return _then(_TenantReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,unitLabel: freezed == unitLabel ? _self.unitLabel : unitLabel // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,depositHeld: null == depositHeld ? _self.depositHeld : depositHeld // ignore: cast_nullable_to_non_nullable
as double,occupiedOn: freezed == occupiedOn ? _self.occupiedOn : occupiedOn // ignore: cast_nullable_to_non_nullable
as String?,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as String?,invoicedAmount: null == invoicedAmount ? _self.invoicedAmount : invoicedAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,rentInvoiced: null == rentInvoiced ? _self.rentInvoiced : rentInvoiced // ignore: cast_nullable_to_non_nullable
as double,arrears: null == arrears ? _self.arrears : arrears // ignore: cast_nullable_to_non_nullable
as double,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as double,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,unpaidInvoices: null == unpaidInvoices ? _self.unpaidInvoices : unpaidInvoices // ignore: cast_nullable_to_non_nullable
as int,oldestUnpaid: freezed == oldestUnpaid ? _self.oldestUnpaid : oldestUnpaid // ignore: cast_nullable_to_non_nullable
as int?,lastPaymentOn: freezed == lastPaymentOn ? _self.lastPaymentOn : lastPaymentOn // ignore: cast_nullable_to_non_nullable
as String?,lastPaymentAmount: null == lastPaymentAmount ? _self.lastPaymentAmount : lastPaymentAmount // ignore: cast_nullable_to_non_nullable
as double,collectionRate: freezed == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TenantReportPageModel {

 List<TenantReportModel> get content; int get page; int get pageSize; int get totalElements; TenantReportTotalsModel? get totals;
/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantReportPageModelCopyWith<TenantReportPageModel> get copyWith => _$TenantReportPageModelCopyWithImpl<TenantReportPageModel>(this as TenantReportPageModel, _$identity);

  /// Serializes this TenantReportPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantReportPageModel&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,pageSize,totalElements,totals);

@override
String toString() {
  return 'TenantReportPageModel(content: $content, page: $page, pageSize: $pageSize, totalElements: $totalElements, totals: $totals)';
}


}

/// @nodoc
abstract mixin class $TenantReportPageModelCopyWith<$Res>  {
  factory $TenantReportPageModelCopyWith(TenantReportPageModel value, $Res Function(TenantReportPageModel) _then) = _$TenantReportPageModelCopyWithImpl;
@useResult
$Res call({
 List<TenantReportModel> content, int page, int pageSize, int totalElements, TenantReportTotalsModel? totals
});


$TenantReportTotalsModelCopyWith<$Res>? get totals;

}
/// @nodoc
class _$TenantReportPageModelCopyWithImpl<$Res>
    implements $TenantReportPageModelCopyWith<$Res> {
  _$TenantReportPageModelCopyWithImpl(this._self, this._then);

  final TenantReportPageModel _self;
  final $Res Function(TenantReportPageModel) _then;

/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? pageSize = null,Object? totalElements = null,Object? totals = freezed,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<TenantReportModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TenantReportTotalsModel?,
  ));
}
/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantReportTotalsModelCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $TenantReportTotalsModelCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [TenantReportPageModel].
extension TenantReportPageModelPatterns on TenantReportPageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantReportPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantReportPageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantReportPageModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantReportPageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantReportPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantReportPageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TenantReportModel> content,  int page,  int pageSize,  int totalElements,  TenantReportTotalsModel? totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantReportPageModel() when $default != null:
return $default(_that.content,_that.page,_that.pageSize,_that.totalElements,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TenantReportModel> content,  int page,  int pageSize,  int totalElements,  TenantReportTotalsModel? totals)  $default,) {final _that = this;
switch (_that) {
case _TenantReportPageModel():
return $default(_that.content,_that.page,_that.pageSize,_that.totalElements,_that.totals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TenantReportModel> content,  int page,  int pageSize,  int totalElements,  TenantReportTotalsModel? totals)?  $default,) {final _that = this;
switch (_that) {
case _TenantReportPageModel() when $default != null:
return $default(_that.content,_that.page,_that.pageSize,_that.totalElements,_that.totals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantReportPageModel extends TenantReportPageModel {
  const _TenantReportPageModel({final  List<TenantReportModel> content = const <TenantReportModel>[], this.page = 0, this.pageSize = 0, this.totalElements = 0, this.totals}): _content = content,super._();
  factory _TenantReportPageModel.fromJson(Map<String, dynamic> json) => _$TenantReportPageModelFromJson(json);

 final  List<TenantReportModel> _content;
@override@JsonKey() List<TenantReportModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int totalElements;
@override final  TenantReportTotalsModel? totals;

/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantReportPageModelCopyWith<_TenantReportPageModel> get copyWith => __$TenantReportPageModelCopyWithImpl<_TenantReportPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantReportPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantReportPageModel&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,pageSize,totalElements,totals);

@override
String toString() {
  return 'TenantReportPageModel(content: $content, page: $page, pageSize: $pageSize, totalElements: $totalElements, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$TenantReportPageModelCopyWith<$Res> implements $TenantReportPageModelCopyWith<$Res> {
  factory _$TenantReportPageModelCopyWith(_TenantReportPageModel value, $Res Function(_TenantReportPageModel) _then) = __$TenantReportPageModelCopyWithImpl;
@override @useResult
$Res call({
 List<TenantReportModel> content, int page, int pageSize, int totalElements, TenantReportTotalsModel? totals
});


@override $TenantReportTotalsModelCopyWith<$Res>? get totals;

}
/// @nodoc
class __$TenantReportPageModelCopyWithImpl<$Res>
    implements _$TenantReportPageModelCopyWith<$Res> {
  __$TenantReportPageModelCopyWithImpl(this._self, this._then);

  final _TenantReportPageModel _self;
  final $Res Function(_TenantReportPageModel) _then;

/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? pageSize = null,Object? totalElements = null,Object? totals = freezed,}) {
  return _then(_TenantReportPageModel(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<TenantReportModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as TenantReportTotalsModel?,
  ));
}

/// Create a copy of TenantReportPageModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TenantReportTotalsModelCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $TenantReportTotalsModelCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$TenantReportTotalsModel {

 int get tenancies;@JsonKey(fromJson: parseDouble) double get rent;@JsonKey(fromJson: parseDouble) double get depositHeld;@JsonKey(fromJson: parseDouble) double get invoicedAmount;@JsonKey(fromJson: parseDouble) double get paidAmount;@JsonKey(fromJson: parseDouble) double get arrears;@JsonKey(fromJson: parseDouble) double get credit;@JsonKey(fromJson: parseDouble) double get accountBalance;/// How many of the tenancies owe anything.
 int get owing;@JsonKey(fromJson: parseDoubleNullable) double? get collectionRate;
/// Create a copy of TenantReportTotalsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantReportTotalsModelCopyWith<TenantReportTotalsModel> get copyWith => _$TenantReportTotalsModelCopyWithImpl<TenantReportTotalsModel>(this as TenantReportTotalsModel, _$identity);

  /// Serializes this TenantReportTotalsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantReportTotalsModel&&(identical(other.tenancies, tenancies) || other.tenancies == tenancies)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.depositHeld, depositHeld) || other.depositHeld == depositHeld)&&(identical(other.invoicedAmount, invoicedAmount) || other.invoicedAmount == invoicedAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.arrears, arrears) || other.arrears == arrears)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.owing, owing) || other.owing == owing)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenancies,rent,depositHeld,invoicedAmount,paidAmount,arrears,credit,accountBalance,owing,collectionRate);

@override
String toString() {
  return 'TenantReportTotalsModel(tenancies: $tenancies, rent: $rent, depositHeld: $depositHeld, invoicedAmount: $invoicedAmount, paidAmount: $paidAmount, arrears: $arrears, credit: $credit, accountBalance: $accountBalance, owing: $owing, collectionRate: $collectionRate)';
}


}

/// @nodoc
abstract mixin class $TenantReportTotalsModelCopyWith<$Res>  {
  factory $TenantReportTotalsModelCopyWith(TenantReportTotalsModel value, $Res Function(TenantReportTotalsModel) _then) = _$TenantReportTotalsModelCopyWithImpl;
@useResult
$Res call({
 int tenancies,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double depositHeld,@JsonKey(fromJson: parseDouble) double invoicedAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double arrears,@JsonKey(fromJson: parseDouble) double credit,@JsonKey(fromJson: parseDouble) double accountBalance, int owing,@JsonKey(fromJson: parseDoubleNullable) double? collectionRate
});




}
/// @nodoc
class _$TenantReportTotalsModelCopyWithImpl<$Res>
    implements $TenantReportTotalsModelCopyWith<$Res> {
  _$TenantReportTotalsModelCopyWithImpl(this._self, this._then);

  final TenantReportTotalsModel _self;
  final $Res Function(TenantReportTotalsModel) _then;

/// Create a copy of TenantReportTotalsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenancies = null,Object? rent = null,Object? depositHeld = null,Object? invoicedAmount = null,Object? paidAmount = null,Object? arrears = null,Object? credit = null,Object? accountBalance = null,Object? owing = null,Object? collectionRate = freezed,}) {
  return _then(_self.copyWith(
tenancies: null == tenancies ? _self.tenancies : tenancies // ignore: cast_nullable_to_non_nullable
as int,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,depositHeld: null == depositHeld ? _self.depositHeld : depositHeld // ignore: cast_nullable_to_non_nullable
as double,invoicedAmount: null == invoicedAmount ? _self.invoicedAmount : invoicedAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,arrears: null == arrears ? _self.arrears : arrears // ignore: cast_nullable_to_non_nullable
as double,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as double,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,owing: null == owing ? _self.owing : owing // ignore: cast_nullable_to_non_nullable
as int,collectionRate: freezed == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantReportTotalsModel].
extension TenantReportTotalsModelPatterns on TenantReportTotalsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantReportTotalsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantReportTotalsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantReportTotalsModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantReportTotalsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantReportTotalsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantReportTotalsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tenancies, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int owing, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantReportTotalsModel() when $default != null:
return $default(_that.tenancies,_that.rent,_that.depositHeld,_that.invoicedAmount,_that.paidAmount,_that.arrears,_that.credit,_that.accountBalance,_that.owing,_that.collectionRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tenancies, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int owing, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)  $default,) {final _that = this;
switch (_that) {
case _TenantReportTotalsModel():
return $default(_that.tenancies,_that.rent,_that.depositHeld,_that.invoicedAmount,_that.paidAmount,_that.arrears,_that.credit,_that.accountBalance,_that.owing,_that.collectionRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tenancies, @JsonKey(fromJson: parseDouble)  double rent, @JsonKey(fromJson: parseDouble)  double depositHeld, @JsonKey(fromJson: parseDouble)  double invoicedAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double arrears, @JsonKey(fromJson: parseDouble)  double credit, @JsonKey(fromJson: parseDouble)  double accountBalance,  int owing, @JsonKey(fromJson: parseDoubleNullable)  double? collectionRate)?  $default,) {final _that = this;
switch (_that) {
case _TenantReportTotalsModel() when $default != null:
return $default(_that.tenancies,_that.rent,_that.depositHeld,_that.invoicedAmount,_that.paidAmount,_that.arrears,_that.credit,_that.accountBalance,_that.owing,_that.collectionRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantReportTotalsModel extends TenantReportTotalsModel {
  const _TenantReportTotalsModel({this.tenancies = 0, @JsonKey(fromJson: parseDouble) this.rent = 0, @JsonKey(fromJson: parseDouble) this.depositHeld = 0, @JsonKey(fromJson: parseDouble) this.invoicedAmount = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, @JsonKey(fromJson: parseDouble) this.arrears = 0, @JsonKey(fromJson: parseDouble) this.credit = 0, @JsonKey(fromJson: parseDouble) this.accountBalance = 0, this.owing = 0, @JsonKey(fromJson: parseDoubleNullable) this.collectionRate}): super._();
  factory _TenantReportTotalsModel.fromJson(Map<String, dynamic> json) => _$TenantReportTotalsModelFromJson(json);

@override@JsonKey() final  int tenancies;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override@JsonKey(fromJson: parseDouble) final  double depositHeld;
@override@JsonKey(fromJson: parseDouble) final  double invoicedAmount;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
@override@JsonKey(fromJson: parseDouble) final  double arrears;
@override@JsonKey(fromJson: parseDouble) final  double credit;
@override@JsonKey(fromJson: parseDouble) final  double accountBalance;
/// How many of the tenancies owe anything.
@override@JsonKey() final  int owing;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? collectionRate;

/// Create a copy of TenantReportTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantReportTotalsModelCopyWith<_TenantReportTotalsModel> get copyWith => __$TenantReportTotalsModelCopyWithImpl<_TenantReportTotalsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantReportTotalsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantReportTotalsModel&&(identical(other.tenancies, tenancies) || other.tenancies == tenancies)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.depositHeld, depositHeld) || other.depositHeld == depositHeld)&&(identical(other.invoicedAmount, invoicedAmount) || other.invoicedAmount == invoicedAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.arrears, arrears) || other.arrears == arrears)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.owing, owing) || other.owing == owing)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenancies,rent,depositHeld,invoicedAmount,paidAmount,arrears,credit,accountBalance,owing,collectionRate);

@override
String toString() {
  return 'TenantReportTotalsModel(tenancies: $tenancies, rent: $rent, depositHeld: $depositHeld, invoicedAmount: $invoicedAmount, paidAmount: $paidAmount, arrears: $arrears, credit: $credit, accountBalance: $accountBalance, owing: $owing, collectionRate: $collectionRate)';
}


}

/// @nodoc
abstract mixin class _$TenantReportTotalsModelCopyWith<$Res> implements $TenantReportTotalsModelCopyWith<$Res> {
  factory _$TenantReportTotalsModelCopyWith(_TenantReportTotalsModel value, $Res Function(_TenantReportTotalsModel) _then) = __$TenantReportTotalsModelCopyWithImpl;
@override @useResult
$Res call({
 int tenancies,@JsonKey(fromJson: parseDouble) double rent,@JsonKey(fromJson: parseDouble) double depositHeld,@JsonKey(fromJson: parseDouble) double invoicedAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double arrears,@JsonKey(fromJson: parseDouble) double credit,@JsonKey(fromJson: parseDouble) double accountBalance, int owing,@JsonKey(fromJson: parseDoubleNullable) double? collectionRate
});




}
/// @nodoc
class __$TenantReportTotalsModelCopyWithImpl<$Res>
    implements _$TenantReportTotalsModelCopyWith<$Res> {
  __$TenantReportTotalsModelCopyWithImpl(this._self, this._then);

  final _TenantReportTotalsModel _self;
  final $Res Function(_TenantReportTotalsModel) _then;

/// Create a copy of TenantReportTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenancies = null,Object? rent = null,Object? depositHeld = null,Object? invoicedAmount = null,Object? paidAmount = null,Object? arrears = null,Object? credit = null,Object? accountBalance = null,Object? owing = null,Object? collectionRate = freezed,}) {
  return _then(_TenantReportTotalsModel(
tenancies: null == tenancies ? _self.tenancies : tenancies // ignore: cast_nullable_to_non_nullable
as int,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,depositHeld: null == depositHeld ? _self.depositHeld : depositHeld // ignore: cast_nullable_to_non_nullable
as double,invoicedAmount: null == invoicedAmount ? _self.invoicedAmount : invoicedAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,arrears: null == arrears ? _self.arrears : arrears // ignore: cast_nullable_to_non_nullable
as double,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as double,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,owing: null == owing ? _self.owing : owing // ignore: cast_nullable_to_non_nullable
as int,collectionRate: freezed == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
