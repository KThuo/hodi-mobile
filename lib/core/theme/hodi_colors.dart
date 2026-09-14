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
  // ── Brand ─────────────────────────────────────────────────────────────────
  // --brand and --accent. Together they are --grad-brand, the one primary fill.
  static const Color primaryStart = Color(0xFF2190F2); // --brand
  static const Color primaryEnd = Color(0xFFEC278D);   // --accent
  static const Color primaryHover = Color(0xFF47A4F5); // --brand-hover
  static const Color primaryPressed = Color(0xFF1877CC); // --brand-pressed

  /// The wordmark's magenta, standing alone rather than as a gradient end.
  static const Color secondary = Color(0xFFEC278D); // --accent
  static const Color accent = Color(0xFFEC278D);    // --accent
  static const Color accentLight = Color(0xFFF76FB3); // --accent-light

  /// The navy the sidebar and document headers are built from.
  static const Color ink = Color(0xFF0B3358);     // --ink-800
  static const Color inkDeep = Color(0xFF04182B); // --ink-900
  static const Color onInk = Color(0xFFE9F1F9);   // --on-ink

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
