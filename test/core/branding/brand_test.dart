import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/core/branding/brand.dart';
import 'package:hodi_mobile/core/theme/hodi_colors.dart';

/// Reading the deployment's own colours.
///
/// The payload below is what `GET /api/v1/branding/public` actually returned from a running
/// instance, trimmed to the fields the app reads — including the value that started this: a
/// configured primary of `#1d4ed8` against an app shipping `#2190f2`.
void main() {
  const served = <String, dynamic>{
    'scope': 'GLOBAL',
    'scopeId': null,
    'name': 'HODI',
    'colorPrimary': '#1d4ed8',
    'colorSecondary': null,
    'colorAccent': '#ec278d',
    'colorOnPrimary': null,
    'colorInk': '#00203d',
    'darkMode': 'AUTO',
    'fontFamily': null,
    'logoUrl': null,
    'appName': 'HODI',
  };

  test('the configured colours are what get read', () {
    final brand = Brand.fromJson(served);

    expect(brand.primary, const Color(0xFF1D4ED8));
    expect(brand.accent, const Color(0xFFEC278D));
    expect(brand.ink, const Color(0xFF00203D));
    expect(brand.appName, 'HODI');
  });

  test('a blank field keeps the shipped value rather than going transparent', () {
    final brand = Brand.fromJson({'colorPrimary': '#1d4ed8'});

    expect(brand.primary, const Color(0xFF1D4ED8));
    expect(brand.accent, Brand.fallback.accent);
    expect(brand.ink, Brand.fallback.ink);
  });

  test('a colour that is not one falls back instead of throwing', () {
    // An estate with a typo in its theme should get the default, not a blank screen.
    for (final bad in ['', 'blue', '#12', '#zzzzzz', 'null']) {
      expect(Brand.fromJson({'colorPrimary': bad}).primary, Brand.fallback.primary,
          reason: '$bad should not have parsed');
    }
  });

  test('it survives a round trip through the cache', () {
    final brand = Brand.fromJson(served);
    final back = Brand.decode(brand.encode());

    expect(back, isNotNull);
    expect(back!.primary, brand.primary);
    expect(back.ink, brand.ink);
  });

  test('a cache written by an older build is ignored, not fatal', () {
    expect(Brand.decode('not json at all'), isNull);
    expect(Brand.decode(null), isNull);
  });

  group('applying it', () {
    tearDown(() {
      // Static palette: leave it as found, or the next test inherits these colours.
      HodiColors.applyBrand(
        brand: Brand.fallback.primary,
        accentColor: Brand.fallback.accent,
        inkColor: Brand.fallback.ink,
      );
    });

    test('the palette follows the server, and derives its own ramp', () {
      final brand = Brand.fromJson(served);
      HodiColors.applyBrand(
        brand: brand.primary,
        accentColor: brand.accent,
        inkColor: brand.ink,
      );

      expect(HodiColors.primaryStart, const Color(0xFF1D4ED8));
      expect(HodiColors.ink, const Color(0xFF00203D));

      // Derived rather than configured: one colour in, a coherent ramp out, so an estate cannot
      // pick a hover that clashes with its own base.
      expect(HodiColors.primaryHover, isNot(HodiColors.primaryStart));
      expect(HodiColors.primaryPressed, isNot(HodiColors.primaryStart));
      expect(HodiColors.primaryHover.computeLuminance(),
          greaterThan(HodiColors.primaryStart.computeLuminance()));
      expect(HodiColors.primaryPressed.computeLuminance(),
          lessThan(HodiColors.primaryStart.computeLuminance()));
    });
  });
}
