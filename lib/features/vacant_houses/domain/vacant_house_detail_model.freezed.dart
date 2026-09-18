// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacant_house_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacantHouseDetailModel {

 String get id; String get title; String? get categoryName;/// Residential, Commercial.
 String? get usageClassName; String? get description; String? get propertyName; String? get area;@JsonKey(fromJson: parseDoubleNullable) double? get rent;@JsonKey(fromJson: parseDoubleNullable) double? get deposit;/// Everything payable before the keys change hands, itemised. Some of it comes back at the
/// end and some does not, which is the distinction [MoveInCostModel.refundable] carries.
 List<MoveInCostModel> get moveInCosts; int? get bedrooms; int? get bathrooms; int? get ensuiteBathrooms;@JsonKey(fromJson: parseDoubleNullable) double? get squareFt; String? get floorLabel; bool get dsq; int? get parkingSpaces; double? get latitude; double? get longitude; List<String> get images; List<ListingAmenity> get amenities; String? get availableFrom; String? get contactName; String? get contactPhone; String? get contactEmail;
/// Create a copy of VacantHouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseDetailModelCopyWith<VacantHouseDetailModel> get copyWith => _$VacantHouseDetailModelCopyWithImpl<VacantHouseDetailModel>(this as VacantHouseDetailModel, _$identity);

  /// Serializes this VacantHouseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.description, description) || other.description == description)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&const DeepCollectionEquality().equals(other.moveInCosts, moveInCosts)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.ensuiteBathrooms, ensuiteBathrooms) || other.ensuiteBathrooms == ensuiteBathrooms)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,categoryName,usageClassName,description,propertyName,area,rent,deposit,const DeepCollectionEquality().hash(moveInCosts),bedrooms,bathrooms,ensuiteBathrooms,squareFt,floorLabel,dsq,parkingSpaces,latitude,longitude,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(amenities),availableFrom,contactName,contactPhone,contactEmail]);

@override
String toString() {
  return 'VacantHouseDetailModel(id: $id, title: $title, categoryName: $categoryName, usageClassName: $usageClassName, description: $description, propertyName: $propertyName, area: $area, rent: $rent, deposit: $deposit, moveInCosts: $moveInCosts, bedrooms: $bedrooms, bathrooms: $bathrooms, ensuiteBathrooms: $ensuiteBathrooms, squareFt: $squareFt, floorLabel: $floorLabel, dsq: $dsq, parkingSpaces: $parkingSpaces, latitude: $latitude, longitude: $longitude, images: $images, amenities: $amenities, availableFrom: $availableFrom, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class $VacantHouseDetailModelCopyWith<$Res>  {
  factory $VacantHouseDetailModelCopyWith(VacantHouseDetailModel value, $Res Function(VacantHouseDetailModel) _then) = _$VacantHouseDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? categoryName, String? usageClassName, String? description, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? rent,@JsonKey(fromJson: parseDoubleNullable) double? deposit, List<MoveInCostModel> moveInCosts, int? bedrooms, int? bathrooms, int? ensuiteBathrooms,@JsonKey(fromJson: parseDoubleNullable) double? squareFt, String? floorLabel, bool dsq, int? parkingSpaces, double? latitude, double? longitude, List<String> images, List<ListingAmenity> amenities, String? availableFrom, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class _$VacantHouseDetailModelCopyWithImpl<$Res>
    implements $VacantHouseDetailModelCopyWith<$Res> {
  _$VacantHouseDetailModelCopyWithImpl(this._self, this._then);

  final VacantHouseDetailModel _self;
  final $Res Function(VacantHouseDetailModel) _then;

/// Create a copy of VacantHouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? usageClassName = freezed,Object? description = freezed,Object? propertyName = freezed,Object? area = freezed,Object? rent = freezed,Object? deposit = freezed,Object? moveInCosts = null,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? ensuiteBathrooms = freezed,Object? squareFt = freezed,Object? floorLabel = freezed,Object? dsq = null,Object? parkingSpaces = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? images = null,Object? amenities = null,Object? availableFrom = freezed,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,deposit: freezed == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double?,moveInCosts: null == moveInCosts ? _self.moveInCosts : moveInCosts // ignore: cast_nullable_to_non_nullable
as List<MoveInCostModel>,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,ensuiteBathrooms: freezed == ensuiteBathrooms ? _self.ensuiteBathrooms : ensuiteBathrooms // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parkingSpaces: freezed == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<ListingAmenity>,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacantHouseDetailModel].
extension VacantHouseDetailModelPatterns on VacantHouseDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacantHouseDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacantHouseDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _VacantHouseDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacantHouseDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? usageClassName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent, @JsonKey(fromJson: parseDoubleNullable)  double? deposit,  List<MoveInCostModel> moveInCosts,  int? bedrooms,  int? bathrooms,  int? ensuiteBathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  String? floorLabel,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude,  List<String> images,  List<ListingAmenity> amenities,  String? availableFrom,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.usageClassName,_that.description,_that.propertyName,_that.area,_that.rent,_that.deposit,_that.moveInCosts,_that.bedrooms,_that.bathrooms,_that.ensuiteBathrooms,_that.squareFt,_that.floorLabel,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.availableFrom,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? categoryName,  String? usageClassName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent, @JsonKey(fromJson: parseDoubleNullable)  double? deposit,  List<MoveInCostModel> moveInCosts,  int? bedrooms,  int? bathrooms,  int? ensuiteBathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  String? floorLabel,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude,  List<String> images,  List<ListingAmenity> amenities,  String? availableFrom,  String? contactName,  String? contactPhone,  String? contactEmail)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel():
return $default(_that.id,_that.title,_that.categoryName,_that.usageClassName,_that.description,_that.propertyName,_that.area,_that.rent,_that.deposit,_that.moveInCosts,_that.bedrooms,_that.bathrooms,_that.ensuiteBathrooms,_that.squareFt,_that.floorLabel,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.availableFrom,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? categoryName,  String? usageClassName,  String? description,  String? propertyName,  String? area, @JsonKey(fromJson: parseDoubleNullable)  double? rent, @JsonKey(fromJson: parseDoubleNullable)  double? deposit,  List<MoveInCostModel> moveInCosts,  int? bedrooms,  int? bathrooms,  int? ensuiteBathrooms, @JsonKey(fromJson: parseDoubleNullable)  double? squareFt,  String? floorLabel,  bool dsq,  int? parkingSpaces,  double? latitude,  double? longitude,  List<String> images,  List<ListingAmenity> amenities,  String? availableFrom,  String? contactName,  String? contactPhone,  String? contactEmail)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.categoryName,_that.usageClassName,_that.description,_that.propertyName,_that.area,_that.rent,_that.deposit,_that.moveInCosts,_that.bedrooms,_that.bathrooms,_that.ensuiteBathrooms,_that.squareFt,_that.floorLabel,_that.dsq,_that.parkingSpaces,_that.latitude,_that.longitude,_that.images,_that.amenities,_that.availableFrom,_that.contactName,_that.contactPhone,_that.contactEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseDetailModel extends VacantHouseDetailModel {
  const _VacantHouseDetailModel({required this.id, this.title = '', this.categoryName, this.usageClassName, this.description, this.propertyName, this.area, @JsonKey(fromJson: parseDoubleNullable) this.rent, @JsonKey(fromJson: parseDoubleNullable) this.deposit, final  List<MoveInCostModel> moveInCosts = const <MoveInCostModel>[], this.bedrooms, this.bathrooms, this.ensuiteBathrooms, @JsonKey(fromJson: parseDoubleNullable) this.squareFt, this.floorLabel, this.dsq = false, this.parkingSpaces, this.latitude, this.longitude, final  List<String> images = const <String>[], final  List<ListingAmenity> amenities = const <ListingAmenity>[], this.availableFrom, this.contactName, this.contactPhone, this.contactEmail}): _moveInCosts = moveInCosts,_images = images,_amenities = amenities,super._();
  factory _VacantHouseDetailModel.fromJson(Map<String, dynamic> json) => _$VacantHouseDetailModelFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override final  String? categoryName;
/// Residential, Commercial.
@override final  String? usageClassName;
@override final  String? description;
@override final  String? propertyName;
@override final  String? area;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? rent;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? deposit;
/// Everything payable before the keys change hands, itemised. Some of it comes back at the
/// end and some does not, which is the distinction [MoveInCostModel.refundable] carries.
 final  List<MoveInCostModel> _moveInCosts;
/// Everything payable before the keys change hands, itemised. Some of it comes back at the
/// end and some does not, which is the distinction [MoveInCostModel.refundable] carries.
@override@JsonKey() List<MoveInCostModel> get moveInCosts {
  if (_moveInCosts is EqualUnmodifiableListView) return _moveInCosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moveInCosts);
}

@override final  int? bedrooms;
@override final  int? bathrooms;
@override final  int? ensuiteBathrooms;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? squareFt;
@override final  String? floorLabel;
@override@JsonKey() final  bool dsq;
@override final  int? parkingSpaces;
@override final  double? latitude;
@override final  double? longitude;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<ListingAmenity> _amenities;
@override@JsonKey() List<ListingAmenity> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

@override final  String? availableFrom;
@override final  String? contactName;
@override final  String? contactPhone;
@override final  String? contactEmail;

/// Create a copy of VacantHouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacantHouseDetailModelCopyWith<_VacantHouseDetailModel> get copyWith => __$VacantHouseDetailModelCopyWithImpl<_VacantHouseDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacantHouseDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.usageClassName, usageClassName) || other.usageClassName == usageClassName)&&(identical(other.description, description) || other.description == description)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.area, area) || other.area == area)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.deposit, deposit) || other.deposit == deposit)&&const DeepCollectionEquality().equals(other._moveInCosts, _moveInCosts)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.ensuiteBathrooms, ensuiteBathrooms) || other.ensuiteBathrooms == ensuiteBathrooms)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.dsq, dsq) || other.dsq == dsq)&&(identical(other.parkingSpaces, parkingSpaces) || other.parkingSpaces == parkingSpaces)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,categoryName,usageClassName,description,propertyName,area,rent,deposit,const DeepCollectionEquality().hash(_moveInCosts),bedrooms,bathrooms,ensuiteBathrooms,squareFt,floorLabel,dsq,parkingSpaces,latitude,longitude,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_amenities),availableFrom,contactName,contactPhone,contactEmail]);

@override
String toString() {
  return 'VacantHouseDetailModel(id: $id, title: $title, categoryName: $categoryName, usageClassName: $usageClassName, description: $description, propertyName: $propertyName, area: $area, rent: $rent, deposit: $deposit, moveInCosts: $moveInCosts, bedrooms: $bedrooms, bathrooms: $bathrooms, ensuiteBathrooms: $ensuiteBathrooms, squareFt: $squareFt, floorLabel: $floorLabel, dsq: $dsq, parkingSpaces: $parkingSpaces, latitude: $latitude, longitude: $longitude, images: $images, amenities: $amenities, availableFrom: $availableFrom, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseDetailModelCopyWith<$Res> implements $VacantHouseDetailModelCopyWith<$Res> {
  factory _$VacantHouseDetailModelCopyWith(_VacantHouseDetailModel value, $Res Function(_VacantHouseDetailModel) _then) = __$VacantHouseDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? categoryName, String? usageClassName, String? description, String? propertyName, String? area,@JsonKey(fromJson: parseDoubleNullable) double? rent,@JsonKey(fromJson: parseDoubleNullable) double? deposit, List<MoveInCostModel> moveInCosts, int? bedrooms, int? bathrooms, int? ensuiteBathrooms,@JsonKey(fromJson: parseDoubleNullable) double? squareFt, String? floorLabel, bool dsq, int? parkingSpaces, double? latitude, double? longitude, List<String> images, List<ListingAmenity> amenities, String? availableFrom, String? contactName, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class __$VacantHouseDetailModelCopyWithImpl<$Res>
    implements _$VacantHouseDetailModelCopyWith<$Res> {
  __$VacantHouseDetailModelCopyWithImpl(this._self, this._then);

  final _VacantHouseDetailModel _self;
  final $Res Function(_VacantHouseDetailModel) _then;

/// Create a copy of VacantHouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categoryName = freezed,Object? usageClassName = freezed,Object? description = freezed,Object? propertyName = freezed,Object? area = freezed,Object? rent = freezed,Object? deposit = freezed,Object? moveInCosts = null,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? ensuiteBathrooms = freezed,Object? squareFt = freezed,Object? floorLabel = freezed,Object? dsq = null,Object? parkingSpaces = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? images = null,Object? amenities = null,Object? availableFrom = freezed,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_VacantHouseDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,usageClassName: freezed == usageClassName ? _self.usageClassName : usageClassName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,rent: freezed == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double?,deposit: freezed == deposit ? _self.deposit : deposit // ignore: cast_nullable_to_non_nullable
as double?,moveInCosts: null == moveInCosts ? _self._moveInCosts : moveInCosts // ignore: cast_nullable_to_non_nullable
as List<MoveInCostModel>,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,ensuiteBathrooms: freezed == ensuiteBathrooms ? _self.ensuiteBathrooms : ensuiteBathrooms // ignore: cast_nullable_to_non_nullable
as int?,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,dsq: null == dsq ? _self.dsq : dsq // ignore: cast_nullable_to_non_nullable
as bool,parkingSpaces: freezed == parkingSpaces ? _self.parkingSpaces : parkingSpaces // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<ListingAmenity>,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MoveInCostModel {

 String get name;/// Null where the charge is expressed as a rule rather than a figure — "two months' rent"
/// before a rent has been agreed. Shown as the rule, not as zero.
@JsonKey(fromJson: parseDoubleNullable) double? get amount;/// Whether it comes back at the end. The difference between a deposit and a fee, and the
/// thing somebody most wants to know when they add the total up.
 bool get refundable;/// Expressed in months of rent, where that is how it is set.
 int? get months;
/// Create a copy of MoveInCostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveInCostModelCopyWith<MoveInCostModel> get copyWith => _$MoveInCostModelCopyWithImpl<MoveInCostModel>(this as MoveInCostModel, _$identity);

  /// Serializes this MoveInCostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveInCostModel&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.months, months) || other.months == months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,refundable,months);

@override
String toString() {
  return 'MoveInCostModel(name: $name, amount: $amount, refundable: $refundable, months: $months)';
}


}

/// @nodoc
abstract mixin class $MoveInCostModelCopyWith<$Res>  {
  factory $MoveInCostModelCopyWith(MoveInCostModel value, $Res Function(MoveInCostModel) _then) = _$MoveInCostModelCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(fromJson: parseDoubleNullable) double? amount, bool refundable, int? months
});




}
/// @nodoc
class _$MoveInCostModelCopyWithImpl<$Res>
    implements $MoveInCostModelCopyWith<$Res> {
  _$MoveInCostModelCopyWithImpl(this._self, this._then);

  final MoveInCostModel _self;
  final $Res Function(MoveInCostModel) _then;

/// Create a copy of MoveInCostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = freezed,Object? refundable = null,Object? months = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoveInCostModel].
extension MoveInCostModelPatterns on MoveInCostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoveInCostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoveInCostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoveInCostModel value)  $default,){
final _that = this;
switch (_that) {
case _MoveInCostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoveInCostModel value)?  $default,){
final _that = this;
switch (_that) {
case _MoveInCostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  bool refundable,  int? months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoveInCostModel() when $default != null:
return $default(_that.name,_that.amount,_that.refundable,_that.months);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  bool refundable,  int? months)  $default,) {final _that = this;
switch (_that) {
case _MoveInCostModel():
return $default(_that.name,_that.amount,_that.refundable,_that.months);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  bool refundable,  int? months)?  $default,) {final _that = this;
switch (_that) {
case _MoveInCostModel() when $default != null:
return $default(_that.name,_that.amount,_that.refundable,_that.months);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoveInCostModel extends MoveInCostModel {
  const _MoveInCostModel({required this.name, @JsonKey(fromJson: parseDoubleNullable) this.amount, this.refundable = false, this.months}): super._();
  factory _MoveInCostModel.fromJson(Map<String, dynamic> json) => _$MoveInCostModelFromJson(json);

@override final  String name;
/// Null where the charge is expressed as a rule rather than a figure — "two months' rent"
/// before a rent has been agreed. Shown as the rule, not as zero.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? amount;
/// Whether it comes back at the end. The difference between a deposit and a fee, and the
/// thing somebody most wants to know when they add the total up.
@override@JsonKey() final  bool refundable;
/// Expressed in months of rent, where that is how it is set.
@override final  int? months;

/// Create a copy of MoveInCostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveInCostModelCopyWith<_MoveInCostModel> get copyWith => __$MoveInCostModelCopyWithImpl<_MoveInCostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveInCostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveInCostModel&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.months, months) || other.months == months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,refundable,months);

@override
String toString() {
  return 'MoveInCostModel(name: $name, amount: $amount, refundable: $refundable, months: $months)';
}


}

/// @nodoc
abstract mixin class _$MoveInCostModelCopyWith<$Res> implements $MoveInCostModelCopyWith<$Res> {
  factory _$MoveInCostModelCopyWith(_MoveInCostModel value, $Res Function(_MoveInCostModel) _then) = __$MoveInCostModelCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(fromJson: parseDoubleNullable) double? amount, bool refundable, int? months
});




}
/// @nodoc
class __$MoveInCostModelCopyWithImpl<$Res>
    implements _$MoveInCostModelCopyWith<$Res> {
  __$MoveInCostModelCopyWithImpl(this._self, this._then);

  final _MoveInCostModel _self;
  final $Res Function(_MoveInCostModel) _then;

/// Create a copy of MoveInCostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = freezed,Object? refundable = null,Object? months = freezed,}) {
  return _then(_MoveInCostModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ListingAmenity {

 String get name; String? get icon;
/// Create a copy of ListingAmenity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingAmenityCopyWith<ListingAmenity> get copyWith => _$ListingAmenityCopyWithImpl<ListingAmenity>(this as ListingAmenity, _$identity);

  /// Serializes this ListingAmenity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingAmenity&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'ListingAmenity(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $ListingAmenityCopyWith<$Res>  {
  factory $ListingAmenityCopyWith(ListingAmenity value, $Res Function(ListingAmenity) _then) = _$ListingAmenityCopyWithImpl;
@useResult
$Res call({
 String name, String? icon
});




}
/// @nodoc
class _$ListingAmenityCopyWithImpl<$Res>
    implements $ListingAmenityCopyWith<$Res> {
  _$ListingAmenityCopyWithImpl(this._self, this._then);

  final ListingAmenity _self;
  final $Res Function(ListingAmenity) _then;

/// Create a copy of ListingAmenity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingAmenity].
extension ListingAmenityPatterns on ListingAmenity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingAmenity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingAmenity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingAmenity value)  $default,){
final _that = this;
switch (_that) {
case _ListingAmenity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingAmenity value)?  $default,){
final _that = this;
switch (_that) {
case _ListingAmenity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingAmenity() when $default != null:
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _ListingAmenity():
return $default(_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _ListingAmenity() when $default != null:
return $default(_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingAmenity extends ListingAmenity {
  const _ListingAmenity({required this.name, this.icon}): super._();
  factory _ListingAmenity.fromJson(Map<String, dynamic> json) => _$ListingAmenityFromJson(json);

@override final  String name;
@override final  String? icon;

/// Create a copy of ListingAmenity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingAmenityCopyWith<_ListingAmenity> get copyWith => __$ListingAmenityCopyWithImpl<_ListingAmenity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingAmenityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingAmenity&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,icon);

@override
String toString() {
  return 'ListingAmenity(name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$ListingAmenityCopyWith<$Res> implements $ListingAmenityCopyWith<$Res> {
  factory _$ListingAmenityCopyWith(_ListingAmenity value, $Res Function(_ListingAmenity) _then) = __$ListingAmenityCopyWithImpl;
@override @useResult
$Res call({
 String name, String? icon
});




}
/// @nodoc
class __$ListingAmenityCopyWithImpl<$Res>
    implements _$ListingAmenityCopyWith<$Res> {
  __$ListingAmenityCopyWithImpl(this._self, this._then);

  final _ListingAmenity _self;
  final $Res Function(_ListingAmenity) _then;

/// Create a copy of ListingAmenity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? icon = freezed,}) {
  return _then(_ListingAmenity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ListingChoice {

 String get value; String get label; int get count;
/// Create a copy of ListingChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingChoiceCopyWith<ListingChoice> get copyWith => _$ListingChoiceCopyWithImpl<ListingChoice>(this as ListingChoice, _$identity);

  /// Serializes this ListingChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingChoice&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count);

@override
String toString() {
  return 'ListingChoice(value: $value, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class $ListingChoiceCopyWith<$Res>  {
  factory $ListingChoiceCopyWith(ListingChoice value, $Res Function(ListingChoice) _then) = _$ListingChoiceCopyWithImpl;
@useResult
$Res call({
 String value, String label, int count
});




}
/// @nodoc
class _$ListingChoiceCopyWithImpl<$Res>
    implements $ListingChoiceCopyWith<$Res> {
  _$ListingChoiceCopyWithImpl(this._self, this._then);

  final ListingChoice _self;
  final $Res Function(ListingChoice) _then;

/// Create a copy of ListingChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? count = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingChoice].
extension ListingChoicePatterns on ListingChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingChoice value)  $default,){
final _that = this;
switch (_that) {
case _ListingChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingChoice value)?  $default,){
final _that = this;
switch (_that) {
case _ListingChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingChoice() when $default != null:
return $default(_that.value,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  int count)  $default,) {final _that = this;
switch (_that) {
case _ListingChoice():
return $default(_that.value,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ListingChoice() when $default != null:
return $default(_that.value,_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingChoice extends ListingChoice {
  const _ListingChoice({required this.value, required this.label, this.count = 0}): super._();
  factory _ListingChoice.fromJson(Map<String, dynamic> json) => _$ListingChoiceFromJson(json);

@override final  String value;
@override final  String label;
@override@JsonKey() final  int count;

/// Create a copy of ListingChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingChoiceCopyWith<_ListingChoice> get copyWith => __$ListingChoiceCopyWithImpl<_ListingChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingChoice&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count);

@override
String toString() {
  return 'ListingChoice(value: $value, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ListingChoiceCopyWith<$Res> implements $ListingChoiceCopyWith<$Res> {
  factory _$ListingChoiceCopyWith(_ListingChoice value, $Res Function(_ListingChoice) _then) = __$ListingChoiceCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, int count
});




}
/// @nodoc
class __$ListingChoiceCopyWithImpl<$Res>
    implements _$ListingChoiceCopyWith<$Res> {
  __$ListingChoiceCopyWithImpl(this._self, this._then);

  final _ListingChoice _self;
  final $Res Function(_ListingChoice) _then;

/// Create a copy of ListingChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? count = null,}) {
  return _then(_ListingChoice(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ListingFilters {

 List<ListingChoice> get categories;/// Areas the server counts, parsed and no longer offered as a filter.
///
/// Location is asked as a place now, not picked from a list — a chip row cannot express
/// "within two kilometres of here", and offering both would be two controls answering one
/// question differently. Kept because the server sends it and a model that silently drops a
/// field is harder to read than one that carries it.
 List<ListingChoice> get areas;@JsonKey(fromJson: parseDoubleNullable) double? get minRent;@JsonKey(fromJson: parseDoubleNullable) double? get maxRent; int get maxBedrooms; int get total;
/// Create a copy of ListingFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingFiltersCopyWith<ListingFilters> get copyWith => _$ListingFiltersCopyWithImpl<ListingFilters>(this as ListingFilters, _$identity);

  /// Serializes this ListingFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingFilters&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.areas, areas)&&(identical(other.minRent, minRent) || other.minRent == minRent)&&(identical(other.maxRent, maxRent) || other.maxRent == maxRent)&&(identical(other.maxBedrooms, maxBedrooms) || other.maxBedrooms == maxBedrooms)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(areas),minRent,maxRent,maxBedrooms,total);

@override
String toString() {
  return 'ListingFilters(categories: $categories, areas: $areas, minRent: $minRent, maxRent: $maxRent, maxBedrooms: $maxBedrooms, total: $total)';
}


}

/// @nodoc
abstract mixin class $ListingFiltersCopyWith<$Res>  {
  factory $ListingFiltersCopyWith(ListingFilters value, $Res Function(ListingFilters) _then) = _$ListingFiltersCopyWithImpl;
@useResult
$Res call({
 List<ListingChoice> categories, List<ListingChoice> areas,@JsonKey(fromJson: parseDoubleNullable) double? minRent,@JsonKey(fromJson: parseDoubleNullable) double? maxRent, int maxBedrooms, int total
});




}
/// @nodoc
class _$ListingFiltersCopyWithImpl<$Res>
    implements $ListingFiltersCopyWith<$Res> {
  _$ListingFiltersCopyWithImpl(this._self, this._then);

  final ListingFilters _self;
  final $Res Function(ListingFilters) _then;

/// Create a copy of ListingFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? areas = null,Object? minRent = freezed,Object? maxRent = freezed,Object? maxBedrooms = null,Object? total = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ListingChoice>,areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<ListingChoice>,minRent: freezed == minRent ? _self.minRent : minRent // ignore: cast_nullable_to_non_nullable
as double?,maxRent: freezed == maxRent ? _self.maxRent : maxRent // ignore: cast_nullable_to_non_nullable
as double?,maxBedrooms: null == maxBedrooms ? _self.maxBedrooms : maxBedrooms // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingFilters].
extension ListingFiltersPatterns on ListingFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingFilters value)  $default,){
final _that = this;
switch (_that) {
case _ListingFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingFilters value)?  $default,){
final _that = this;
switch (_that) {
case _ListingFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListingChoice> categories,  List<ListingChoice> areas, @JsonKey(fromJson: parseDoubleNullable)  double? minRent, @JsonKey(fromJson: parseDoubleNullable)  double? maxRent,  int maxBedrooms,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingFilters() when $default != null:
return $default(_that.categories,_that.areas,_that.minRent,_that.maxRent,_that.maxBedrooms,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListingChoice> categories,  List<ListingChoice> areas, @JsonKey(fromJson: parseDoubleNullable)  double? minRent, @JsonKey(fromJson: parseDoubleNullable)  double? maxRent,  int maxBedrooms,  int total)  $default,) {final _that = this;
switch (_that) {
case _ListingFilters():
return $default(_that.categories,_that.areas,_that.minRent,_that.maxRent,_that.maxBedrooms,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListingChoice> categories,  List<ListingChoice> areas, @JsonKey(fromJson: parseDoubleNullable)  double? minRent, @JsonKey(fromJson: parseDoubleNullable)  double? maxRent,  int maxBedrooms,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ListingFilters() when $default != null:
return $default(_that.categories,_that.areas,_that.minRent,_that.maxRent,_that.maxBedrooms,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingFilters extends ListingFilters {
  const _ListingFilters({final  List<ListingChoice> categories = const <ListingChoice>[], final  List<ListingChoice> areas = const <ListingChoice>[], @JsonKey(fromJson: parseDoubleNullable) this.minRent, @JsonKey(fromJson: parseDoubleNullable) this.maxRent, this.maxBedrooms = 0, this.total = 0}): _categories = categories,_areas = areas,super._();
  factory _ListingFilters.fromJson(Map<String, dynamic> json) => _$ListingFiltersFromJson(json);

 final  List<ListingChoice> _categories;
@override@JsonKey() List<ListingChoice> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// Areas the server counts, parsed and no longer offered as a filter.
///
/// Location is asked as a place now, not picked from a list — a chip row cannot express
/// "within two kilometres of here", and offering both would be two controls answering one
/// question differently. Kept because the server sends it and a model that silently drops a
/// field is harder to read than one that carries it.
 final  List<ListingChoice> _areas;
/// Areas the server counts, parsed and no longer offered as a filter.
///
/// Location is asked as a place now, not picked from a list — a chip row cannot express
/// "within two kilometres of here", and offering both would be two controls answering one
/// question differently. Kept because the server sends it and a model that silently drops a
/// field is harder to read than one that carries it.
@override@JsonKey() List<ListingChoice> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}

@override@JsonKey(fromJson: parseDoubleNullable) final  double? minRent;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? maxRent;
@override@JsonKey() final  int maxBedrooms;
@override@JsonKey() final  int total;

/// Create a copy of ListingFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingFiltersCopyWith<_ListingFilters> get copyWith => __$ListingFiltersCopyWithImpl<_ListingFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingFilters&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._areas, _areas)&&(identical(other.minRent, minRent) || other.minRent == minRent)&&(identical(other.maxRent, maxRent) || other.maxRent == maxRent)&&(identical(other.maxBedrooms, maxBedrooms) || other.maxBedrooms == maxBedrooms)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_areas),minRent,maxRent,maxBedrooms,total);

@override
String toString() {
  return 'ListingFilters(categories: $categories, areas: $areas, minRent: $minRent, maxRent: $maxRent, maxBedrooms: $maxBedrooms, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ListingFiltersCopyWith<$Res> implements $ListingFiltersCopyWith<$Res> {
  factory _$ListingFiltersCopyWith(_ListingFilters value, $Res Function(_ListingFilters) _then) = __$ListingFiltersCopyWithImpl;
@override @useResult
$Res call({
 List<ListingChoice> categories, List<ListingChoice> areas,@JsonKey(fromJson: parseDoubleNullable) double? minRent,@JsonKey(fromJson: parseDoubleNullable) double? maxRent, int maxBedrooms, int total
});




}
/// @nodoc
class __$ListingFiltersCopyWithImpl<$Res>
    implements _$ListingFiltersCopyWith<$Res> {
  __$ListingFiltersCopyWithImpl(this._self, this._then);

  final _ListingFilters _self;
  final $Res Function(_ListingFilters) _then;

/// Create a copy of ListingFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? areas = null,Object? minRent = freezed,Object? maxRent = freezed,Object? maxBedrooms = null,Object? total = null,}) {
  return _then(_ListingFilters(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ListingChoice>,areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<ListingChoice>,minRent: freezed == minRent ? _self.minRent : minRent // ignore: cast_nullable_to_non_nullable
as double?,maxRent: freezed == maxRent ? _self.maxRent : maxRent // ignore: cast_nullable_to_non_nullable
as double?,maxBedrooms: null == maxBedrooms ? _self.maxBedrooms : maxBedrooms // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
