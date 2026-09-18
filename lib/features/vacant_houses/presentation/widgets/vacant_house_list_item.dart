import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/vacant_house_model.dart';

/// One home, as a card.
///
/// Laid out as `hodi-f/src/components/public/ListingCard.vue` lays it out, and for the reasons its
/// own note gives:
///
/// - **the rent first**, because it is what everybody scans for and it decides whether the rest is
///   read at all. This card had it last, under the facts.
/// - then **what it is**, then **where** — property and area, in that order, behind a pin.
/// - then the facts that build a shortlist, as glyphs rather than a run-on line: "3 bed · 1 bath ·
///   1 parking" has to be read, `🛏 3  🛁 1  ▤ Third Floor` is scanned.
/// - then **when it is free**, which this card did not say at all.
///
/// The placeholder is initials rather than a house glyph, so a grid of unphotographed listings is
/// distinguishable one from another instead of thirty copies of the same icon.
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
              // 4:3, as the web's card is. A wider crop cost the photograph its sky and its floor.
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _cover(),

                  // Only where there are more than the one on screen, so the badge means "there
                  // are others" rather than restating what is already visible.
                  if (house.imageCount > house.images.length)
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: _Badge(
                        icon: Icons.photo_library_outlined,
                        label: '${house.imageCount}',
                      ),
                    ),

                  // On the photograph, bottom right, where the web puts it — it is a fact about
                  // this place rather than about the listing, and it only exists when the search
                  // was pinned to a point.
                  if (house.distanceLabel != null)
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: _Badge(label: house.distanceLabel!),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The rent, first and largest.
                  if (house.rent != null)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'KES ${CurrencyFormatter.format(house.rent!)}',
                            style: HodiTextStyles.currency.copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: HodiColors.textDark,
                            ),
                          ),
                          TextSpan(
                            text: '/month',
                            style: HodiTextStyles.bodySmall
                                .copyWith(color: HodiColors.textLight),
                          ),
                        ],
                      ),
                    )
                  else
                    // Not "KES 0", which reads as free.
                    Text(
                      'Price on request',
                      style: HodiTextStyles.bodyLarge
                          .copyWith(fontWeight: FontWeight.w700),
                    ),

                  const SizedBox(height: 4),
                  Text(
                    house.title.isEmpty ? 'Unit' : house.title,
                    style: HodiTextStyles.bodyMedium
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 13, color: HodiColors.textLight),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          // Property then area, the web's order: the building is the specific
                          // thing and the suburb is the context for it.
                          [house.propertyName ?? '', house.area ?? '']
                              .where((s) => s.isNotEmpty)
                              .join(' · '),
                          style: HodiTextStyles.bodySmall
                              .copyWith(color: HodiColors.textLight),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  if (_facts.isNotEmpty) ...[
                    const Divider(height: 19, color: HodiColors.divider),
                    Row(
                      children: [
                        for (final fact in _facts)
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(fact.icon,
                                    size: 15, color: HodiColors.textMedium),
                                const SizedBox(width: 5),
                                Text(
                                  fact.label,
                                  style: HodiTextStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: HodiColors.textMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ] else
                    const SizedBox(height: 10),

                  Text(
                    house.availableFrom == null
                        ? 'Available now'
                        : 'Available from ${house.availableFrom}',
                    style: HodiTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HodiColors.successEnd,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The four or five facts a shortlist is built from, in the web's order.
  ///
  /// Each is omitted where the server sent nothing, rather than shown as zero — a stall has no
  /// bedrooms, and "0 bed" is wrong where blank is merely quiet.
  List<({IconData icon, String label})> get _facts => [
        if (house.bedrooms != null && house.bedrooms! > 0)
          (icon: Icons.bed_outlined, label: '${house.bedrooms}'),
        if (house.bathrooms != null && house.bathrooms! > 0)
          (icon: Icons.bathtub_outlined, label: '${house.bathrooms}'),
        if (house.squareFt != null)
          (
            icon: Icons.straighten,
            label: '${CurrencyFormatter.format(house.squareFt!)} ft²'
          ),
        if (house.parkingSpaces != null && house.parkingSpaces! > 0)
          (icon: Icons.directions_car_outlined, label: '${house.parkingSpaces}'),
        if (house.floorLabel != null && house.floorLabel!.isNotEmpty)
          (icon: Icons.layers_outlined, label: house.floorLabel!),
      ];

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
        alignment: Alignment.center,
        child: Text(
          house.initials,
          style: HodiTextStyles.heading1.copyWith(
            fontSize: 30,
            color: HodiColors.textFaint,
            letterSpacing: 2,
          ),
        ),
      );
}

/// A pill on the photograph.
class _Badge extends StatelessWidget {
  const _Badge({required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.62),
        borderRadius: HodiBorderRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
