import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

/// The session, as the server hands it over.
///
/// ## What changed from legacy
///
/// Legacy returned an access token and an absolute `expiry` in epoch milliseconds, and refreshing
/// meant posting the *access* token back to `/api/refresh-token`. The new backend issues a proper
/// pair: a short-lived access token and a separate refresh token, and refreshing posts the refresh
/// token to a public endpoint. That difference is the whole reason this model changed rather than
/// being repointed.
///
/// It also matters for what biometric unlock guards — see [refreshToken].
@freezed
abstract class TokenModel with _$TokenModel {
  const TokenModel._();

  const factory TokenModel({
    required String accessToken,

    /// The credential that outlives the access token, and the only one worth protecting.
    ///
    /// The app used to keep the person's **password** in secure storage so biometric unlock could
    /// sign in again with it. This replaces that: a refresh token is revocable server-side, scoped
    /// to one session family, and useless once the session ends — none of which is true of a
    /// password, which also unlocks the web console and anything else it was reused on.
    required String refreshToken,

    /// When the access token dies, as epoch milliseconds.
    ///
    /// Stored absolute although the wire sends `expiresIn` seconds: a duration is only meaningful
    /// beside the moment it was received, and that moment is gone by the time anything reads this.
    required int expiresAt,

    /// How long the session may sit idle before the client ends it, in seconds.
    ///
    /// Not the same question as [expiresAt] and deliberately separate on the wire. The token's life
    /// is how often the client must rotate; this is how long somebody may walk away. The watchdog
    /// used to read the token lifetime for want of anything else, which tied being signed out for
    /// inactivity to a number chosen for unrelated reasons.
    @Default(0) int sessionTimeoutSeconds,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  /// From the login or refresh response, which states a lifetime rather than a moment.
  factory TokenModel.fromAuthResponse(Map<String, dynamic> json) {
    final seconds = (json['expiresIn'] as num?)?.toInt() ?? 0;
    return TokenModel(
      accessToken: json['accessToken']?.toString() ?? '',
      refreshToken: json['refreshToken']?.toString() ?? '',
      expiresAt: DateTime.now().millisecondsSinceEpoch + seconds * 1000,
      sessionTimeoutSeconds: (json['sessionTimeoutSeconds'] as num?)?.toInt() ?? 0,
    );
  }

  DateTime get expiresOn => DateTime.fromMillisecondsSinceEpoch(expiresAt);

  bool get isExpired => expiresOn.isBefore(DateTime.now());

  Duration get timeUntilExpiry => expiresOn.difference(DateTime.now());
}
