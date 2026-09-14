import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hodi_colors.dart';
import 'hodi_border_radius.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: HodiColors.background,
      colorScheme: ColorScheme.light(
        primary: HodiColors.primaryStart,
        secondary: HodiColors.secondary,
        error: HodiColors.errorStart,
        surface: HodiColors.cardBackground,
        onPrimary: HodiColors.white,
        onSecondary: HodiColors.white,
        onSurface: HodiColors.textDark,
        onError: HodiColors.white,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: HodiColors.textDark,
        ),
        iconTheme: const IconThemeData(color: HodiColors.textDark),
      ),
      /*
       * Inputs, as the web draws them.
       *
       * They were a grey fill with `BorderSide.none` — a field you could only find by the shade of
       * its background, which disappears entirely on a white card and leaves somebody guessing where
       * to tap. The web states it plainly: a white surface with a one-pixel --border-strong edge,
       * turning brand on focus.
       *
       * White rather than grey matters on the login screen especially, where the card is already
       * glass over a photograph and a grey field inside it reads as a hole.
       */
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: HodiColors.cardBackground,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: const BorderSide(color: HodiColors.dividerStrong),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: const BorderSide(color: HodiColors.dividerStrong),
        ),
        // A field nobody may type in should look settled rather than merely quiet, so it keeps an
        // edge — the lighter one.
        disabledBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: const BorderSide(color: HodiColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: BorderSide(color: HodiColors.primaryStart, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: const BorderSide(color: HodiColors.errorStart, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.input,
          borderSide: const BorderSide(color: HodiColors.errorStart, width: 1.5),
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: HodiColors.textLight,
        ),
        labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: HodiColors.textMedium,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: HodiBorderRadius.button,
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: HodiBorderRadius.card,
        ),
        color: HodiColors.cardBackground,
      ),
      dividerTheme: const DividerThemeData(
        color: HodiColors.divider,
        thickness: 1,
        space: 1,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: HodiColors.white,
        headerBackgroundColor: HodiColors.primaryStart,
        headerForegroundColor: HodiColors.white,
        rangeSelectionBackgroundColor: HodiColors.primaryStart.withValues(alpha: 0.12),
        rangePickerHeaderBackgroundColor: HodiColors.primaryStart,
        rangePickerHeaderForegroundColor: HodiColors.white,
        dayOverlayColor: WidgetStatePropertyAll(
          HodiColors.primaryStart.withValues(alpha: 0.08),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: HodiBorderRadius.card,
        ),
        rangePickerShape: RoundedRectangleBorder(
          borderRadius: HodiBorderRadius.card,
        ),
        headerHelpStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: HodiColors.white.withValues(alpha: 0.8),
        ),
        headerHeadlineStyle: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: HodiColors.white,
        ),
        weekdayStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: HodiColors.textMedium,
        ),
        dayStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: HodiColors.textDark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HodiColors.white,
        selectedItemColor: HodiColors.primaryStart,
        unselectedItemColor: HodiColors.textLight,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
