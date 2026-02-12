import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String name,
    required String username,
    required String usertype,
    String? estate,
    String? estateId,
    String? email,
    String? firstName,
    String? userGroup,
    String? groupId,
    @Default([]) List<String> propertyIds,
    @Default([]) List<String> authorities,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromLoginResponse(Map<String, dynamic> json) {
    final userDetails = json['userDetails'] as Map<String, dynamic>;

    // Parse authorities from Spring Security format
    final authoritiesList = <String>[];
    if (userDetails['authorities'] is List) {
      for (final auth in userDetails['authorities'] as List) {
        if (auth is Map<String, dynamic>) {
          final authority = auth['authority']?.toString();
          if (authority != null) {
            authoritiesList.add(authority);
          }
        } else if (auth is String) {
          authoritiesList.add(auth);
        }
      }
    }

    // Parse propertyIds
    final propertyIds = <String>[];
    if (userDetails['propertyIds'] is List) {
      for (final id in userDetails['propertyIds'] as List) {
        propertyIds.add(id.toString());
      }
    }

    return UserModel(
      id: userDetails['id']?.toString() ?? '',
      name: userDetails['fullnames']?.toString() ?? userDetails['name']?.toString() ?? '',
      username: userDetails['username']?.toString() ?? '',
      usertype: userDetails['userType']?.toString() ?? userDetails['usertype']?.toString() ?? '',
      estate: userDetails['estate']?.toString(),
      estateId: userDetails['estateId']?.toString(),
      email: userDetails['email']?.toString(),
      firstName: userDetails['firstName']?.toString(),
      userGroup: userDetails['userGroup']?.toString(),
      groupId: userDetails['groupId']?.toString(),
      propertyIds: propertyIds,
      authorities: authoritiesList,
    );
  }

  bool hasPermission(String permission) => authorities.contains(permission);

  bool hasAnyPermission(List<String> permissions) =>
      permissions.any((p) => authorities.contains(p));
}
