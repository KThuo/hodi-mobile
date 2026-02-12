import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hodi_colors.dart';

abstract class HodiTextStyles {
  // Headings
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: HodiColors.textDark,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  // Body
  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: HodiColors.textDark,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: HodiColors.textMedium,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: HodiColors.textLight,
  );

  // Labels
  static TextStyle label = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: HodiColors.textMedium,
    letterSpacing: 0.5,
  );

  static TextStyle labelBold = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: HodiColors.textDark,
  );

  // Button
  static TextStyle button = GoogleFonts.poppins(
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
