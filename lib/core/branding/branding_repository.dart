import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import '../api/api_constants.dart';
import '../theme/hodi_colors.dart';
import 'brand.dart';

/// Fetches the deployment's branding, caches it, and paints with it.
class BrandingRepository {
  BrandingRepository({required ApiClient apiClient, FlutterSecureStorage? storage})
      : _apiClient = apiClient,
        _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'brand_profile';

  final ApiClient _apiClient;
  final FlutterSecureStorage _storage;

  /// The cached brand, applied immediately so the first frame is already right.
  Future<Brand> cached() async {
    try {
      final brand = Brand.decode(await _storage.read(key: _key)) ?? Brand.fallback;
      _paint(brand);
      return brand;
    } catch (_) {
      // A private profile, or storage that refuses to answer. The shipped palette is a working app.
      _paint(Brand.fallback);
      return Brand.fallback;
    }
  }

  /// Asks the server, paints, and remembers for next launch.
  ///
  /// `/branding/public` needs no session, which is what lets this run on the splash before anybody
  /// has signed in — and the login screen is the first thing that has to be in the right colours.
  ///
  /// Every failure resolves to whatever was already applied. Branding that could not be fetched is a
  /// cosmetic outcome; raising here would turn it into an app that will not start.
  Future<Brand> refresh() async {
    try {
      final response = await _apiClient.get<Brand>(
        ApiConstants.brandingPublic,
        fromJsonT: (data) => Brand.fromJson(data as Map<String, dynamic>),
      );
      if (response.isSuccess && response.data != null) {
        final brand = response.data!;
        _paint(brand);
        await _storage.write(key: _key, value: brand.encode());
        return brand;
      }
    } catch (e) {
      developer.log('Branding could not be read: $e', name: 'Branding');
    }
    return Brand.fallback;
  }

  void _paint(Brand brand) {
    HodiColors.applyBrand(
      brand: brand.primary,
      accentColor: brand.accent,
      inkColor: brand.ink,
    );
  }
}

final brandingRepositoryProvider = Provider<BrandingRepository>((ref) {
  return BrandingRepository(apiClient: ref.watch(apiClientProvider));
});
