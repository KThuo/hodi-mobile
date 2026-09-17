import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../domain/maintenance_models.dart';

/// The status, in the server's words and this screen's colours.
///
/// The **text** is `statusLabel` — the app keeps no table of nine status names to fall out of step
/// with. The **colour** is matched on the code, because a colour is a presentation decision, and
/// an unrecognised code gets the neutral one rather than being asserted as anything.
class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.request});

  final MaintenanceRequestModel request;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (request.status) {
      'SUBMITTED' => (HodiColors.warningBg, HodiColors.warningEnd),
      'ACKNOWLEDGED' || 'ASSIGNED' => (HodiColors.brandSoft, HodiColors.primaryStart),
      'IN_PROGRESS' => (HodiColors.brandSoft, HodiColors.primaryPressed),
      'ON_HOLD' => (HodiColors.surfaceInset, HodiColors.textMedium),
      'RESOLVED' || 'CLOSED' => (HodiColors.successBg, HodiColors.successEnd),
      'REJECTED' || 'CANCELLED' => (HodiColors.dangerBg, HodiColors.errorStart),
      _ => (HodiColors.surfaceInset, HodiColors.textMedium),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        request.statusText,
        style: HodiTextStyles.bodySmall.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}

/// Priority as a dot rather than a word.
///
/// On a list row the priority is scanned, not read, and "NORMAL" spelled out on every card is
/// noise against the two that matter. Normal draws nothing at all for the same reason.
class PriorityDot extends StatelessWidget {
  const PriorityDot({super.key, required this.priority});

  final String? priority;

  @override
  Widget build(BuildContext context) {
    final code = (priority ?? '').toUpperCase();
    final (colour, label) = switch (code) {
      'URGENT' => (HodiColors.errorStart, 'Urgent'),
      'HIGH' => (HodiColors.warningStart, 'High'),
      'LOW' => (HodiColors.textLight, 'Low'),
      _ => (null, null),
    };
    if (colour == null) return const SizedBox.shrink();

    return Semantics(
      label: '$label priority',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: colour.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: colour, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
            Text(
              label!,
              style: HodiTextStyles.bodySmall.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: colour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
