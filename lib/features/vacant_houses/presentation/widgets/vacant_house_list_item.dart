import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/vacant_house_model.dart';

/// One place to rent.
class VacantHouseListItem extends StatelessWidget {
  const VacantHouseListItem({super.key, required this.house, this.onTap});

  final VacantHouseModel house;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _cover(),
                  // Only where there is more than the one on screen, so the badge means
                  // "there are others" rather than restating what is already visible.
                  if (house.imageCount > 1)
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.55),
                          borderRadius: HodiBorderRadius.full,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.photo_library_outlined,
                                size: 12, color: Colors.white),
                            const SizedBox(width: 4),
                            Text(
                              '${house.imageCount}',
                              style: HodiTextStyles.bodySmall.copyWith(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.title.isEmpty ? 'Unit' : house.title,
                    style: HodiTextStyles.bodyLarge
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    [
                      if (house.area != null) house.area!,
                      house.propertyName ?? '',
                    ].where((s) => s.isNotEmpty).join(' · '),
                    style: HodiTextStyles.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (house.roomsLine.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(house.roomsLine,
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.textLight)),
                  ],
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // No rent shown where the server sent none. "KES 0" reads as free.
                      if (house.rent != null)
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'KES ${CurrencyFormatter.format(house.rent!)}',
                                style: HodiTextStyles.currency.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: HodiColors.textDark,
                                ),
                              ),
                              TextSpan(
                                text: ' / month',
                                style: HodiTextStyles.bodySmall
                                    .copyWith(color: HodiColors.textLight),
                              ),
                            ],
                          ),
                        )
                      else
                        Text('Price on request',
                            style: HodiTextStyles.bodySmall),
                      const Spacer(),
                      if (house.distanceKm != null)
                        Text(
                          '${house.distanceKm!.toStringAsFixed(1)} km away',
                          style: HodiTextStyles.bodySmall.copyWith(
                            fontSize: 11,
                            color: HodiColors.textLight,
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
    );
  }

  Widget _cover() {
    final image = house.coverImage;
    if (image == null) return _placeholder();

    return CachedNetworkImage(
      imageUrl: image.startsWith('http') ? image : '${ApiConstants.baseUrl}$image',
      fit: BoxFit.cover,
      placeholder: (_, _) => Container(color: HodiColors.surfaceInset),
      errorWidget: (_, _, _) => _placeholder(),
    );
  }

  Widget _placeholder() => Container(
        color: HodiColors.surfaceInset,
        child: const Center(
          child: Icon(Icons.home_work_outlined,
              size: 34, color: HodiColors.textFaint),
        ),
      );
}
