import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../domain/house_model.dart';
import '../../domain/unit_standing.dart';

class HouseListItem extends StatelessWidget {
  final HouseModel house;
  final VoidCallback? onTap;

  const HouseListItem({super.key, required this.house, this.onTap});

  @override
  Widget build(BuildContext context) {
    final standing = UnitStanding.of(
      status: house.status,
      occupied: house.occupied,
      availability: house.availability,
      reason: house.availabilityReason,
      availableFrom: house.availableFrom,
      reviewSince: house.availabilityReviewSince,
    );
    return HodiCard(
      onTap: onTap,
      child: Row(
        children: [
          // House icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: house.occupied
                  ? HodiColors.successStart.withValues(alpha: 0.1)
                  : HodiColors.textLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              house.occupied ? Icons.home : Icons.home_outlined,
              color: house.occupied ? HodiColors.successStart : HodiColors.textLight,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  house.displayName,
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  house.propertyName ?? house.estateName ?? '',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Null rent is an owned unit, which carries a service charge rather than rent.
                    // "KES 0" there would claim it is let for nothing.
                    if (house.rent != null)
                      HodiAmountText(
                        amount: house.rent!,
                        style: HodiTextStyles.currency.copyWith(fontSize: 14),
                      )
                    else
                      Text(
                        house.tenure == 'OWNED' ? 'Owned' : '—',
                        style: HodiTextStyles.bodySmall,
                      ),
                    const Spacer(),
                    // Suspended, held back, back and awaiting a confirmation, occupied or vacant —
                    // the order is UnitStanding's, so the list and the detail never disagree.
                    HodiStatusBadge(text: standing.label, type: standing.type),
                  ],
                ),
                if (standing.detail != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    standing.detail!,
                    style: HodiTextStyles.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
