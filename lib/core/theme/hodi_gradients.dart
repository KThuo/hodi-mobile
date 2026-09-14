import 'package:flutter/material.dart';
import 'hodi_colors.dart';

abstract class HodiGradients {
  /// The app's one gradient: the dashboard header.
  ///
  /// Built from the ink, deepening toward the brand — a navy header rather than a slab of
  /// blue-into-magenta. Brand gradients used to fill thirty-four surfaces across fifteen files, and
  /// four of them sat together at the top of the dashboard; the figures were the quietest thing on
  /// their own cards. `hodi-f`'s tiles and `axis-m` both put the colour on an edge or an icon and
  /// leave the surface alone, and this follows them.
  static const LinearGradient header = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [HodiColors.ink, HodiColors.inkDeep],
  );

  static const LinearGradient primary = LinearGradient(
    colors: [HodiColors.primaryStart, HodiColors.primaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryHorizontal = LinearGradient(
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
