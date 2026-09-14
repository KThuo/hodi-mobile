import 'package:flutter/material.dart';

/// HODI's palette, ported from `hodi-f/src/styles/theme.css`.
///
/// ## The brand was wrong, not merely different
///
/// This file used to open with a generic indigo-to-purple gradient — `#667EEA → #764BA2`, the
/// default of a hundred dashboard templates — while HODI's actual brand sat underneath it as
/// "secondary". The real palette comes from the shipped logo: **blue `#2190f2` into magenta
/// `#ec278d`**, and it is what every screenshot, every invoice and the whole web console are built
/// around. An app in different colours from the product is not a styling preference; it reads as a
/// different product.
///
/// ## Names kept, values corrected
///
/// The names here are the ones 622 call sites already use, so correcting the values re-skins every
/// screen without touching them. Where a name and the web's token disagree, the token wins and the
/// mapping is noted — the web file is the source of truth, and this is a port of it.
///
/// The semantic colours needed no change: success, warning and danger were already HODI's.
abstract class HodiColors {
  // ── Brand — resolved at runtime ───────────────────────────────────────────
  //
  // These are **not** const, and that is the whole point. The server resolves branding through
  // ESTATE → BANK → GLOBAL and serves it from /api/v1/branding; the values below are only what the
  // app paints with until it answers. The shipped defaults were read off hodi-f's theme.css, which
  // states the *fallback* palette rather than the configured one — so the app was showing #2190F2
  // against a deployment configured for #1D4ED8, and an app in different colours from the console
  // looks like a different product.
  //
  // Mutable statics rather than a threaded theme because six hundred call sites already name these
  // constants; making them follow the brand is one assignment, and re-plumbing every widget through
  // an InheritedWidget is a large mechanical edit where every touch is a chance to break a screen.
  // See [applyBrand].

  /// `--brand`, the colour buttons, links and active state are painted in.
  static Color primaryStart = _fallbackBrand;
  /// `--accent`, the far stop of the heading gradient.
  static Color primaryEnd = _fallbackAccent;
  static Color primaryHover = const Color(0xFF47A4F5);
  static Color primaryPressed = const Color(0xFF1877CC);

  /// The wordmark's magenta, standing alone rather than as a gradient end.
  static Color secondary = _fallbackAccent;
  static Color accent = _fallbackAccent;
  static Color accentLight = const Color(0xFFF76FB3);

  /// The navy the headers and document furniture are built from — `--ink-800`.
  static Color ink = _fallbackInk;
  static Color inkDeep = const Color(0xFF04182B);
  static const Color onInk = Color(0xFFE9F1F9);

  static const Color _fallbackBrand = Color(0xFF2190F2);
  static const Color _fallbackAccent = Color(0xFFEC278D);
  static const Color _fallbackInk = Color(0xFF0B3358);

  /// Paint with what the server said, keeping the shipped value for anything it left blank.
  ///
  /// The derived shades are computed rather than configured: one colour in, a coherent ramp out, so
  /// an estate choosing its own brand cannot pick a hover that clashes with its own base. `hodi-f`
  /// derives them the same way and from the same percentages.
  static void applyBrand({Color? brand, Color? accentColor, Color? inkColor}) {
    if (brand != null) {
      primaryStart = brand;
      primaryHover = _shade(brand, 0.14);
      primaryPressed = _shade(brand, -0.16);
    }
    if (accentColor != null) {
      primaryEnd = accentColor;
      secondary = accentColor;
      accent = accentColor;
      accentLight = _shade(accentColor, 0.32);
    }
    if (inkColor != null) {
      ink = inkColor;
      inkDeep = _shade(inkColor, -0.5);
    }
  }

  /// Toward white for a positive amount, toward black for a negative one.
  static Color _shade(Color c, double amount) {
    final target = amount < 0 ? 0.0 : 255.0;
    final t = amount.abs();
    double mix(double channel) => (channel * 255 + (target - channel * 255) * t) / 255;
    return Color.from(alpha: c.a, red: mix(c.r), green: mix(c.g), blue: mix(c.b));
  }

  // ── Semantic ──────────────────────────────────────────────────────────────
  // Already correct before this port; the values are HODI's and stay put.
  static const Color successStart = Color(0xFF10B981); // --success
  static const Color successEnd = Color(0xFF059669);
  static const Color warningStart = Color(0xFFF59E0B); // --warning
  static const Color warningEnd = Color(0xFFD97706);
  static const Color errorStart = Color(0xFFEF4444);   // --danger
  static const Color errorEnd = Color(0xFFDC2626);

  /// Money moving in and out. Deliberately not success/danger: a debit is not an error.
  static const Color credit = Color(0xFF10B981); // --credit
  static const Color debit = Color(0xFFF43F5E);  // --debit

  // ── Text ──────────────────────────────────────────────────────────────────
  // The old ramp was Tailwind's cool greys. HODI's is tinted toward the ink, which is what stops
  // body text looking detached from the navy it sits near.
  static const Color textDark = Color(0xFF10233A);   // --text
  static const Color textMedium = Color(0xFF4D6480); // --text-muted
  static const Color textLight = Color(0xFF7A8FA8);  // --text-subtle
  static const Color textFaint = Color(0xFFA6B6C8);  // --text-faint

  // ── Surfaces ──────────────────────────────────────────────────────────────
  static const Color background = Color(0xFFF4F7FB);    // --bg
  static const Color cardBackground = Color(0xFFFFFFFF); // --surface
  static const Color surfaceLight = Color(0xFFF7F9FC);  // --surface-2
  static const Color surfaceInset = Color(0xFFEEF3F9);  // --surface-3

  // ── Lines ─────────────────────────────────────────────────────────────────
  static const Color divider = Color(0xFFE2E9F1);      // --border
  static const Color dividerStrong = Color(0xFFCBD8E6); // --border-strong

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// Soft washes for chips and wells, at the same strengths the web mixes them.
  static Color get brandSoft => primaryStart.withValues(alpha: 0.13);
  static Color get successBg => successStart.withValues(alpha: 0.12);
  static Color get warningBg => warningStart.withValues(alpha: 0.14);
  static Color get dangerBg => errorStart.withValues(alpha: 0.12);
}
