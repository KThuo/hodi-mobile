import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Who is signed in, from `GET /api/v1/auth/me` and from the login response that embeds it.
///
/// ## Roles come from the server now, not from guesswork
///
/// The app used to work out what somebody was by inspecting their permissions —
/// `tenantAccessView && !paymentsView` meant "tenant". That was fragile against legacy and is
/// **wrong** against the new backend, twice over: `ROLE_TENANT_ACCESS` is the *staff* authority for
/// granting a tenant their sign-in, which a tenant does not hold, and the seeded tenant group does
/// hold `ROLE_PAYMENT_VIEW`. Both halves of the test invert, so every tenant would have been read as
/// staff.
///
/// The server answers it directly — [isTenant] and the flags beside it come from the user's type,
/// which is what decides it. Permissions decide what somebody may *do*; they were never meant to
/// say what somebody *is*.
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    /// Hashed, and salted per user. It is an opaque string: never parse it, never sort by it, and
    /// never cache anything under it across sign-ins.
    required String id,
    required String username,
    required String fullName,
    String? firstName,
    String? email,
    String? phone,

    /// The code — `ADMIN`, `TENANT`. What behaviour keys off, where a flag below is not enough.
    required String userType,

    /// The type in words — "Estate Admin", not "ADMIN". What a person reads.
    String? userTypeName,
    String? estateName,
    String? estateId,
    String? bankName,
    String? bankId,
    String? bankLogoUrl,
    String? userGroupName,
    @Default([]) List<String> authorities,
    @Default(false) bool superadmin,
    @Default(false) bool bankadmin,
    @Default(false) bool admin,
    @Default(false) bool caretaker,
    @Default(false) bool tenant,

    /// A new password is required before this account may do anything else.
    @Default(false) bool mustChangePassword,

    /// Whether the handset that made this request can sign in with a PIN.
    ///
    /// Answered per device by the server, not remembered by the app: a PIN can be removed from
    /// another phone or spend its five tries, and an app trusting its own memory would keep drawing
    /// a keypad that cannot work.
    @Default(false) bool pinSet,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// From `MeResponse`, whether it arrived on its own or inside a login response.
  ///
  /// Authorities are plain strings now. Legacy sent Spring Security's `[{authority: "ROLE_X"}]`
  /// shape and this had to unwrap it; the tolerance is kept because it costs one branch and a
  /// half-migrated deployment answering the old shape would otherwise strip every permission and
  /// leave somebody staring at an app with no features.
  factory UserModel.fromMe(Map<String, dynamic> json) {
    final authorities = <String>[];
    if (json['authorities'] is List) {
      for (final a in json['authorities'] as List) {
        if (a is String) {
          authorities.add(a);
        } else if (a is Map && a['authority'] != null) {
          authorities.add(a['authority'].toString());
        }
      }
    }

    return UserModel(
      id: json['id']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? '',
      firstName: json['firstName']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      userType: json['userType']?.toString() ?? '',
      userTypeName: json['userTypeName']?.toString(),
      estateName: json['estateName']?.toString(),
      estateId: json['estateId']?.toString(),
      bankName: json['bankName']?.toString(),
      bankId: json['bankId']?.toString(),
      bankLogoUrl: json['bankLogoUrl']?.toString(),
      userGroupName: json['userGroupName']?.toString(),
      authorities: authorities,
      superadmin: json['superadmin'] == true,
      bankadmin: json['bankadmin'] == true,
      admin: json['admin'] == true,
      caretaker: json['caretaker'] == true,
      tenant: json['tenant'] == true,
      mustChangePassword: json['mustChangePassword'] == true,
      pinSet: json['pinSet'] == true,
    );
  }

  /// What this person is. Asked of the server, not inferred from what they may do.
  bool get isTenant => tenant;

  bool get isSuperadmin => superadmin;

  /// What this person may do.
  bool hasPermission(String permission) => authorities.contains(permission);

  bool hasAnyPermission(List<String> permissions) =>
      permissions.any((p) => authorities.contains(p));
}
