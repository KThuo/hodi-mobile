import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/named_ref.dart';

part 'house_detail_model.freezed.dart';
part 'house_detail_model.g.dart';

/// One unit, everything a person needs on its own page — the server's `UnitDetail`.
///
/// The tenancy is **not** in here, and that is deliberate on the server's side: who occupies a
/// unit is a separate read against `GET /occupations/house/{houseId}`. The legacy shape nested a
/// `tenant` object with arrears and a refundable deposit inside the unit; the rebuilt backend
/// sends neither, so the detail screen composes the two reads instead of expecting one.
@freezed
abstract class HouseDetailModel with _$HouseDetailModel {
  const HouseDetailModel._();
  const factory HouseDetailModel({
    required String id,
    required String houseCode,
    String? houseNumber,
    int? floor,
    @Default(false) bool mezzanine,
    String? floorLabel,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    String? location,
    String? categoryName,
    String? usageClassName,
    String? tenure,
    int? beds,
    int? baths,
    int? ensuite,
    @Default(false) bool dsq,
    int? parking,
    double? squareFt,
    double? rent,
    @Default(false) bool occupied,

    /// The date it was last let, for a vacant unit. Null means never occupied, which is a
    /// different fact from "vacant since" and reads differently.
    String? lastOccupied,
    @Default(0) int status,
    String? createdOn,

    /// The unit's own features, not the property's. Arrives with the detail, so there is no
    /// second request — the old `catalogue/features/{houseId}` call asked the feature catalogue
    /// for a unit it knows nothing about.
    @Default(<NamedRef>[]) List<NamedRef> features,

    /// Sections whose data belongs to a module that does not exist yet. The server names them
    /// rather than sending zeroes, because a zero in a money field reads as "nothing owed" when
    /// the truth is "not yet computed".
    @Default(<String>[]) List<String> pending,
  }) = _HouseDetailModel;

  factory HouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailModelFromJson(json);

  String get displayName =>
      (houseNumber?.isNotEmpty ?? false) ? houseNumber! : houseCode;
}
