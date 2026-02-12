import 'package:flutter/material.dart';

abstract class HodiBorderRadius {
  static const double cardValue = 24.0;
  static const double buttonValue = 12.0;
  static const double badgeValue = 10.0;
  static const double inputValue = 12.0;
  static const double smallValue = 8.0;

  static final BorderRadius card = BorderRadius.circular(cardValue);
  static final BorderRadius button = BorderRadius.circular(buttonValue);
  static final BorderRadius badge = BorderRadius.circular(badgeValue);
  static final BorderRadius input = BorderRadius.circular(inputValue);
  static final BorderRadius small = BorderRadius.circular(smallValue);
  static final BorderRadius full = BorderRadius.circular(100.0);
}
