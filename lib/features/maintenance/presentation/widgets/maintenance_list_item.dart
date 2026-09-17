import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../domain/maintenance_models.dart';
import 'maintenance_chips.dart';

class MaintenanceListItem extends StatelessWidget {
  const MaintenanceListItem({super.key, required this.request, this.onTap});

  final MaintenanceRequestModel request;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  request.title,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              PriorityDot(priority: request.priority),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            [
              request.requestRef,
              if (request.categoryName != null) request.categoryName!,
              if (request.unitLabel.isNotEmpty) request.unitLabel,
            ].join(' · '),
            style: HodiTextStyles.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              StatusPill(request: request),
              const Spacer(),
              // Late is the server's judgement, not a comparison against this handset's clock —
              // which would disagree with the office across a timezone.
              if (request.late || request.slaBreached)
                Row(
                  children: [
                    const Icon(Icons.schedule,
                        size: 13, color: HodiColors.errorStart),
                    const SizedBox(width: 4),
                    Text(
                      request.dueLabel ?? 'Overdue',
                      style: HodiTextStyles.bodySmall.copyWith(
                        fontSize: 11,
                        color: HodiColors.errorStart,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  _when(request.submittedOn),
                  style: HodiTextStyles.bodySmall
                      .copyWith(fontSize: 11, color: HodiColors.textLight),
                ),
            ],
          ),
          if (request.awaitingRating) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 14, color: HodiColors.warningStart),
                const SizedBox(width: 6),
                Text(
                  'Tap to rate this repair',
                  style: HodiTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: HodiColors.warningEnd,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  static String _when(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    if (parsed == null) return '';
    final age = DateTime.now().difference(parsed);
    return age.inDays >= 7
        ? DateFormatter.formatDate(parsed)
        : DateFormatter.timeAgo(parsed);
  }
}
