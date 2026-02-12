import 'package:flutter/material.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_shadows.dart';
import '../theme/hodi_border_radius.dart';

class HodiCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const HodiCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.boxShadow,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? HodiColors.cardBackground,
        borderRadius: borderRadius ?? HodiBorderRadius.card,
        boxShadow: boxShadow ?? HodiShadows.cardLight,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius ?? HodiBorderRadius.card,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? HodiBorderRadius.card,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}
