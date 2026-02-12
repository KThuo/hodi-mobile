import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
abstract class TokenModel with _$TokenModel {
  const TokenModel._();
  const factory TokenModel({
    required String accessToken,
    required int expiry,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  bool get isExpired => DateTime.fromMillisecondsSinceEpoch(expiry).isBefore(DateTime.now());

  Duration get timeUntilExpiry =>
      DateTime.fromMillisecondsSinceEpoch(expiry).difference(DateTime.now());
}
