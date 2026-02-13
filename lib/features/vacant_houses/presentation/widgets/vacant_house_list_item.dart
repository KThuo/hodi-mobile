import 'package:flutter/material.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../domain/vacant_house_model.dart';

class VacantHouseListItem extends StatelessWidget {
  final VacantHouseModel house;
  final VoidCallback? onTap;

  const VacantHouseListItem({super.key, required this.house, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: HodiBorderRadius.card,
        child: InkWell(
          onTap: onTap,
          borderRadius: HodiBorderRadius.card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildImage(),
                      // Category tag
                      if (house.category != null)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: HodiColors.primaryStart.withValues(alpha: 0.9),
                              borderRadius: HodiBorderRadius.badge,
                            ),
                            child: Text(
                              house.category!,
                              style: HodiTextStyles.bodySmall.copyWith(
                                color: HodiColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      // Distance badge
                      if (house.distanceText != null && house.distanceText != 'N/A')
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: HodiColors.black.withValues(alpha: 0.6),
                              borderRadius: HodiBorderRadius.badge,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.near_me, size: 12, color: HodiColors.white),
                                const SizedBox(width: 4),
                                Text(
                                  house.distanceText!,
                                  style: HodiTextStyles.bodySmall.copyWith(
                                    color: HodiColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Details section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // House name
                    Text(
                      house.houseName ?? house.houseNumber ?? 'Vacant House',
                      style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Property name
                    Text(
                      house.property ?? house.estate ?? '',
                      style: HodiTextStyles.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (house.location != null) ...[
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 14, color: HodiColors.textLight),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              house.location!,
                              style: HodiTextStyles.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 10),
                    // Bottom row: info chips + rent
                    Row(
                      children: [
                        if (house.squareFt != null && house.squareFt! > 0) ...[
                          _InfoChip(
                            icon: Icons.square_foot_outlined,
                            text: '${house.squareFt!.toStringAsFixed(0)} sqft',
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (house.houseType != null)
                          _InfoChip(
                            icon: Icons.home_outlined,
                            text: house.houseType!,
                          ),
                        const Spacer(),
                        HodiAmountText(
                          amount: house.rent,
                          style: HodiTextStyles.currency.copyWith(
                            fontSize: 15,
                            color: HodiColors.primaryStart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (house.imageUrl != null && house.imageUrl!.isNotEmpty) {
      final fullUrl = house.imageUrl!.startsWith('http')
          ? house.imageUrl!
          : '${ApiConstants.baseUrl}${house.imageUrl}';
      return Image.network(
        fullUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _placeholderImage(),
      );
    }
    return _placeholderImage();
  }

  Widget _placeholderImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HodiColors.primaryStart.withValues(alpha: 0.15),
            HodiColors.primaryEnd.withValues(alpha: 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.home_work_outlined, size: 48, color: HodiColors.textLight),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: HodiColors.textMedium),
          const SizedBox(width: 4),
          Text(
            text,
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.textMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
