// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyDetailModel {

 String get id; String get name; String? get estateId; String? get estateName; String? get location; double? get latitude; double? get longitude; int? get floors; int get basementFloors; bool get hasMezzanine;/// Live tenancies here. Not the same as [occupiedUnits]: a unit is flagged occupied, a
/// tenancy is a person with terms and a balance. They agree in practice, but a count labelled
/// "Tenants" has to count tenants or it promises rows it cannot show.
 int get tenancyCount; String? get contactName; String? get phone; String? get email; String? get bankId; String? get bankName;@JsonKey(fromJson: parseDoubleNullable) double? get commission; int? get invoiceGenerationDay; int? get expenseGenerationDay;/// Printed on this property's invoices. Null means unset, which the screen says out loud —
/// an invoice going out with no payment instructions is worth noticing before it is sent.
 String? get paymentInstructions; String? get invoiceFooter; bool get tenantCanViewLease; bool get leaseCoversOwned; int? get defaultNoticeDays; String? get shortNoticePenalty;@JsonKey(fromJson: parseDoubleNullable) double? get shortNoticePenaltyAmount; int get units; int get occupiedUnits; int get vacantUnits; int get status; String? get createdOn;/// The tenures this property offers — RENTAL, OWNED, BNB.
 List<String> get tenures; List<TenureCount> get tenureMix; List<NamedRef> get categories; List<NamedRef> get features;/// Who is assigned here — the answer to "who do I call about this block".
 List<NamedRef> get caretakers;/// Sections whose data belongs to a module that does not exist yet. Named rather than sent
/// as zeroes, because a zero in a money field reads as "nothing owed".
 List<String> get pending;
/// Create a copy of PropertyDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyDetailModelCopyWith<PropertyDetailModel> get copyWith => _$PropertyDetailModelCopyWithImpl<PropertyDetailModel>(this as PropertyDetailModel, _$identity);

  /// Serializes this PropertyDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.basementFloors, basementFloors) || other.basementFloors == basementFloors)&&(identical(other.hasMezzanine, hasMezzanine) || other.hasMezzanine == hasMezzanine)&&(identical(other.tenancyCount, tenancyCount) || other.tenancyCount == tenancyCount)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.invoiceGenerationDay, invoiceGenerationDay) || other.invoiceGenerationDay == invoiceGenerationDay)&&(identical(other.expenseGenerationDay, expenseGenerationDay) || other.expenseGenerationDay == expenseGenerationDay)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.invoiceFooter, invoiceFooter) || other.invoiceFooter == invoiceFooter)&&(identical(other.tenantCanViewLease, tenantCanViewLease) || other.tenantCanViewLease == tenantCanViewLease)&&(identical(other.leaseCoversOwned, leaseCoversOwned) || other.leaseCoversOwned == leaseCoversOwned)&&(identical(other.defaultNoticeDays, defaultNoticeDays) || other.defaultNoticeDays == defaultNoticeDays)&&(identical(other.shortNoticePenalty, shortNoticePenalty) || other.shortNoticePenalty == shortNoticePenalty)&&(identical(other.shortNoticePenaltyAmount, shortNoticePenaltyAmount) || other.shortNoticePenaltyAmount == shortNoticePenaltyAmount)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.vacantUnits, vacantUnits) || other.vacantUnits == vacantUnits)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&const DeepCollectionEquality().equals(other.tenures, tenures)&&const DeepCollectionEquality().equals(other.tenureMix, tenureMix)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.caretakers, caretakers)&&const DeepCollectionEquality().equals(other.pending, pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,estateId,estateName,location,latitude,longitude,floors,basementFloors,hasMezzanine,tenancyCount,contactName,phone,email,bankId,bankName,commission,invoiceGenerationDay,expenseGenerationDay,paymentInstructions,invoiceFooter,tenantCanViewLease,leaseCoversOwned,defaultNoticeDays,shortNoticePenalty,shortNoticePenaltyAmount,units,occupiedUnits,vacantUnits,status,createdOn,const DeepCollectionEquality().hash(tenures),const DeepCollectionEquality().hash(tenureMix),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(caretakers),const DeepCollectionEquality().hash(pending)]);

@override
String toString() {
  return 'PropertyDetailModel(id: $id, name: $name, estateId: $estateId, estateName: $estateName, location: $location, latitude: $latitude, longitude: $longitude, floors: $floors, basementFloors: $basementFloors, hasMezzanine: $hasMezzanine, tenancyCount: $tenancyCount, contactName: $contactName, phone: $phone, email: $email, bankId: $bankId, bankName: $bankName, commission: $commission, invoiceGenerationDay: $invoiceGenerationDay, expenseGenerationDay: $expenseGenerationDay, paymentInstructions: $paymentInstructions, invoiceFooter: $invoiceFooter, tenantCanViewLease: $tenantCanViewLease, leaseCoversOwned: $leaseCoversOwned, defaultNoticeDays: $defaultNoticeDays, shortNoticePenalty: $shortNoticePenalty, shortNoticePenaltyAmount: $shortNoticePenaltyAmount, units: $units, occupiedUnits: $occupiedUnits, vacantUnits: $vacantUnits, status: $status, createdOn: $createdOn, tenures: $tenures, tenureMix: $tenureMix, categories: $categories, features: $features, caretakers: $caretakers, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $PropertyDetailModelCopyWith<$Res>  {
  factory $PropertyDetailModelCopyWith(PropertyDetailModel value, $Res Function(PropertyDetailModel) _then) = _$PropertyDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? estateId, String? estateName, String? location, double? latitude, double? longitude, int? floors, int basementFloors, bool hasMezzanine, int tenancyCount, String? contactName, String? phone, String? email, String? bankId, String? bankName,@JsonKey(fromJson: parseDoubleNullable) double? commission, int? invoiceGenerationDay, int? expenseGenerationDay, String? paymentInstructions, String? invoiceFooter, bool tenantCanViewLease, bool leaseCoversOwned, int? defaultNoticeDays, String? shortNoticePenalty,@JsonKey(fromJson: parseDoubleNullable) double? shortNoticePenaltyAmount, int units, int occupiedUnits, int vacantUnits, int status, String? createdOn, List<String> tenures, List<TenureCount> tenureMix, List<NamedRef> categories, List<NamedRef> features, List<NamedRef> caretakers, List<String> pending
});




}
/// @nodoc
class _$PropertyDetailModelCopyWithImpl<$Res>
    implements $PropertyDetailModelCopyWith<$Res> {
  _$PropertyDetailModelCopyWithImpl(this._self, this._then);

  final PropertyDetailModel _self;
  final $Res Function(PropertyDetailModel) _then;

/// Create a copy of PropertyDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? floors = freezed,Object? basementFloors = null,Object? hasMezzanine = null,Object? tenancyCount = null,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? bankId = freezed,Object? bankName = freezed,Object? commission = freezed,Object? invoiceGenerationDay = freezed,Object? expenseGenerationDay = freezed,Object? paymentInstructions = freezed,Object? invoiceFooter = freezed,Object? tenantCanViewLease = null,Object? leaseCoversOwned = null,Object? defaultNoticeDays = freezed,Object? shortNoticePenalty = freezed,Object? shortNoticePenaltyAmount = freezed,Object? units = null,Object? occupiedUnits = null,Object? vacantUnits = null,Object? status = null,Object? createdOn = freezed,Object? tenures = null,Object? tenureMix = null,Object? categories = null,Object? features = null,Object? caretakers = null,Object? pending = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int?,basementFloors: null == basementFloors ? _self.basementFloors : basementFloors // ignore: cast_nullable_to_non_nullable
as int,hasMezzanine: null == hasMezzanine ? _self.hasMezzanine : hasMezzanine // ignore: cast_nullable_to_non_nullable
as bool,tenancyCount: null == tenancyCount ? _self.tenancyCount : tenancyCount // ignore: cast_nullable_to_non_nullable
as int,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,commission: freezed == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double?,invoiceGenerationDay: freezed == invoiceGenerationDay ? _self.invoiceGenerationDay : invoiceGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,expenseGenerationDay: freezed == expenseGenerationDay ? _self.expenseGenerationDay : expenseGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,invoiceFooter: freezed == invoiceFooter ? _self.invoiceFooter : invoiceFooter // ignore: cast_nullable_to_non_nullable
as String?,tenantCanViewLease: null == tenantCanViewLease ? _self.tenantCanViewLease : tenantCanViewLease // ignore: cast_nullable_to_non_nullable
as bool,leaseCoversOwned: null == leaseCoversOwned ? _self.leaseCoversOwned : leaseCoversOwned // ignore: cast_nullable_to_non_nullable
as bool,defaultNoticeDays: freezed == defaultNoticeDays ? _self.defaultNoticeDays : defaultNoticeDays // ignore: cast_nullable_to_non_nullable
as int?,shortNoticePenalty: freezed == shortNoticePenalty ? _self.shortNoticePenalty : shortNoticePenalty // ignore: cast_nullable_to_non_nullable
as String?,shortNoticePenaltyAmount: freezed == shortNoticePenaltyAmount ? _self.shortNoticePenaltyAmount : shortNoticePenaltyAmount // ignore: cast_nullable_to_non_nullable
as double?,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,vacantUnits: null == vacantUnits ? _self.vacantUnits : vacantUnits // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,tenures: null == tenures ? _self.tenures : tenures // ignore: cast_nullable_to_non_nullable
as List<String>,tenureMix: null == tenureMix ? _self.tenureMix : tenureMix // ignore: cast_nullable_to_non_nullable
as List<TenureCount>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,caretakers: null == caretakers ? _self.caretakers : caretakers // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyDetailModel].
extension PropertyDetailModelPatterns on PropertyDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PropertyDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  double? latitude,  double? longitude,  int? floors,  int basementFloors,  bool hasMezzanine,  int tenancyCount,  String? contactName,  String? phone,  String? email,  String? bankId,  String? bankName, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  int? invoiceGenerationDay,  int? expenseGenerationDay,  String? paymentInstructions,  String? invoiceFooter,  bool tenantCanViewLease,  bool leaseCoversOwned,  int? defaultNoticeDays,  String? shortNoticePenalty, @JsonKey(fromJson: parseDoubleNullable)  double? shortNoticePenaltyAmount,  int units,  int occupiedUnits,  int vacantUnits,  int status,  String? createdOn,  List<String> tenures,  List<TenureCount> tenureMix,  List<NamedRef> categories,  List<NamedRef> features,  List<NamedRef> caretakers,  List<String> pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.latitude,_that.longitude,_that.floors,_that.basementFloors,_that.hasMezzanine,_that.tenancyCount,_that.contactName,_that.phone,_that.email,_that.bankId,_that.bankName,_that.commission,_that.invoiceGenerationDay,_that.expenseGenerationDay,_that.paymentInstructions,_that.invoiceFooter,_that.tenantCanViewLease,_that.leaseCoversOwned,_that.defaultNoticeDays,_that.shortNoticePenalty,_that.shortNoticePenaltyAmount,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.status,_that.createdOn,_that.tenures,_that.tenureMix,_that.categories,_that.features,_that.caretakers,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  double? latitude,  double? longitude,  int? floors,  int basementFloors,  bool hasMezzanine,  int tenancyCount,  String? contactName,  String? phone,  String? email,  String? bankId,  String? bankName, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  int? invoiceGenerationDay,  int? expenseGenerationDay,  String? paymentInstructions,  String? invoiceFooter,  bool tenantCanViewLease,  bool leaseCoversOwned,  int? defaultNoticeDays,  String? shortNoticePenalty, @JsonKey(fromJson: parseDoubleNullable)  double? shortNoticePenaltyAmount,  int units,  int occupiedUnits,  int vacantUnits,  int status,  String? createdOn,  List<String> tenures,  List<TenureCount> tenureMix,  List<NamedRef> categories,  List<NamedRef> features,  List<NamedRef> caretakers,  List<String> pending)  $default,) {final _that = this;
switch (_that) {
case _PropertyDetailModel():
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.latitude,_that.longitude,_that.floors,_that.basementFloors,_that.hasMezzanine,_that.tenancyCount,_that.contactName,_that.phone,_that.email,_that.bankId,_that.bankName,_that.commission,_that.invoiceGenerationDay,_that.expenseGenerationDay,_that.paymentInstructions,_that.invoiceFooter,_that.tenantCanViewLease,_that.leaseCoversOwned,_that.defaultNoticeDays,_that.shortNoticePenalty,_that.shortNoticePenaltyAmount,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.status,_that.createdOn,_that.tenures,_that.tenureMix,_that.categories,_that.features,_that.caretakers,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? estateId,  String? estateName,  String? location,  double? latitude,  double? longitude,  int? floors,  int basementFloors,  bool hasMezzanine,  int tenancyCount,  String? contactName,  String? phone,  String? email,  String? bankId,  String? bankName, @JsonKey(fromJson: parseDoubleNullable)  double? commission,  int? invoiceGenerationDay,  int? expenseGenerationDay,  String? paymentInstructions,  String? invoiceFooter,  bool tenantCanViewLease,  bool leaseCoversOwned,  int? defaultNoticeDays,  String? shortNoticePenalty, @JsonKey(fromJson: parseDoubleNullable)  double? shortNoticePenaltyAmount,  int units,  int occupiedUnits,  int vacantUnits,  int status,  String? createdOn,  List<String> tenures,  List<TenureCount> tenureMix,  List<NamedRef> categories,  List<NamedRef> features,  List<NamedRef> caretakers,  List<String> pending)?  $default,) {final _that = this;
switch (_that) {
case _PropertyDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.estateId,_that.estateName,_that.location,_that.latitude,_that.longitude,_that.floors,_that.basementFloors,_that.hasMezzanine,_that.tenancyCount,_that.contactName,_that.phone,_that.email,_that.bankId,_that.bankName,_that.commission,_that.invoiceGenerationDay,_that.expenseGenerationDay,_that.paymentInstructions,_that.invoiceFooter,_that.tenantCanViewLease,_that.leaseCoversOwned,_that.defaultNoticeDays,_that.shortNoticePenalty,_that.shortNoticePenaltyAmount,_that.units,_that.occupiedUnits,_that.vacantUnits,_that.status,_that.createdOn,_that.tenures,_that.tenureMix,_that.categories,_that.features,_that.caretakers,_that.pending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyDetailModel extends PropertyDetailModel {
  const _PropertyDetailModel({required this.id, required this.name, this.estateId, this.estateName, this.location, this.latitude, this.longitude, this.floors, this.basementFloors = 0, this.hasMezzanine = false, this.tenancyCount = 0, this.contactName, this.phone, this.email, this.bankId, this.bankName, @JsonKey(fromJson: parseDoubleNullable) this.commission, this.invoiceGenerationDay, this.expenseGenerationDay, this.paymentInstructions, this.invoiceFooter, this.tenantCanViewLease = false, this.leaseCoversOwned = false, this.defaultNoticeDays, this.shortNoticePenalty, @JsonKey(fromJson: parseDoubleNullable) this.shortNoticePenaltyAmount, this.units = 0, this.occupiedUnits = 0, this.vacantUnits = 0, this.status = 0, this.createdOn, final  List<String> tenures = const <String>[], final  List<TenureCount> tenureMix = const <TenureCount>[], final  List<NamedRef> categories = const <NamedRef>[], final  List<NamedRef> features = const <NamedRef>[], final  List<NamedRef> caretakers = const <NamedRef>[], final  List<String> pending = const <String>[]}): _tenures = tenures,_tenureMix = tenureMix,_categories = categories,_features = features,_caretakers = caretakers,_pending = pending,super._();
  factory _PropertyDetailModel.fromJson(Map<String, dynamic> json) => _$PropertyDetailModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  int? floors;
@override@JsonKey() final  int basementFloors;
@override@JsonKey() final  bool hasMezzanine;
/// Live tenancies here. Not the same as [occupiedUnits]: a unit is flagged occupied, a
/// tenancy is a person with terms and a balance. They agree in practice, but a count labelled
/// "Tenants" has to count tenants or it promises rows it cannot show.
@override@JsonKey() final  int tenancyCount;
@override final  String? contactName;
@override final  String? phone;
@override final  String? email;
@override final  String? bankId;
@override final  String? bankName;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? commission;
@override final  int? invoiceGenerationDay;
@override final  int? expenseGenerationDay;
/// Printed on this property's invoices. Null means unset, which the screen says out loud —
/// an invoice going out with no payment instructions is worth noticing before it is sent.
@override final  String? paymentInstructions;
@override final  String? invoiceFooter;
@override@JsonKey() final  bool tenantCanViewLease;
@override@JsonKey() final  bool leaseCoversOwned;
@override final  int? defaultNoticeDays;
@override final  String? shortNoticePenalty;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? shortNoticePenaltyAmount;
@override@JsonKey() final  int units;
@override@JsonKey() final  int occupiedUnits;
@override@JsonKey() final  int vacantUnits;
@override@JsonKey() final  int status;
@override final  String? createdOn;
/// The tenures this property offers — RENTAL, OWNED, BNB.
 final  List<String> _tenures;
/// The tenures this property offers — RENTAL, OWNED, BNB.
@override@JsonKey() List<String> get tenures {
  if (_tenures is EqualUnmodifiableListView) return _tenures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenures);
}

 final  List<TenureCount> _tenureMix;
@override@JsonKey() List<TenureCount> get tenureMix {
  if (_tenureMix is EqualUnmodifiableListView) return _tenureMix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tenureMix);
}

 final  List<NamedRef> _categories;
@override@JsonKey() List<NamedRef> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<NamedRef> _features;
@override@JsonKey() List<NamedRef> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

/// Who is assigned here — the answer to "who do I call about this block".
 final  List<NamedRef> _caretakers;
/// Who is assigned here — the answer to "who do I call about this block".
@override@JsonKey() List<NamedRef> get caretakers {
  if (_caretakers is EqualUnmodifiableListView) return _caretakers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_caretakers);
}

/// Sections whose data belongs to a module that does not exist yet. Named rather than sent
/// as zeroes, because a zero in a money field reads as "nothing owed".
 final  List<String> _pending;
/// Sections whose data belongs to a module that does not exist yet. Named rather than sent
/// as zeroes, because a zero in a money field reads as "nothing owed".
@override@JsonKey() List<String> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}


/// Create a copy of PropertyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyDetailModelCopyWith<_PropertyDetailModel> get copyWith => __$PropertyDetailModelCopyWithImpl<_PropertyDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.basementFloors, basementFloors) || other.basementFloors == basementFloors)&&(identical(other.hasMezzanine, hasMezzanine) || other.hasMezzanine == hasMezzanine)&&(identical(other.tenancyCount, tenancyCount) || other.tenancyCount == tenancyCount)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.commission, commission) || other.commission == commission)&&(identical(other.invoiceGenerationDay, invoiceGenerationDay) || other.invoiceGenerationDay == invoiceGenerationDay)&&(identical(other.expenseGenerationDay, expenseGenerationDay) || other.expenseGenerationDay == expenseGenerationDay)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.invoiceFooter, invoiceFooter) || other.invoiceFooter == invoiceFooter)&&(identical(other.tenantCanViewLease, tenantCanViewLease) || other.tenantCanViewLease == tenantCanViewLease)&&(identical(other.leaseCoversOwned, leaseCoversOwned) || other.leaseCoversOwned == leaseCoversOwned)&&(identical(other.defaultNoticeDays, defaultNoticeDays) || other.defaultNoticeDays == defaultNoticeDays)&&(identical(other.shortNoticePenalty, shortNoticePenalty) || other.shortNoticePenalty == shortNoticePenalty)&&(identical(other.shortNoticePenaltyAmount, shortNoticePenaltyAmount) || other.shortNoticePenaltyAmount == shortNoticePenaltyAmount)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.vacantUnits, vacantUnits) || other.vacantUnits == vacantUnits)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&const DeepCollectionEquality().equals(other._tenures, _tenures)&&const DeepCollectionEquality().equals(other._tenureMix, _tenureMix)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._caretakers, _caretakers)&&const DeepCollectionEquality().equals(other._pending, _pending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,estateId,estateName,location,latitude,longitude,floors,basementFloors,hasMezzanine,tenancyCount,contactName,phone,email,bankId,bankName,commission,invoiceGenerationDay,expenseGenerationDay,paymentInstructions,invoiceFooter,tenantCanViewLease,leaseCoversOwned,defaultNoticeDays,shortNoticePenalty,shortNoticePenaltyAmount,units,occupiedUnits,vacantUnits,status,createdOn,const DeepCollectionEquality().hash(_tenures),const DeepCollectionEquality().hash(_tenureMix),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_caretakers),const DeepCollectionEquality().hash(_pending)]);

@override
String toString() {
  return 'PropertyDetailModel(id: $id, name: $name, estateId: $estateId, estateName: $estateName, location: $location, latitude: $latitude, longitude: $longitude, floors: $floors, basementFloors: $basementFloors, hasMezzanine: $hasMezzanine, tenancyCount: $tenancyCount, contactName: $contactName, phone: $phone, email: $email, bankId: $bankId, bankName: $bankName, commission: $commission, invoiceGenerationDay: $invoiceGenerationDay, expenseGenerationDay: $expenseGenerationDay, paymentInstructions: $paymentInstructions, invoiceFooter: $invoiceFooter, tenantCanViewLease: $tenantCanViewLease, leaseCoversOwned: $leaseCoversOwned, defaultNoticeDays: $defaultNoticeDays, shortNoticePenalty: $shortNoticePenalty, shortNoticePenaltyAmount: $shortNoticePenaltyAmount, units: $units, occupiedUnits: $occupiedUnits, vacantUnits: $vacantUnits, status: $status, createdOn: $createdOn, tenures: $tenures, tenureMix: $tenureMix, categories: $categories, features: $features, caretakers: $caretakers, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$PropertyDetailModelCopyWith<$Res> implements $PropertyDetailModelCopyWith<$Res> {
  factory _$PropertyDetailModelCopyWith(_PropertyDetailModel value, $Res Function(_PropertyDetailModel) _then) = __$PropertyDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? estateId, String? estateName, String? location, double? latitude, double? longitude, int? floors, int basementFloors, bool hasMezzanine, int tenancyCount, String? contactName, String? phone, String? email, String? bankId, String? bankName,@JsonKey(fromJson: parseDoubleNullable) double? commission, int? invoiceGenerationDay, int? expenseGenerationDay, String? paymentInstructions, String? invoiceFooter, bool tenantCanViewLease, bool leaseCoversOwned, int? defaultNoticeDays, String? shortNoticePenalty,@JsonKey(fromJson: parseDoubleNullable) double? shortNoticePenaltyAmount, int units, int occupiedUnits, int vacantUnits, int status, String? createdOn, List<String> tenures, List<TenureCount> tenureMix, List<NamedRef> categories, List<NamedRef> features, List<NamedRef> caretakers, List<String> pending
});




}
/// @nodoc
class __$PropertyDetailModelCopyWithImpl<$Res>
    implements _$PropertyDetailModelCopyWith<$Res> {
  __$PropertyDetailModelCopyWithImpl(this._self, this._then);

  final _PropertyDetailModel _self;
  final $Res Function(_PropertyDetailModel) _then;

/// Create a copy of PropertyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? estateId = freezed,Object? estateName = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? floors = freezed,Object? basementFloors = null,Object? hasMezzanine = null,Object? tenancyCount = null,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? bankId = freezed,Object? bankName = freezed,Object? commission = freezed,Object? invoiceGenerationDay = freezed,Object? expenseGenerationDay = freezed,Object? paymentInstructions = freezed,Object? invoiceFooter = freezed,Object? tenantCanViewLease = null,Object? leaseCoversOwned = null,Object? defaultNoticeDays = freezed,Object? shortNoticePenalty = freezed,Object? shortNoticePenaltyAmount = freezed,Object? units = null,Object? occupiedUnits = null,Object? vacantUnits = null,Object? status = null,Object? createdOn = freezed,Object? tenures = null,Object? tenureMix = null,Object? categories = null,Object? features = null,Object? caretakers = null,Object? pending = null,}) {
  return _then(_PropertyDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int?,basementFloors: null == basementFloors ? _self.basementFloors : basementFloors // ignore: cast_nullable_to_non_nullable
as int,hasMezzanine: null == hasMezzanine ? _self.hasMezzanine : hasMezzanine // ignore: cast_nullable_to_non_nullable
as bool,tenancyCount: null == tenancyCount ? _self.tenancyCount : tenancyCount // ignore: cast_nullable_to_non_nullable
as int,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,commission: freezed == commission ? _self.commission : commission // ignore: cast_nullable_to_non_nullable
as double?,invoiceGenerationDay: freezed == invoiceGenerationDay ? _self.invoiceGenerationDay : invoiceGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,expenseGenerationDay: freezed == expenseGenerationDay ? _self.expenseGenerationDay : expenseGenerationDay // ignore: cast_nullable_to_non_nullable
as int?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,invoiceFooter: freezed == invoiceFooter ? _self.invoiceFooter : invoiceFooter // ignore: cast_nullable_to_non_nullable
as String?,tenantCanViewLease: null == tenantCanViewLease ? _self.tenantCanViewLease : tenantCanViewLease // ignore: cast_nullable_to_non_nullable
as bool,leaseCoversOwned: null == leaseCoversOwned ? _self.leaseCoversOwned : leaseCoversOwned // ignore: cast_nullable_to_non_nullable
as bool,defaultNoticeDays: freezed == defaultNoticeDays ? _self.defaultNoticeDays : defaultNoticeDays // ignore: cast_nullable_to_non_nullable
as int?,shortNoticePenalty: freezed == shortNoticePenalty ? _self.shortNoticePenalty : shortNoticePenalty // ignore: cast_nullable_to_non_nullable
as String?,shortNoticePenaltyAmount: freezed == shortNoticePenaltyAmount ? _self.shortNoticePenaltyAmount : shortNoticePenaltyAmount // ignore: cast_nullable_to_non_nullable
as double?,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,vacantUnits: null == vacantUnits ? _self.vacantUnits : vacantUnits // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,tenures: null == tenures ? _self._tenures : tenures // ignore: cast_nullable_to_non_nullable
as List<String>,tenureMix: null == tenureMix ? _self._tenureMix : tenureMix // ignore: cast_nullable_to_non_nullable
as List<TenureCount>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,caretakers: null == caretakers ? _self._caretakers : caretakers // ignore: cast_nullable_to_non_nullable
as List<NamedRef>,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TenureCount {

 String get tenure; int get units; int get occupied;
/// Create a copy of TenureCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenureCountCopyWith<TenureCount> get copyWith => _$TenureCountCopyWithImpl<TenureCount>(this as TenureCount, _$identity);

  /// Serializes this TenureCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenureCount&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupied, occupied) || other.occupied == occupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenure,units,occupied);

@override
String toString() {
  return 'TenureCount(tenure: $tenure, units: $units, occupied: $occupied)';
}


}

/// @nodoc
abstract mixin class $TenureCountCopyWith<$Res>  {
  factory $TenureCountCopyWith(TenureCount value, $Res Function(TenureCount) _then) = _$TenureCountCopyWithImpl;
@useResult
$Res call({
 String tenure, int units, int occupied
});




}
/// @nodoc
class _$TenureCountCopyWithImpl<$Res>
    implements $TenureCountCopyWith<$Res> {
  _$TenureCountCopyWithImpl(this._self, this._then);

  final TenureCount _self;
  final $Res Function(TenureCount) _then;

/// Create a copy of TenureCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tenure = null,Object? units = null,Object? occupied = null,}) {
  return _then(_self.copyWith(
tenure: null == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TenureCount].
extension TenureCountPatterns on TenureCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenureCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenureCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenureCount value)  $default,){
final _that = this;
switch (_that) {
case _TenureCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenureCount value)?  $default,){
final _that = this;
switch (_that) {
case _TenureCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tenure,  int units,  int occupied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenureCount() when $default != null:
return $default(_that.tenure,_that.units,_that.occupied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tenure,  int units,  int occupied)  $default,) {final _that = this;
switch (_that) {
case _TenureCount():
return $default(_that.tenure,_that.units,_that.occupied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tenure,  int units,  int occupied)?  $default,) {final _that = this;
switch (_that) {
case _TenureCount() when $default != null:
return $default(_that.tenure,_that.units,_that.occupied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenureCount extends TenureCount {
  const _TenureCount({required this.tenure, this.units = 0, this.occupied = 0}): super._();
  factory _TenureCount.fromJson(Map<String, dynamic> json) => _$TenureCountFromJson(json);

@override final  String tenure;
@override@JsonKey() final  int units;
@override@JsonKey() final  int occupied;

/// Create a copy of TenureCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenureCountCopyWith<_TenureCount> get copyWith => __$TenureCountCopyWithImpl<_TenureCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenureCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenureCount&&(identical(other.tenure, tenure) || other.tenure == tenure)&&(identical(other.units, units) || other.units == units)&&(identical(other.occupied, occupied) || other.occupied == occupied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tenure,units,occupied);

@override
String toString() {
  return 'TenureCount(tenure: $tenure, units: $units, occupied: $occupied)';
}


}

/// @nodoc
abstract mixin class _$TenureCountCopyWith<$Res> implements $TenureCountCopyWith<$Res> {
  factory _$TenureCountCopyWith(_TenureCount value, $Res Function(_TenureCount) _then) = __$TenureCountCopyWithImpl;
@override @useResult
$Res call({
 String tenure, int units, int occupied
});




}
/// @nodoc
class __$TenureCountCopyWithImpl<$Res>
    implements _$TenureCountCopyWith<$Res> {
  __$TenureCountCopyWithImpl(this._self, this._then);

  final _TenureCount _self;
  final $Res Function(_TenureCount) _then;

/// Create a copy of TenureCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tenure = null,Object? units = null,Object? occupied = null,}) {
  return _then(_TenureCount(
tenure: null == tenure ? _self.tenure : tenure // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
