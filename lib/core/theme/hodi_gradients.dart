import 'package:flutter/material.dart';
import 'hodi_colors.dart';

abstract class HodiGradients {
  /// What a filled button is painted with — `--grad-button` on the web.
  ///
  /// **Not the full brand gradient**, and the difference is the point. `--grad-brand` runs blue all
  /// the way to magenta and is reserved for one thing: the gradient-clipped heading. A button is a
  /// surface, and a surface in full brand-into-accent shouts. The web mixes only 30% of the accent
  /// into the brand for the far stop — `color-mix(in srgb, accent 30%, brand)`, which resolves to
  /// #5E71D4 — so the button reads as blue with a warm edge rather than as a stripe of two colours.
  static LinearGradient get button => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // 30% of the accent mixed into the brand, computed rather than written down, so a configured
    // brand carries the button with it.
    colors: [
      HodiColors.primaryStart,
      Color.lerp(HodiColors.primaryStart, HodiColors.accent, 0.30)!,
    ],
  );

  /// The app's one gradient: the dashboard header.
  ///
  /// Built from the ink, deepening toward the brand — a navy header rather than a slab of
  /// blue-into-magenta. Brand gradients used to fill thirty-four surfaces across fifteen files, and
  /// four of them sat together at the top of the dashboard; the figures were the quietest thing on
  /// their own cards. `hodi-f`'s tiles and `axis-m` both put the colour on an edge or an icon and
  /// leave the surface alone, and this follows them.
  static LinearGradient get header => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [HodiColors.ink, HodiColors.inkDeep],
  );

  static LinearGradient get primary => LinearGradient(
    colors: [HodiColors.primaryStart, HodiColors.primaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get primaryHorizontal => LinearGradient(
    colors: [HodiColors.primaryStart, HodiColors.primaryEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient success = LinearGradient(
    colors: [HodiColors.successStart, HodiColors.successEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warning = LinearGradient(
    colors: [HodiColors.warningStart, HodiColors.warningEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient error = LinearGradient(
    colors: [HodiColors.errorStart, HodiColors.errorEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
