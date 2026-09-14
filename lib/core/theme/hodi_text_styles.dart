import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hodi_colors.dart';

/// Type, ported from `hodi-f`.
///
/// **Plus Jakarta Sans, not Poppins.** The web console, every document the server renders and the
/// brand itself are set in Plus Jakarta Sans; the app was in Poppins, which is a different voice on
/// the same page. Its numerals also sit better in a column of money — the web asks for tabular
/// figures for exactly that reason.
abstract class HodiTextStyles {
  // Headings
  static TextStyle heading1 = GoogleFonts.plusJakartaSans(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: HodiColors.textDark,
  );

  static TextStyle heading2 = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  static TextStyle heading3 = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  // Body
  static TextStyle bodyLarge = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: HodiColors.textDark,
  );

  static TextStyle bodyMedium = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: HodiColors.textMedium,
  );

  static TextStyle bodySmall = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: HodiColors.textLight,
  );

  // Labels
  static TextStyle label = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: HodiColors.textMedium,
    letterSpacing: 0.5,
  );

  static TextStyle labelBold = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  // Button
  static TextStyle button = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: HodiColors.white,
    letterSpacing: 0.5,
  );

  // Currency (monospace)
  static TextStyle currency = GoogleFonts.robotoMono(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  static TextStyle currencyLarge = GoogleFonts.robotoMono(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: HodiColors.textDark,
  );

  static TextStyle currencySmall = GoogleFonts.robotoMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: HodiColors.textMedium,
  );
}
