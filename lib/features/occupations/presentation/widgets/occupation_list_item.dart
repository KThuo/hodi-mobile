import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../domain/occupation_model.dart';

class OccupationListItem extends StatelessWidget {
  final OccupationModel occupation;
  final VoidCallback? onTap;

  const OccupationListItem({super.key, required this.occupation, this.onTap});

  @override
  Widget build(BuildContext context) {
    final owing = occupation.inArrears;

    return HodiCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: owing
                  ? HodiColors.errorStart.withValues(alpha: 0.1)
                  : HodiColors.successStart.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.holiday_village_outlined,
              color: owing ? HodiColors.errorStart : HodiColors.successStart,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  occupation.displayName,
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  occupation.propertyName ?? occupation.estateName ?? '',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    HodiAmountText(
                      amount: occupation.rent,
                      style: HodiTextStyles.currency.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    // One column with a sign. Printing a negative amount under "Arrears" is what
                    // makes somebody in credit think they owe money.
                    if (occupation.rentOwed != 0)
                      HodiStatusBadge(
                        text: owing ? 'In arrears' : 'In credit',
                        type: owing ? BadgeType.error : BadgeType.success,
                      )
                    else
                      const HodiStatusBadge(text: 'Settled', type: BadgeType.success),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
