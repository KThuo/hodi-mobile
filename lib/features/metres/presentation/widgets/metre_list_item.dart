import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../domain/metre_model.dart';

class MetreListItem extends StatelessWidget {
  final MetreModel metre;
  final VoidCallback? onTap;

  const MetreListItem({super.key, required this.metre, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  metre.metreNo ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              HodiStatusBadge(
                text: metre.isActive ? 'Active' : 'Inactive',
                type: metre.isActive ? BadgeType.success : BadgeType.error,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.receipt_long_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  metre.billName ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(
                metre.houseName ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              const Icon(Icons.location_city_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  metre.property ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${metre.previousReading}',
                style: HodiTextStyles.bodyMedium,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(Icons.arrow_forward, size: 14, color: Color(0xFF9CA3AF)),
              ),
              Text(
                '${metre.currentReading}',
                style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                '${metre.consumedUnits} units',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: metre.amount,
                style: HodiTextStyles.currency.copyWith(fontSize: 15),
              ),
              if (metre.updatedOn != null)
                Text(
                  metre.updatedOn!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
