import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

/// The signed-in person, as `GET /auth/me` describes them — the server's `MeResponse`.
///
/// This model was still the legacy one, and every field but three had the wrong name. The one
/// that mattered was `id`: declared `int?` against a `@HashId Long`, which serialises as a
/// string, so `fromJson` threw `type 'String' is not a subtype of type 'num?'` on every load and
/// the page could never render.
///
/// The renames, for anybody comparing against an older build:
///
/// | Was | Is |
/// |---|---|
/// | `fullNames` | `fullName` |
/// | `usertype` | `userType` — the code, with `userTypeName` beside it for people to read |
/// | `estate` | `estateName` |
/// | `userGroup` | `userGroupName` |
/// | `lastName`, `passwordExpiry`, `photoUrl` | not sent at all |
///
/// `passwordExpiry` is the one worth a sentence: the server does not send a date, because expiry
/// is folded into [mustChangePassword] at sign-in — a password past its maximum age and a
/// temporary credential are the same situation from here, and a date on the profile would be a
/// second answer to a question already answered.
@freezed
abstract class ProfileModel with _$ProfileModel {
  const ProfileModel._();
  const factory ProfileModel({
    String? id,
    String? username,
    String? fullName,
    String? firstName,
    String? email,
    String? phone,

    /// The code authority checks are written against — ADMIN, CARETAKER, TENANT.
    String? userType,

    /// The same thing in words — "Estate Admin", not "ADMIN". The header showed the code until
    /// the rebuild, which labelled everybody in shouting capitals with a string meant for a
    /// switch statement.
    String? userTypeName,
    String? estateName,
    String? bankName,
    String? bankLogoUrl,

    /// The group, which is what actually decides what somebody can do. Shown beside the role
    /// because the role alone answers the wrong question: two estate admins in different groups
    /// hold different permissions.
    String? userGroupName,
    String? estateId,
    String? bankId,
    @Default(<String>[]) List<String> authorities,
    @Default(false) bool superadmin,
    @Default(false) bool bankadmin,
    @Default(false) bool admin,
    @Default(false) bool caretaker,
    @Default(false) bool tenant,
    @Default(false) bool mustChangePassword,
    @Default(false) bool pinSet,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// What a person is called, for the row and the header.
  String get displayName =>
      (fullName?.isNotEmpty ?? false) ? fullName! : (username ?? 'User');

  /// The role in words where the server gave them, the code otherwise.
  String get roleLabel =>
      (userTypeName?.isNotEmpty ?? false) ? userTypeName! : (userType ?? 'N/A');

  String get initials {
    final name = fullName;
    if (name == null || name.trim().isEmpty) return '?';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2 && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}
