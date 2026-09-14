import 'package:flutter/material.dart';

/// Corner radii, ported from the `--r-*` tokens in `hodi-f/src/styles/theme.css`.
///
/// The notable one is [buttonValue]. The web's `--r-button` is `--r-full` — **buttons are pills**,
/// everywhere, and they were 12px rounded rectangles here. Nothing else marks a product's shape
/// quite as strongly as its buttons, so this is the single change that does most to make the app
/// and the console look like the same thing.
abstract class HodiBorderRadius {
  static const double xs = 6.0;    // --r-xs
  static const double sm = 8.0;    // --r-sm
  static const double md = 12.0;   // --r-md
  static const double lg = 16.0;   // --r-lg
  static const double xl = 22.0;   // --r-xl
  static const double fullValue = 999.0; // --r-full

  /// Cards are --r-lg. They were 24, which is rounder than anything on the web.
  static const double cardValue = lg;

  /// Pills. See the note above.
  static const double buttonValue = fullValue;

  static const double badgeValue = fullValue;
  static const double inputValue = 10.0;
  static const double smallValue = sm;

  static BorderRadius get card => BorderRadius.circular(cardValue);
  static BorderRadius get button => BorderRadius.circular(buttonValue);
  static BorderRadius get badge => BorderRadius.circular(badgeValue);
  static BorderRadius get input => BorderRadius.circular(inputValue);
  static BorderRadius get small => BorderRadius.circular(smallValue);
  static BorderRadius get full => BorderRadius.circular(fullValue);
}

/// Spacing, from the `--sp-*` scale. A 4px base, as the web has.
abstract class HodiSpace {
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 12;
  static const double x4 = 16;
  static const double x5 = 20;
  static const double x6 = 24;
  static const double x8 = 32;
  static const double x10 = 40;
  static const double x12 = 48;

  /// The minimum comfortable touch target — `--tap`.
  static const double tap = 44;
}
