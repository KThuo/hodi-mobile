import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const ProfileModel._();
  const factory ProfileModel({
    int? id,
    String? fullNames,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? userGroup,
    String? usertype,
    String? estate,
    String? passwordExpiry,
    String? photoUrl,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  String get initials {
    if (fullNames == null || fullNames!.isEmpty) return '?';
    final parts = fullNames!.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return parts[0][0].toUpperCase();
  }
}
