import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/hodi_gradients.dart';
import '../theme/hodi_border_radius.dart';

enum BadgeType { success, warning, error, info }

class HodiStatusBadge extends StatelessWidget {
  final String text;
  final BadgeType type;

  const HodiStatusBadge({
    super.key,
    required this.text,
    this.type = BadgeType.info,
  });

  LinearGradient get _gradient {
    switch (type) {
      case BadgeType.success:
        return HodiGradients.success;
      case BadgeType.warning:
        return HodiGradients.warning;
      case BadgeType.error:
        return HodiGradients.error;
      case BadgeType.info:
        return HodiGradients.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: _gradient,
        borderRadius: HodiBorderRadius.badge,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
