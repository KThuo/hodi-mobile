import 'package:local_auth/local_auth.dart';
import 'auth_local_storage.dart';

class BiometricService {
  final LocalAuthentication _localAuth;
  final AuthLocalStorage _storage;

  BiometricService({
    LocalAuthentication? localAuth,
    required AuthLocalStorage storage,
  })  : _localAuth = localAuth ?? LocalAuthentication(),
        _storage = storage;

  Future<bool> isDeviceSupported() async {
    final isSupported = await _localAuth.isDeviceSupported();
    if (!isSupported) return false;
    final biometrics = await _localAuth.getAvailableBiometrics();
    return biometrics.isNotEmpty;
  }

  Future<bool> isBiometricLoginEnabled() => _storage.isBiometricEnabled();

  Future<void> enableBiometricLogin(String username, String password) async {
    await _storage.saveBiometricCredentials(username, password);
  }

  Future<void> disableBiometricLogin() async {
    await _storage.clearBiometricData();
  }

  Future<bool> authenticate() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Sign in to HODI',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }

  Future<({String username, String password})?> getStoredCredentials() {
    return _storage.getBiometricCredentials();
  }
}
