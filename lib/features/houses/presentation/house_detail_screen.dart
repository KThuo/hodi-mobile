import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_status_badge.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/house_providers.dart';

class HouseDetailScreen extends ConsumerWidget {
  final int houseId;

  const HouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(houseDetailProvider(houseId));
    final featuresAsync = ref.watch(houseFeaturesProvider(houseId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'House Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'House not found');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // House info card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: HodiColors.cardBackground,
                    borderRadius: HodiBorderRadius.card,
                    boxShadow: HodiShadows.cardLight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              detail.houseName ?? 'House',
                              style: HodiTextStyles.heading2,
                            ),
                          ),
                          HodiStatusBadge(
                            text: detail.isOccupied ? 'Occupied' : 'Vacant',
                            type: detail.isOccupied ? BadgeType.success : BadgeType.warning,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _InfoRow(label: 'Code', value: detail.houseCode ?? '-'),
                      _InfoRow(label: 'Type', value: detail.houseType ?? '-'),
                      _InfoRow(label: 'Category', value: detail.category ?? '-'),
                      _InfoRow(label: 'Floor', value: detail.floor ?? '-'),
                      _InfoRow(label: 'Location', value: detail.location ?? '-'),
                      _InfoRow(label: 'Size', value: detail.squareFt != null ? '${detail.squareFt} sq ft' : '-'),
                      _InfoRow(label: 'Property', value: detail.property ?? '-'),
                      _InfoRow(label: 'Estate', value: detail.estate ?? '-'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Rent', style: HodiTextStyles.bodyMedium),
                          const Spacer(),
                          HodiAmountText(amount: detail.rent),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Features card
                featuresAsync.when(
                  data: (features) {
                    if (features.isEmpty) return const SizedBox.shrink();
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: HodiColors.cardBackground,
                        borderRadius: HodiBorderRadius.card,
                        boxShadow: HodiShadows.cardLight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Features', style: HodiTextStyles.heading3),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: features.map((f) => Chip(
                              label: Text(
                                f.name ?? '',
                                style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textDark),
                              ),
                              backgroundColor: HodiColors.surfaceLight,
                              side: BorderSide.none,
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            )).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                ),

                const SizedBox(height: 16),

                // Tenant card (if occupied)
                if (detail.isOccupied && detail.tenant != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: HodiColors.cardBackground,
                      borderRadius: HodiBorderRadius.card,
                      boxShadow: HodiShadows.cardLight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: HodiColors.primaryStart, size: 20),
                            const SizedBox(width: 8),
                            Text('Tenant', style: HodiTextStyles.heading3),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(label: 'Name', value: detail.tenant!.name ?? '-'),
                        _InfoRow(label: 'Phone', value: detail.tenant!.phone ?? '-'),
                        _InfoRow(label: 'Invoice Month', value: detail.tenant!.invoiceMonth ?? '-'),
                        _InfoRow(label: 'Due Date', value: detail.tenant!.dueDate ?? '-'),
                        _InfoRow(label: 'Occupied On', value: detail.tenant!.occupiedOn ?? '-'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Rent Owed', style: HodiTextStyles.bodyMedium),
                            const Spacer(),
                            HodiAmountText(
                              amount: detail.tenant!.rentOwed,
                              style: HodiTextStyles.currency.copyWith(
                                color: detail.tenant!.rentOwed > 0
                                    ? HodiColors.errorStart
                                    : HodiColors.successStart,
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
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: 'Failed to load details',
          onRetry: () => ref.invalidate(houseDetailProvider(houseId)),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: HodiTextStyles.bodyMedium),
          ),
          Expanded(
            child: Text(value, style: HodiTextStyles.bodyLarge.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
