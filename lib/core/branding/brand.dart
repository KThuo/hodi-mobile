import 'dart:convert';

import 'package:flutter/material.dart';

/// The colours, name and logo this deployment is configured with.
///
/// ## Why the app asks rather than ships them
///
/// The server resolves branding through ESTATE → BANK → GLOBAL and serves the answer from
/// `/api/v1/branding`. The web reads it before anybody signs in and paints itself accordingly, so an
/// app that shipped its own palette shows different colours from the browser on the same desk — and
/// that reads as a different product rather than as a theme.
///
/// It had already drifted: the app carried `#2190F2`, read off `theme.css`, which states the
/// *fallback* palette. The deployment it was talking to is configured `#1D4ED8`.
///
/// ## And why it is cached
///
/// `/branding/public` needs no session, but it is still a call, and the splash should not wait on the
/// network to paint. Held in secure storage, the second launch is branded on the first frame instead
/// of showing the default and correcting itself a moment later.
@immutable
class Brand {
  const Brand({
    required this.primary,
    required this.accent,
    required this.ink,
    required this.appName,
    this.logoUrl,
  });

  /// What the app paints with until the server answers, and for any value it leaves blank.
  static const Brand fallback = Brand(
    primary: Color(0xFF2190F2),
    accent: Color(0xFFEC278D),
    ink: Color(0xFF0B3358),
    appName: 'HODI',
  );

  final Color primary;
  final Color accent;
  final Color ink;
  final String appName;
  final String? logoUrl;

  /// From `BrandProfileResponse`.
  ///
  /// `colorSecondary` is deliberately not read: the server's secondary is a third brand colour the
  /// app has nowhere to put, and guessing at a role for it would paint something nobody chose.
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      primary: _colour(json['colorPrimary']) ?? fallback.primary,
      accent: _colour(json['colorAccent']) ?? fallback.accent,
      ink: _colour(json['colorInk']) ?? fallback.ink,
      appName: (json['appName'] as String?)?.trim().isNotEmpty == true
          ? (json['appName'] as String).trim()
          : fallback.appName,
      logoUrl: (json['logoUrl'] as String?)?.trim().isNotEmpty == true
          ? (json['logoUrl'] as String).trim()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'colorPrimary': _hex(primary),
        'colorAccent': _hex(accent),
        'colorInk': _hex(ink),
        'appName': appName,
        'logoUrl': logoUrl,
      };

  String encode() => jsonEncode(toJson());

  static Brand? decode(String? raw) {
    if (raw == null) return null;
    try {
      return Brand.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      // A cache written by an older build is not worth a crash on launch.
      return null;
    }
  }

  /// `#1d4ed8`, `1d4ed8`, or with an alpha pair. Anything else is not a colour and falls back rather
  /// than throwing — an estate with a typo in its theme should get the default, not a blank screen.
  static Color? _colour(dynamic value) {
    if (value is! String) return null;
    var hex = value.trim().replaceFirst('#', '');
    if (hex.length == 6) hex = 'ff$hex';
    if (hex.length != 8) return null;
    final n = int.tryParse(hex, radix: 16);
    return n == null ? null : Color(n);
  }

  static String _hex(Color c) {
    int ch(double v) => (v * 255).round();
    return '#${ch(c.r).toRadixString(16).padLeft(2, '0')}'
        '${ch(c.g).toRadixString(16).padLeft(2, '0')}'
        '${ch(c.b).toRadixString(16).padLeft(2, '0')}';
  }
}
