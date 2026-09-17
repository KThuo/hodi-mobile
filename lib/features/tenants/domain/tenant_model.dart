import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_model.freezed.dart';
part 'tenant_model.g.dart';

/// A tenant — the server's `TenantRow`.
///
/// **A tenant is a user, and may be an organisation.** `kind` says which, and `displayName`
/// resolves it: a person's name for a person, the registered name for a company. The legacy model
/// assumed a person with one unit and a rent balance, which is three assumptions the rebuilt
/// endpoint does not make — a tenant can occupy several units, and what they owe belongs to the
/// tenancy rather than to them.
@freezed
abstract class TenantModel with _$TenantModel {
  const TenantModel._();

  const factory TenantModel({
    required String id,

    /// `PERSON` or `ORGANISATION`.
    String? kind,
    @Default(false) bool organisation,
    required String displayName,
    String? firstName,
    String? lastName,
    String? idNumber,
    String? registeredName,
    String? kraPin,

    /// Who to speak to at a company. Null for a person, where the tenant is the contact.
    String? contactName,
    String? phone,
    String? email,
    String? username,

    /// Whether they have been asked to set up a sign-in. Worth showing: a tenant with no account
    /// cannot see their own invoices, and that is a thing somebody can act on.
    @Default(false) bool invited,
    String? estateId,

    /// Every unit they occupy — a tenant is not limited to one.
    @Default(<OccupiedUnitModel>[]) List<OccupiedUnitModel> occupying,
    @Default(0) int status,
    String? createdOn,
  }) = _TenantModel;

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);

  /// How to reach them, in one line.
  String get contactLine => [
        if (phone != null && phone!.isNotEmpty) phone!,
        if (email != null && email!.isNotEmpty) email!,
      ].join(' · ');

  /// The units they occupy, as somebody would read them out. Empty for a tenant between
  /// tenancies, which is a real state rather than a missing value.
  String get unitsLine => occupying.map((u) => u.label).join(', ');

  bool get housed => occupying.isNotEmpty;

  String get initials {
    final name = displayName.trim();
    if (name.isEmpty) return '?';
    final parts = name.split(RegExp(r'\s+'));
    if (parts.length >= 2 && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}

/// One unit a tenant occupies.
@freezed
abstract class OccupiedUnitModel with _$OccupiedUnitModel {
  const OccupiedUnitModel._();

  const factory OccupiedUnitModel({
    required String houseId,
    required String houseCode,

    /// The unit as somebody reads it out — "K04 (Ground Floor)". Composed by the server.
    required String label,
  }) = _OccupiedUnitModel;

  factory OccupiedUnitModel.fromJson(Map<String, dynamic> json) =>
      _$OccupiedUnitModelFromJson(json);
}
