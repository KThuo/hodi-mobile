import 'package:flutter/material.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';
import 'hodi_gradient_button.dart';

class HodiErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const HodiErrorState({
    super.key,
    this.message = 'Something went wrong',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 64, color: HodiColors.errorStart),
            const SizedBox(height: 16),
            Text(message, style: HodiTextStyles.bodyLarge, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              HodiGradientButton(
                text: 'Retry',
                onPressed: onRetry,
                width: 140,
                icon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
