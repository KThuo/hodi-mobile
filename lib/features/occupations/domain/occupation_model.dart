import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'occupation_model.freezed.dart';
part 'occupation_model.g.dart';

/// A tenancy — the server's `OccupationRow`.
///
/// One shape for two audiences. Staff read a list of an estate's tenancies; a tenant reads "My
/// houses", which is the same endpoint answering with their own rows. The tenancy scope decides
/// which, from the session, and a tenant cannot widen it by asking differently.
@freezed
abstract class OccupationModel with _$OccupationModel {
  const OccupationModel._();
  const factory OccupationModel({
    required String id,

    /// The tenant's user id — a tenant is a user.
    String? tenantUserId,
    String? tenantName,
    String? tenantPhone,
    @Default(false) bool tenantIsOrganisation,
    required String houseId,
    required String houseCode,
    String? houseNumber,

    /// The unit as a person reads it: "G06 (Ground Floor)". Beside the code rather than instead
    /// of it — the code is what goes on a payment reference, the label is the door knocked on.
    String? houseLabel,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    String? categoryId,
    String? categoryName,
    String? usageClassName,
    String? tenure,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    @JsonKey(fromJson: parseDouble) @Default(0) double deposit,
    @JsonKey(fromJson: parseDouble) @Default(0) double refundableDeposit,

    /// Positive is arrears, negative is credit. The legacy portal's convention, kept.
    @JsonKey(fromJson: parseDouble) @Default(0) double rentOwed,
    int? dueDay,

    /// The next date rent falls due. Derived by the server rather than stored, so a missed
    /// invoice run cannot leave two clients showing two different wrong answers.
    String? nextDueOn,
    String? occupiedOn,

    /// Null where there is no agreed end.
    String? expiresOn,

    /// Negative means the term has already passed, which is a normal state for a periodic
    /// tenancy that ran past its first term.
    int? daysToExpiry,
    int? noticeDays,
    @Default(0) int status,
    String? createdOn,
  }) = _OccupationModel;

  factory OccupationModel.fromJson(Map<String, dynamic> json) =>
      _$OccupationModelFromJson(json);

  /// What to put on the row: the composed label where there is one, the code otherwise.
  String get displayName =>
      (houseLabel?.isNotEmpty ?? false) ? houseLabel! : houseCode;

  /// Arrears and credit are the same column with a sign, and they read as opposites.
  bool get inArrears => rentOwed > 0;
  bool get inCredit => rentOwed < 0;
}
