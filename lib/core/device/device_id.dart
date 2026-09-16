import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// What this handset calls itself: 16 characters, `[A-Z0-9]`, for the life of the device.
///
/// ## Why the server wants one
///
/// A PIN lives in a row naming a device, and only the account password can create such a row. That
/// row is what makes four digits defensible — PIN login reaches no hash to compare against unless
/// this handset has one — so the app has to be able to say, consistently, which handset it is.
///
/// ## It has to outlive the app
///
/// An id that changed on reinstall would mean the PIN silently stopped working after every update
/// done the hard way, and would leave rows on the account matching no phone anybody holds.
///
/// | Platform | Where it comes from | Survives uninstall |
/// |---|---|---|
/// | Android | `ANDROID_ID`, hashed | **Yes** — stable per signing key and device, resets on factory reset |
/// | iOS | random, kept in the Keychain | **Usually** — the Keychain outlives the bundle, but Apple does not promise it |
///
/// `identifierForVendor` is deliberately not used: it resets when the last app from the same vendor
/// is removed, which is exactly the case this exists to survive.
///
/// ## It is a name, not a password
///
/// Anything can claim any id — it travels in a header and nothing signs it, and the server says so
/// too. What makes the row trustworthy is that the account password created it. Losing the id
/// therefore costs one re-entry of the password to set the PIN again, which is why "usually" is
/// good enough on iOS.
class DeviceId {
  DeviceId(this._storage);

  static const _key = 'hodi.device.id';

  /// Not `WhenUnlocked`: a session restore can run before the first unlock after a reboot, and an id
  /// the app cannot read is a handset that appears to have no PIN. Not synchronizable either — an
  /// iCloud-restored id would clone one handset's identity onto another, and with it the right to
  /// offer that handset's PIN.
  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
    synchronizable: false,
  );

  static const _androidOptions = AndroidOptions.defaultOptions;

  final FlutterSecureStorage _storage;
  String? _cached;

  Future<String> get() async {
    if (_cached != null) return _cached!;

    final stored = await _storage.read(
      key: _key,
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
    if (stored != null && _looksRight(stored)) {
      _cached = stored;
      return stored;
    }

    final minted = await _mint();
    await _storage.write(
      key: _key,
      value: minted,
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
    _cached = minted;
    return minted;
  }

  /// Android derives, iOS invents.
  ///
  /// Deriving on Android means a reinstall recomputes the same id even when secure storage went with
  /// the app data — the strongest guarantee available without asking for a permission. iOS has no
  /// equivalent stable value that is not either resettable or off limits, so it gets randomness and
  /// the Keychain.
  Future<String> _mint() async {
    if (Platform.isAndroid) {
      try {
        final info = await DeviceInfoPlugin().androidInfo;
        if (info.id.isNotEmpty) return _fromSeed(info.id);
      } catch (_) {
        // A plugin that cannot answer is not a reason to have no id at all.
      }
    }
    return _random();
  }

  /// SHA-256 of the seed, rendered in a readable alphabet.
  ///
  /// Hashed rather than sent raw so that the id cannot be read back as the device identifier the
  /// platform handed us, and so its shape does not depend on what that happened to be.
  static String _fromSeed(String seed) =>
      _encode(sha256.convert(utf8.encode('hodi-device-v1:$seed')).bytes);

  static String _random() {
    final random = Random.secure();
    return _encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  /// Crockford-style: no I, L, O or U, so nothing read down a phone line is mistaken for something
  /// else.
  static const _alphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';

  static String _encode(List<int> bytes) {
    final buffer = StringBuffer();
    for (var i = 0; i < 16; i++) {
      buffer.write(_alphabet[bytes[i % bytes.length] % _alphabet.length]);
    }
    return buffer.toString();
  }

  static bool _looksRight(String value) => RegExp(r'^[A-Z0-9]{16}$').hasMatch(value);
}

final deviceIdProvider = Provider<DeviceId>((ref) {
  return DeviceId(const FlutterSecureStorage());
});
