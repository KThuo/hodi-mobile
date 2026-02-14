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

 String? get id; String? get houseName; String? get houseNumber; String? get houseCode;@JsonKey(fromJson: parseIntNullable) int? get floor; String? get description; String? get category; String? get houseType; String? get location; double? get latitude; double? get longitude; String? get property; String? get estate;@JsonKey(fromJson: parseDouble) double get rent; double? get squareFt;@JsonKey(fromJson: parseIntNullable) int? get featureCount; String? get lastOccupied; String? get imageUrl; List<VacantHouseBill> get utilityBills; List<VacantHouseBill> get onboardFees;@JsonKey(fromJson: parseDouble) double get totalMonthlyBills;@JsonKey(fromJson: parseDouble) double get totalOnboardFees;@JsonKey(fromJson: parseDouble) double get maxRefundableAmount; List<VacantHouseFeature> get houseFeatures; List<VacantHouseImage> get categoryImages;
/// Create a copy of VacantHouseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseDetailModelCopyWith<VacantHouseDetailModel> get copyWith => _$VacantHouseDetailModelCopyWithImpl<VacantHouseDetailModel>(this as VacantHouseDetailModel, _$identity);

  /// Serializes this VacantHouseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.utilityBills, utilityBills)&&const DeepCollectionEquality().equals(other.onboardFees, onboardFees)&&(identical(other.totalMonthlyBills, totalMonthlyBills) || other.totalMonthlyBills == totalMonthlyBills)&&(identical(other.totalOnboardFees, totalOnboardFees) || other.totalOnboardFees == totalOnboardFees)&&(identical(other.maxRefundableAmount, maxRefundableAmount) || other.maxRefundableAmount == maxRefundableAmount)&&const DeepCollectionEquality().equals(other.houseFeatures, houseFeatures)&&const DeepCollectionEquality().equals(other.categoryImages, categoryImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseName,houseNumber,houseCode,floor,description,category,houseType,location,latitude,longitude,property,estate,rent,squareFt,featureCount,lastOccupied,imageUrl,const DeepCollectionEquality().hash(utilityBills),const DeepCollectionEquality().hash(onboardFees),totalMonthlyBills,totalOnboardFees,maxRefundableAmount,const DeepCollectionEquality().hash(houseFeatures),const DeepCollectionEquality().hash(categoryImages)]);

@override
String toString() {
  return 'VacantHouseDetailModel(id: $id, houseName: $houseName, houseNumber: $houseNumber, houseCode: $houseCode, floor: $floor, description: $description, category: $category, houseType: $houseType, location: $location, latitude: $latitude, longitude: $longitude, property: $property, estate: $estate, rent: $rent, squareFt: $squareFt, featureCount: $featureCount, lastOccupied: $lastOccupied, imageUrl: $imageUrl, utilityBills: $utilityBills, onboardFees: $onboardFees, totalMonthlyBills: $totalMonthlyBills, totalOnboardFees: $totalOnboardFees, maxRefundableAmount: $maxRefundableAmount, houseFeatures: $houseFeatures, categoryImages: $categoryImages)';
}


}

/// @nodoc
abstract mixin class $VacantHouseDetailModelCopyWith<$Res>  {
  factory $VacantHouseDetailModelCopyWith(VacantHouseDetailModel value, $Res Function(VacantHouseDetailModel) _then) = _$VacantHouseDetailModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? houseName, String? houseNumber, String? houseCode,@JsonKey(fromJson: parseIntNullable) int? floor, String? description, String? category, String? houseType, String? location, double? latitude, double? longitude, String? property, String? estate,@JsonKey(fromJson: parseDouble) double rent, double? squareFt,@JsonKey(fromJson: parseIntNullable) int? featureCount, String? lastOccupied, String? imageUrl, List<VacantHouseBill> utilityBills, List<VacantHouseBill> onboardFees,@JsonKey(fromJson: parseDouble) double totalMonthlyBills,@JsonKey(fromJson: parseDouble) double totalOnboardFees,@JsonKey(fromJson: parseDouble) double maxRefundableAmount, List<VacantHouseFeature> houseFeatures, List<VacantHouseImage> categoryImages
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? houseName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? floor = freezed,Object? description = freezed,Object? category = freezed,Object? houseType = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? property = freezed,Object? estate = freezed,Object? rent = null,Object? squareFt = freezed,Object? featureCount = freezed,Object? lastOccupied = freezed,Object? imageUrl = freezed,Object? utilityBills = null,Object? onboardFees = null,Object? totalMonthlyBills = null,Object? totalOnboardFees = null,Object? maxRefundableAmount = null,Object? houseFeatures = null,Object? categoryImages = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,featureCount: freezed == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int?,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,utilityBills: null == utilityBills ? _self.utilityBills : utilityBills // ignore: cast_nullable_to_non_nullable
as List<VacantHouseBill>,onboardFees: null == onboardFees ? _self.onboardFees : onboardFees // ignore: cast_nullable_to_non_nullable
as List<VacantHouseBill>,totalMonthlyBills: null == totalMonthlyBills ? _self.totalMonthlyBills : totalMonthlyBills // ignore: cast_nullable_to_non_nullable
as double,totalOnboardFees: null == totalOnboardFees ? _self.totalOnboardFees : totalOnboardFees // ignore: cast_nullable_to_non_nullable
as double,maxRefundableAmount: null == maxRefundableAmount ? _self.maxRefundableAmount : maxRefundableAmount // ignore: cast_nullable_to_non_nullable
as double,houseFeatures: null == houseFeatures ? _self.houseFeatures : houseFeatures // ignore: cast_nullable_to_non_nullable
as List<VacantHouseFeature>,categoryImages: null == categoryImages ? _self.categoryImages : categoryImages // ignore: cast_nullable_to_non_nullable
as List<VacantHouseImage>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode, @JsonKey(fromJson: parseIntNullable)  int? floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate, @JsonKey(fromJson: parseDouble)  double rent,  double? squareFt, @JsonKey(fromJson: parseIntNullable)  int? featureCount,  String? lastOccupied,  String? imageUrl,  List<VacantHouseBill> utilityBills,  List<VacantHouseBill> onboardFees, @JsonKey(fromJson: parseDouble)  double totalMonthlyBills, @JsonKey(fromJson: parseDouble)  double totalOnboardFees, @JsonKey(fromJson: parseDouble)  double maxRefundableAmount,  List<VacantHouseFeature> houseFeatures,  List<VacantHouseImage> categoryImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.utilityBills,_that.onboardFees,_that.totalMonthlyBills,_that.totalOnboardFees,_that.maxRefundableAmount,_that.houseFeatures,_that.categoryImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode, @JsonKey(fromJson: parseIntNullable)  int? floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate, @JsonKey(fromJson: parseDouble)  double rent,  double? squareFt, @JsonKey(fromJson: parseIntNullable)  int? featureCount,  String? lastOccupied,  String? imageUrl,  List<VacantHouseBill> utilityBills,  List<VacantHouseBill> onboardFees, @JsonKey(fromJson: parseDouble)  double totalMonthlyBills, @JsonKey(fromJson: parseDouble)  double totalOnboardFees, @JsonKey(fromJson: parseDouble)  double maxRefundableAmount,  List<VacantHouseFeature> houseFeatures,  List<VacantHouseImage> categoryImages)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel():
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.utilityBills,_that.onboardFees,_that.totalMonthlyBills,_that.totalOnboardFees,_that.maxRefundableAmount,_that.houseFeatures,_that.categoryImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? houseName,  String? houseNumber,  String? houseCode, @JsonKey(fromJson: parseIntNullable)  int? floor,  String? description,  String? category,  String? houseType,  String? location,  double? latitude,  double? longitude,  String? property,  String? estate, @JsonKey(fromJson: parseDouble)  double rent,  double? squareFt, @JsonKey(fromJson: parseIntNullable)  int? featureCount,  String? lastOccupied,  String? imageUrl,  List<VacantHouseBill> utilityBills,  List<VacantHouseBill> onboardFees, @JsonKey(fromJson: parseDouble)  double totalMonthlyBills, @JsonKey(fromJson: parseDouble)  double totalOnboardFees, @JsonKey(fromJson: parseDouble)  double maxRefundableAmount,  List<VacantHouseFeature> houseFeatures,  List<VacantHouseImage> categoryImages)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseDetailModel() when $default != null:
return $default(_that.id,_that.houseName,_that.houseNumber,_that.houseCode,_that.floor,_that.description,_that.category,_that.houseType,_that.location,_that.latitude,_that.longitude,_that.property,_that.estate,_that.rent,_that.squareFt,_that.featureCount,_that.lastOccupied,_that.imageUrl,_that.utilityBills,_that.onboardFees,_that.totalMonthlyBills,_that.totalOnboardFees,_that.maxRefundableAmount,_that.houseFeatures,_that.categoryImages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseDetailModel extends VacantHouseDetailModel {
  const _VacantHouseDetailModel({this.id, this.houseName, this.houseNumber, this.houseCode, @JsonKey(fromJson: parseIntNullable) this.floor, this.description, this.category, this.houseType, this.location, this.latitude, this.longitude, this.property, this.estate, @JsonKey(fromJson: parseDouble) this.rent = 0, this.squareFt, @JsonKey(fromJson: parseIntNullable) this.featureCount, this.lastOccupied, this.imageUrl, final  List<VacantHouseBill> utilityBills = const [], final  List<VacantHouseBill> onboardFees = const [], @JsonKey(fromJson: parseDouble) this.totalMonthlyBills = 0, @JsonKey(fromJson: parseDouble) this.totalOnboardFees = 0, @JsonKey(fromJson: parseDouble) this.maxRefundableAmount = 0, final  List<VacantHouseFeature> houseFeatures = const [], final  List<VacantHouseImage> categoryImages = const []}): _utilityBills = utilityBills,_onboardFees = onboardFees,_houseFeatures = houseFeatures,_categoryImages = categoryImages,super._();
  factory _VacantHouseDetailModel.fromJson(Map<String, dynamic> json) => _$VacantHouseDetailModelFromJson(json);

@override final  String? id;
@override final  String? houseName;
@override final  String? houseNumber;
@override final  String? houseCode;
@override@JsonKey(fromJson: parseIntNullable) final  int? floor;
@override final  String? description;
@override final  String? category;
@override final  String? houseType;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? property;
@override final  String? estate;
@override@JsonKey(fromJson: parseDouble) final  double rent;
@override final  double? squareFt;
@override@JsonKey(fromJson: parseIntNullable) final  int? featureCount;
@override final  String? lastOccupied;
@override final  String? imageUrl;
 final  List<VacantHouseBill> _utilityBills;
@override@JsonKey() List<VacantHouseBill> get utilityBills {
  if (_utilityBills is EqualUnmodifiableListView) return _utilityBills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_utilityBills);
}

 final  List<VacantHouseBill> _onboardFees;
@override@JsonKey() List<VacantHouseBill> get onboardFees {
  if (_onboardFees is EqualUnmodifiableListView) return _onboardFees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_onboardFees);
}

@override@JsonKey(fromJson: parseDouble) final  double totalMonthlyBills;
@override@JsonKey(fromJson: parseDouble) final  double totalOnboardFees;
@override@JsonKey(fromJson: parseDouble) final  double maxRefundableAmount;
 final  List<VacantHouseFeature> _houseFeatures;
@override@JsonKey() List<VacantHouseFeature> get houseFeatures {
  if (_houseFeatures is EqualUnmodifiableListView) return _houseFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_houseFeatures);
}

 final  List<VacantHouseImage> _categoryImages;
@override@JsonKey() List<VacantHouseImage> get categoryImages {
  if (_categoryImages is EqualUnmodifiableListView) return _categoryImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryImages);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.property, property) || other.property == property)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.squareFt, squareFt) || other.squareFt == squareFt)&&(identical(other.featureCount, featureCount) || other.featureCount == featureCount)&&(identical(other.lastOccupied, lastOccupied) || other.lastOccupied == lastOccupied)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._utilityBills, _utilityBills)&&const DeepCollectionEquality().equals(other._onboardFees, _onboardFees)&&(identical(other.totalMonthlyBills, totalMonthlyBills) || other.totalMonthlyBills == totalMonthlyBills)&&(identical(other.totalOnboardFees, totalOnboardFees) || other.totalOnboardFees == totalOnboardFees)&&(identical(other.maxRefundableAmount, maxRefundableAmount) || other.maxRefundableAmount == maxRefundableAmount)&&const DeepCollectionEquality().equals(other._houseFeatures, _houseFeatures)&&const DeepCollectionEquality().equals(other._categoryImages, _categoryImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseName,houseNumber,houseCode,floor,description,category,houseType,location,latitude,longitude,property,estate,rent,squareFt,featureCount,lastOccupied,imageUrl,const DeepCollectionEquality().hash(_utilityBills),const DeepCollectionEquality().hash(_onboardFees),totalMonthlyBills,totalOnboardFees,maxRefundableAmount,const DeepCollectionEquality().hash(_houseFeatures),const DeepCollectionEquality().hash(_categoryImages)]);

@override
String toString() {
  return 'VacantHouseDetailModel(id: $id, houseName: $houseName, houseNumber: $houseNumber, houseCode: $houseCode, floor: $floor, description: $description, category: $category, houseType: $houseType, location: $location, latitude: $latitude, longitude: $longitude, property: $property, estate: $estate, rent: $rent, squareFt: $squareFt, featureCount: $featureCount, lastOccupied: $lastOccupied, imageUrl: $imageUrl, utilityBills: $utilityBills, onboardFees: $onboardFees, totalMonthlyBills: $totalMonthlyBills, totalOnboardFees: $totalOnboardFees, maxRefundableAmount: $maxRefundableAmount, houseFeatures: $houseFeatures, categoryImages: $categoryImages)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseDetailModelCopyWith<$Res> implements $VacantHouseDetailModelCopyWith<$Res> {
  factory _$VacantHouseDetailModelCopyWith(_VacantHouseDetailModel value, $Res Function(_VacantHouseDetailModel) _then) = __$VacantHouseDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? houseName, String? houseNumber, String? houseCode,@JsonKey(fromJson: parseIntNullable) int? floor, String? description, String? category, String? houseType, String? location, double? latitude, double? longitude, String? property, String? estate,@JsonKey(fromJson: parseDouble) double rent, double? squareFt,@JsonKey(fromJson: parseIntNullable) int? featureCount, String? lastOccupied, String? imageUrl, List<VacantHouseBill> utilityBills, List<VacantHouseBill> onboardFees,@JsonKey(fromJson: parseDouble) double totalMonthlyBills,@JsonKey(fromJson: parseDouble) double totalOnboardFees,@JsonKey(fromJson: parseDouble) double maxRefundableAmount, List<VacantHouseFeature> houseFeatures, List<VacantHouseImage> categoryImages
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? houseName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? floor = freezed,Object? description = freezed,Object? category = freezed,Object? houseType = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? property = freezed,Object? estate = freezed,Object? rent = null,Object? squareFt = freezed,Object? featureCount = freezed,Object? lastOccupied = freezed,Object? imageUrl = freezed,Object? utilityBills = null,Object? onboardFees = null,Object? totalMonthlyBills = null,Object? totalOnboardFees = null,Object? maxRefundableAmount = null,Object? houseFeatures = null,Object? categoryImages = null,}) {
  return _then(_VacantHouseDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as double,squareFt: freezed == squareFt ? _self.squareFt : squareFt // ignore: cast_nullable_to_non_nullable
as double?,featureCount: freezed == featureCount ? _self.featureCount : featureCount // ignore: cast_nullable_to_non_nullable
as int?,lastOccupied: freezed == lastOccupied ? _self.lastOccupied : lastOccupied // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,utilityBills: null == utilityBills ? _self._utilityBills : utilityBills // ignore: cast_nullable_to_non_nullable
as List<VacantHouseBill>,onboardFees: null == onboardFees ? _self._onboardFees : onboardFees // ignore: cast_nullable_to_non_nullable
as List<VacantHouseBill>,totalMonthlyBills: null == totalMonthlyBills ? _self.totalMonthlyBills : totalMonthlyBills // ignore: cast_nullable_to_non_nullable
as double,totalOnboardFees: null == totalOnboardFees ? _self.totalOnboardFees : totalOnboardFees // ignore: cast_nullable_to_non_nullable
as double,maxRefundableAmount: null == maxRefundableAmount ? _self.maxRefundableAmount : maxRefundableAmount // ignore: cast_nullable_to_non_nullable
as double,houseFeatures: null == houseFeatures ? _self._houseFeatures : houseFeatures // ignore: cast_nullable_to_non_nullable
as List<VacantHouseFeature>,categoryImages: null == categoryImages ? _self._categoryImages : categoryImages // ignore: cast_nullable_to_non_nullable
as List<VacantHouseImage>,
  ));
}


}


/// @nodoc
mixin _$VacantHouseBill {

@JsonKey(fromJson: parseIntNullable) int? get id; String? get name;@JsonKey(fromJson: parseDouble) double get amount; bool get isOnboard;
/// Create a copy of VacantHouseBill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseBillCopyWith<VacantHouseBill> get copyWith => _$VacantHouseBillCopyWithImpl<VacantHouseBill>(this as VacantHouseBill, _$identity);

  /// Serializes this VacantHouseBill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseBill&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isOnboard, isOnboard) || other.isOnboard == isOnboard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,amount,isOnboard);

@override
String toString() {
  return 'VacantHouseBill(id: $id, name: $name, amount: $amount, isOnboard: $isOnboard)';
}


}

/// @nodoc
abstract mixin class $VacantHouseBillCopyWith<$Res>  {
  factory $VacantHouseBillCopyWith(VacantHouseBill value, $Res Function(VacantHouseBill) _then) = _$VacantHouseBillCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? name,@JsonKey(fromJson: parseDouble) double amount, bool isOnboard
});




}
/// @nodoc
class _$VacantHouseBillCopyWithImpl<$Res>
    implements $VacantHouseBillCopyWith<$Res> {
  _$VacantHouseBillCopyWithImpl(this._self, this._then);

  final VacantHouseBill _self;
  final $Res Function(VacantHouseBill) _then;

/// Create a copy of VacantHouseBill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? amount = null,Object? isOnboard = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isOnboard: null == isOnboard ? _self.isOnboard : isOnboard // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VacantHouseBill].
extension VacantHouseBillPatterns on VacantHouseBill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacantHouseBill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacantHouseBill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacantHouseBill value)  $default,){
final _that = this;
switch (_that) {
case _VacantHouseBill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacantHouseBill value)?  $default,){
final _that = this;
switch (_that) {
case _VacantHouseBill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name, @JsonKey(fromJson: parseDouble)  double amount,  bool isOnboard)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseBill() when $default != null:
return $default(_that.id,_that.name,_that.amount,_that.isOnboard);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name, @JsonKey(fromJson: parseDouble)  double amount,  bool isOnboard)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseBill():
return $default(_that.id,_that.name,_that.amount,_that.isOnboard);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name, @JsonKey(fromJson: parseDouble)  double amount,  bool isOnboard)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseBill() when $default != null:
return $default(_that.id,_that.name,_that.amount,_that.isOnboard);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseBill implements VacantHouseBill {
  const _VacantHouseBill({@JsonKey(fromJson: parseIntNullable) this.id, this.name, @JsonKey(fromJson: parseDouble) this.amount = 0, this.isOnboard = false});
  factory _VacantHouseBill.fromJson(Map<String, dynamic> json) => _$VacantHouseBillFromJson(json);

@override@JsonKey(fromJson: parseIntNullable) final  int? id;
@override final  String? name;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override@JsonKey() final  bool isOnboard;

/// Create a copy of VacantHouseBill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacantHouseBillCopyWith<_VacantHouseBill> get copyWith => __$VacantHouseBillCopyWithImpl<_VacantHouseBill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacantHouseBillToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseBill&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isOnboard, isOnboard) || other.isOnboard == isOnboard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,amount,isOnboard);

@override
String toString() {
  return 'VacantHouseBill(id: $id, name: $name, amount: $amount, isOnboard: $isOnboard)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseBillCopyWith<$Res> implements $VacantHouseBillCopyWith<$Res> {
  factory _$VacantHouseBillCopyWith(_VacantHouseBill value, $Res Function(_VacantHouseBill) _then) = __$VacantHouseBillCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? name,@JsonKey(fromJson: parseDouble) double amount, bool isOnboard
});




}
/// @nodoc
class __$VacantHouseBillCopyWithImpl<$Res>
    implements _$VacantHouseBillCopyWith<$Res> {
  __$VacantHouseBillCopyWithImpl(this._self, this._then);

  final _VacantHouseBill _self;
  final $Res Function(_VacantHouseBill) _then;

/// Create a copy of VacantHouseBill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? amount = null,Object? isOnboard = null,}) {
  return _then(_VacantHouseBill(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isOnboard: null == isOnboard ? _self.isOnboard : isOnboard // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$VacantHouseFeature {

@JsonKey(fromJson: parseIntNullable) int? get id; String? get name;
/// Create a copy of VacantHouseFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseFeatureCopyWith<VacantHouseFeature> get copyWith => _$VacantHouseFeatureCopyWithImpl<VacantHouseFeature>(this as VacantHouseFeature, _$identity);

  /// Serializes this VacantHouseFeature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseFeature&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'VacantHouseFeature(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $VacantHouseFeatureCopyWith<$Res>  {
  factory $VacantHouseFeatureCopyWith(VacantHouseFeature value, $Res Function(VacantHouseFeature) _then) = _$VacantHouseFeatureCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? name
});




}
/// @nodoc
class _$VacantHouseFeatureCopyWithImpl<$Res>
    implements $VacantHouseFeatureCopyWith<$Res> {
  _$VacantHouseFeatureCopyWithImpl(this._self, this._then);

  final VacantHouseFeature _self;
  final $Res Function(VacantHouseFeature) _then;

/// Create a copy of VacantHouseFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacantHouseFeature].
extension VacantHouseFeaturePatterns on VacantHouseFeature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacantHouseFeature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacantHouseFeature() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacantHouseFeature value)  $default,){
final _that = this;
switch (_that) {
case _VacantHouseFeature():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacantHouseFeature value)?  $default,){
final _that = this;
switch (_that) {
case _VacantHouseFeature() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseFeature() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseFeature():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseFeature() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseFeature implements VacantHouseFeature {
  const _VacantHouseFeature({@JsonKey(fromJson: parseIntNullable) this.id, this.name});
  factory _VacantHouseFeature.fromJson(Map<String, dynamic> json) => _$VacantHouseFeatureFromJson(json);

@override@JsonKey(fromJson: parseIntNullable) final  int? id;
@override final  String? name;

/// Create a copy of VacantHouseFeature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacantHouseFeatureCopyWith<_VacantHouseFeature> get copyWith => __$VacantHouseFeatureCopyWithImpl<_VacantHouseFeature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacantHouseFeatureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseFeature&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'VacantHouseFeature(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseFeatureCopyWith<$Res> implements $VacantHouseFeatureCopyWith<$Res> {
  factory _$VacantHouseFeatureCopyWith(_VacantHouseFeature value, $Res Function(_VacantHouseFeature) _then) = __$VacantHouseFeatureCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? name
});




}
/// @nodoc
class __$VacantHouseFeatureCopyWithImpl<$Res>
    implements _$VacantHouseFeatureCopyWith<$Res> {
  __$VacantHouseFeatureCopyWithImpl(this._self, this._then);

  final _VacantHouseFeature _self;
  final $Res Function(_VacantHouseFeature) _then;

/// Create a copy of VacantHouseFeature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_VacantHouseFeature(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VacantHouseImage {

@JsonKey(fromJson: parseIntNullable) int? get id; String? get filename; String? get originalName; String? get imageUrl;
/// Create a copy of VacantHouseImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacantHouseImageCopyWith<VacantHouseImage> get copyWith => _$VacantHouseImageCopyWithImpl<VacantHouseImage>(this as VacantHouseImage, _$identity);

  /// Serializes this VacantHouseImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacantHouseImage&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,originalName,imageUrl);

@override
String toString() {
  return 'VacantHouseImage(id: $id, filename: $filename, originalName: $originalName, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $VacantHouseImageCopyWith<$Res>  {
  factory $VacantHouseImageCopyWith(VacantHouseImage value, $Res Function(VacantHouseImage) _then) = _$VacantHouseImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? filename, String? originalName, String? imageUrl
});




}
/// @nodoc
class _$VacantHouseImageCopyWithImpl<$Res>
    implements $VacantHouseImageCopyWith<$Res> {
  _$VacantHouseImageCopyWithImpl(this._self, this._then);

  final VacantHouseImage _self;
  final $Res Function(VacantHouseImage) _then;

/// Create a copy of VacantHouseImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? filename = freezed,Object? originalName = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacantHouseImage].
extension VacantHouseImagePatterns on VacantHouseImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacantHouseImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacantHouseImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacantHouseImage value)  $default,){
final _that = this;
switch (_that) {
case _VacantHouseImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacantHouseImage value)?  $default,){
final _that = this;
switch (_that) {
case _VacantHouseImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? filename,  String? originalName,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacantHouseImage() when $default != null:
return $default(_that.id,_that.filename,_that.originalName,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? filename,  String? originalName,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _VacantHouseImage():
return $default(_that.id,_that.filename,_that.originalName,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseIntNullable)  int? id,  String? filename,  String? originalName,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _VacantHouseImage() when $default != null:
return $default(_that.id,_that.filename,_that.originalName,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacantHouseImage implements VacantHouseImage {
  const _VacantHouseImage({@JsonKey(fromJson: parseIntNullable) this.id, this.filename, this.originalName, this.imageUrl});
  factory _VacantHouseImage.fromJson(Map<String, dynamic> json) => _$VacantHouseImageFromJson(json);

@override@JsonKey(fromJson: parseIntNullable) final  int? id;
@override final  String? filename;
@override final  String? originalName;
@override final  String? imageUrl;

/// Create a copy of VacantHouseImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacantHouseImageCopyWith<_VacantHouseImage> get copyWith => __$VacantHouseImageCopyWithImpl<_VacantHouseImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacantHouseImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacantHouseImage&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,originalName,imageUrl);

@override
String toString() {
  return 'VacantHouseImage(id: $id, filename: $filename, originalName: $originalName, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$VacantHouseImageCopyWith<$Res> implements $VacantHouseImageCopyWith<$Res> {
  factory _$VacantHouseImageCopyWith(_VacantHouseImage value, $Res Function(_VacantHouseImage) _then) = __$VacantHouseImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseIntNullable) int? id, String? filename, String? originalName, String? imageUrl
});




}
/// @nodoc
class __$VacantHouseImageCopyWithImpl<$Res>
    implements _$VacantHouseImageCopyWith<$Res> {
  __$VacantHouseImageCopyWithImpl(this._self, this._then);

  final _VacantHouseImage _self;
  final $Res Function(_VacantHouseImage) _then;

/// Create a copy of VacantHouseImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? filename = freezed,Object? originalName = freezed,Object? imageUrl = freezed,}) {
  return _then(_VacantHouseImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
