import 'package:flutter/material.dart';
import 'hodi_colors.dart';

abstract class HodiGradients {
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
