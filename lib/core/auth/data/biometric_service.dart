import 'package:local_auth/local_auth.dart';
import 'auth_local_storage.dart';

/// The fingerprint or face this phone already trusts.
///
/// ## What it is for, precisely
///
/// Not "signing in with biometrics" — a fingerprint produces no credential and the server has never
/// heard of it. What it proves is that the person holding the phone is the person the phone belongs
/// to.
///
/// So it guards the session that is already here. The refresh token sits in the keystore either
/// way; with this on, resuming it costs a fingerprint. That is what every app calling this
/// "biometric login" actually does, and it is worth having — the token is what somebody who picks
/// up an unlocked handset would otherwise walk straight in with.
///
/// It used to mean something else here: the username and the **password in plain text**, stored and
/// replayed after a prompt. That is gone. The PIN is the credential now, it lives on the server as
/// a hash, and this is a preference about one handset.
///
/// Every failure — no hardware, nothing enrolled, a cancelled prompt, a plugin that throws — answers
/// false, and the caller falls back to the PIN or the password. A phone that cannot do this must
/// still be a phone somebody can sign in on.
class BiometricService {
  final LocalAuthentication _localAuth;
  final AuthLocalStorage _storage;

  BiometricService({
    LocalAuthentication? localAuth,
    required AuthLocalStorage storage,
  })  : _localAuth = localAuth ?? LocalAuthentication(),
        _storage = storage;

  /// Whether this phone can do it at all: hardware present, and something enrolled on it.
  Future<bool> isDeviceSupported() async {
    try {
      if (!await _localAuth.isDeviceSupported()) return false;
      if (!await _localAuth.canCheckBiometrics) return false;
      return (await _localAuth.getAvailableBiometrics()).isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<bool> isEnabled() => _storage.isBiometricEnabled();

  /// Turning it on costs a successful prompt.
  ///
  /// Otherwise somebody enables it, the reader turns out not to work, and the setting claims a
  /// protection the phone cannot provide — which is worse than not offering it.
  Future<BiometricResult> enable() async {
    final result = await prove('Confirm it is you, to turn this on');
    if (result.proved) await _storage.setBiometricEnabled(true);
    return result;
  }

  Future<void> disable() async {
    await _storage.setBiometricEnabled(false);
  }

  /// Prompts, and says what happened.
  ///
  /// A bare false for everything is what makes a broken setup undiagnosable: a phone whose
  /// MainActivity is not a FragmentActivity cannot show the prompt at all, and reporting that as
  /// "no biometrics" gives somebody nothing to act on.
  Future<BiometricResult> prove(String reason) async {
    try {
      final ok = await _localAuth.authenticate(
        localizedReason: reason,
        // Biometric only. Falling back to the phone's own PIN would mean the screen lock stands in
        // for this account's, and those are different questions with different answers.
        biometricOnly: true,
        // The prompt survives the app being backgrounded, which on Android it routinely is while
        // the sensor is read. Without it a fingerprint taken half a second late fails silently.
        persistAcrossBackgrounding: true,
      );
      return ok ? const BiometricResult.ok() : const BiometricResult.failed('That was not recognised.');
    } catch (e) {
      return const BiometricResult.failed('This phone could not ask for a fingerprint.');
    }
  }

  /// Kept for the old call shape while the sign-in screen is the only caller.
  Future<bool> authenticate() async => (await prove('Sign in to HODI')).proved;
}

/// What came of a prompt: it worked, or it did not and here is what to say.
class BiometricResult {
  const BiometricResult.ok()
      : proved = true,
        message = null;
  const BiometricResult.failed(this.message) : proved = false;

  final bool proved;

  /// Null where there is nothing worth saying — a prompt somebody dismissed on purpose.
  final String? message;
}
