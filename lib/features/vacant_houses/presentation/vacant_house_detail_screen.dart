import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_constants.dart';
import '../../../core/map/static_map_view.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/vacant_house_detail_model.dart';
import '../providers/vacant_house_providers.dart';
import 'widgets/listing_contact_card.dart';

/// One place to rent.
///
/// The question somebody has on this screen is **what will it cost me to move in**, so the
/// itemised move-in costs are the centre of it rather than a footnote under the rent. The server
/// sends them itemised, with a `refundable` flag per line, and that distinction — what comes back
/// at the end and what does not — is the part people actually want separated out.
class VacantHouseDetailScreen extends ConsumerWidget {
  const VacantHouseDetailScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(vacantHouseDetailProvider(houseId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'To Let'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 150),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That listing is no longer available.',
          onRetry: () => ref.invalidate(vacantHouseDetailProvider(houseId)),
        ),
        data: (listing) {
          if (listing == null) {
            return const HodiErrorState(
                message: 'That listing is no longer available.');
          }

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              if (listing.images.isNotEmpty) _Gallery(images: listing.images),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listing.title.isEmpty ? 'Unit' : listing.title,
                      style: HodiTextStyles.heading2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        if (listing.area != null) listing.area!,
                        if (listing.propertyName != null) listing.propertyName!,
                      ].join(' · '),
                      style: HodiTextStyles.bodyMedium
                          .copyWith(color: HodiColors.textMedium),
                    ),
                    const SizedBox(height: 12),
                    if (listing.rent != null)
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'KES ${CurrencyFormatter.format(listing.rent!)}',
                              style: HodiTextStyles.currency.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: HodiColors.textDark,
                              ),
                            ),
                            TextSpan(
                              text: '  / month',
                              style: HodiTextStyles.bodySmall
                                  .copyWith(color: HodiColors.textLight),
                            ),
                          ],
                        ),
                      )
                    else
                      Text('Price on request', style: HodiTextStyles.bodyLarge),

                    if (listing.availableFrom != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        'Available from ${_date(listing.availableFrom)}',
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.successEnd),
                      ),
                    ],

                    const SizedBox(height: 18),
                    if (listing.roomsLine.isNotEmpty ||
                        listing.squareFt != null ||
                        listing.floorLabel != null)
                      _FactsRow(listing: listing),

                    if (listing.moveInCosts.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      _MoveInCard(listing: listing),
                    ],

                    if (listing.description != null &&
                        listing.description!.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      Text('About this place',
                          style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(listing.description!, style: HodiTextStyles.bodyMedium),
                    ],

                    if (listing.amenities.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      Text('What is here',
                          style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final a in listing.amenities)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 7),
                              decoration: BoxDecoration(
                                color: HodiColors.surfaceInset,
                                borderRadius: HodiBorderRadius.full,
                              ),
                              child: Text(a.name, style: HodiTextStyles.bodySmall),
                            ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 18),
                    StaticMapView(
                      latitude: listing.latitude,
                      longitude: listing.longitude,
                      label: listing.title,
                    ),

                    if (listing.hasContact) ...[
                      const SizedBox(height: 18),
                      ListingContactCard(detail: listing),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? 'now' : DateFormatter.formatDate(parsed);
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, i) => CachedNetworkImage(
          imageUrl: images[i].startsWith('http')
              ? images[i]
              : '${ApiConstants.baseUrl}${images[i]}',
          fit: BoxFit.cover,
          placeholder: (_, _) => Container(color: HodiColors.surfaceInset),
          errorWidget: (_, _, _) => Container(
            color: HodiColors.surfaceInset,
            child: const Center(
              child: Icon(Icons.home_work_outlined,
                  size: 36, color: HodiColors.textFaint),
            ),
          ),
        ),
      ),
    );
  }
}

/// Beds, baths, size, floor — the things scanned rather than read.
class _FactsRow extends StatelessWidget {
  const _FactsRow({required this.listing});

  final VacantHouseDetailModel listing;

  @override
  Widget build(BuildContext context) {
    final facts = <({IconData icon, String label})>[
      if (listing.bedrooms != null)
        (icon: Icons.king_bed_outlined, label: '${listing.bedrooms} bed'),
      if (listing.bathrooms != null)
        (icon: Icons.shower_outlined, label: '${listing.bathrooms} bath'),
      if (listing.squareFt != null)
        (
          icon: Icons.square_foot_outlined,
          label: '${listing.squareFt!.toStringAsFixed(0)} sq ft'
        ),
      if (listing.floorLabel != null)
        (icon: Icons.layers_outlined, label: listing.floorLabel!),
      if (listing.parkingSpaces != null && listing.parkingSpaces! > 0)
        (
          icon: Icons.directions_car_outlined,
          label: '${listing.parkingSpaces} parking'
        ),
      if (listing.dsq) (icon: Icons.home_work_outlined, label: 'DSQ'),
    ];
    if (facts.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final f in facts)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: HodiColors.surfaceLight,
              borderRadius: HodiBorderRadius.small,
              border: Border.all(color: HodiColors.divider),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(f.icon, size: 15, color: HodiColors.textMedium),
                const SizedBox(width: 6),
                Text(f.label, style: HodiTextStyles.bodySmall),
              ],
            ),
          ),
      ],
    );
  }
}

/// What it costs to move in.
///
/// The question this whole screen is really answering. Itemised as the server sends it, with the
/// refundable part called out separately — the difference between a deposit and a fee is the
/// thing somebody most wants to know once they have seen the total.
class _MoveInCard extends StatelessWidget {
  const _MoveInCard({required this.listing});

  final VacantHouseDetailModel listing;

  @override
  Widget build(BuildContext context) {
    final refundable = listing.refundableAtEnd;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Moving in', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          for (final cost in listing.moveInCosts)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(cost.name,
                              style: HodiTextStyles.bodyMedium),
                        ),
                        if (cost.refundable) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: HodiColors.successBg,
                              borderRadius: HodiBorderRadius.full,
                            ),
                            child: Text(
                              'refundable',
                              style: HodiTextStyles.bodySmall.copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: HodiColors.successEnd,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    // A charge set as a rule rather than a figure — "two months' rent" — is shown
                    // as the rule. Rendering it as KES 0 would be a price nobody quoted.
                    cost.amount != null
                        ? 'KES ${CurrencyFormatter.format(cost.amount!)}'
                        : cost.months != null
                            ? '${cost.months} month${cost.months == 1 ? '' : 's'}'
                            : '—',
                    style: HodiTextStyles.currency.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          const Divider(height: 18, color: HodiColors.divider),
          Row(
            children: [
              Text('Total to move in',
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(
                'KES ${CurrencyFormatter.format(listing.totalMoveInCost)}',
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (refundable > 0) ...[
            const SizedBox(height: 6),
            Text(
              'KES ${CurrencyFormatter.format(refundable)} of that is refundable '
              'when you leave.',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.successEnd),
            ),
          ],
        ],
      ),
    );
  }
}
