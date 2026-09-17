import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';

/// A property as it appears in a list row — the server's `PropertySummary`.
///
/// `id`, `estateId` and `bankId` are HashId strings, not integers. This model declared `int id`
/// until the migration, which meant the page did not render a wrong row — it failed to parse.
@freezed
abstract class PropertyModel with _$PropertyModel {
  const PropertyModel._();
  const factory PropertyModel({
    required String id,
    required String name,
    String? estateId,
    String? estateName,
    String? location,
    String? contactName,
    String? phone,
    String? email,
    int? floors,
    @Default(0) int units,
    @Default(0) int occupiedUnits,
    @Default(0) int vacantUnits,
    int? invoiceGenerationDay,

    /// HODI's cut on this property's collections.
    @JsonKey(fromJson: parseDoubleNullable) double? commission,
    String? bankId,
    String? bankName,
    @Default(0) int status,
    String? createdOn,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  /// Sent by the server rather than subtracted here. Kept as a getter only for the case where an
  /// older deployment omits the column.
  int get vacant => vacantUnits;

  double get occupancyRate => units > 0 ? (occupiedUnits / units) * 100 : 0;
}
