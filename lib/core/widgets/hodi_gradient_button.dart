import 'package:flutter/material.dart';
import '../theme/hodi_gradients.dart';
import '../theme/hodi_shadows.dart';
import '../theme/hodi_border_radius.dart';
import '../theme/hodi_text_styles.dart';

class HodiGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final LinearGradient? gradient;
  final double? width;
  final IconData? icon;

  const HodiGradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.gradient,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 52,
      decoration: BoxDecoration(
        gradient: onPressed != null ? (gradient ?? HodiGradients.button) : null,
        color: onPressed == null ? Colors.grey.shade300 : null,
        borderRadius: HodiBorderRadius.button,
        boxShadow: onPressed != null ? HodiShadows.button : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: HodiBorderRadius.button,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: HodiBorderRadius.button,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                      ],
                      Text(text, style: HodiTextStyles.button),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
