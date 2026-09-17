import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../domain/property_model.dart';

class PropertyListItem extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback? onTap;

  const PropertyListItem({super.key, required this.property, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: HodiColors.primaryStart.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.apartment,
              color: HodiColors.primaryStart,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.name,
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  property.estateName ?? '',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${property.units} units',
                      style: HodiTextStyles.bodySmall.copyWith(
                        color: HodiColors.textMedium,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${property.occupiedUnits} occupied',
                      style: HodiTextStyles.bodySmall.copyWith(
                        color: HodiColors.successStart,
                      ),
                    ),
                    const Spacer(),
                    if (property.location != null)
                      Flexible(
                        child: Text(
                          property.location!,
                          style: HodiTextStyles.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
