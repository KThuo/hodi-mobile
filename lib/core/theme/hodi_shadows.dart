import 'package:flutter/material.dart';

abstract class HodiShadows {
  static List<BoxShadow> card = [
    BoxShadow(
      color: const Color(0xFF667EEA).withValues(alpha: 0.15),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> cardLight = [
    BoxShadow(
      color: const Color(0xFF667EEA).withValues(alpha: 0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> button = [
    BoxShadow(
      color: const Color(0xFF667EEA).withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> bottomNav = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, -4),
    ),
  ];
}
