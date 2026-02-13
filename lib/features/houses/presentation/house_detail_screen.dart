import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_status_badge.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../domain/house_detail_model.dart';
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
                _HouseHeaderCard(detail: detail),
                const SizedBox(height: 16),
                _HouseInfoCard(detail: detail),
                const SizedBox(height: 16),
                featuresAsync.when(
                  data: (features) {
                    if (features.isEmpty) return const SizedBox.shrink();
                    return Column(
                      children: [
                        _FeaturesCard(
                          features: features.map((f) => f.name ?? '').where((n) => n.isNotEmpty).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
                if (detail.tenant != null)
                  _TenantCard(tenant: detail.tenant!, isOccupied: detail.isOccupied),
                if (!detail.isOccupied && detail.tenant == null)
                  _VacantCard(),
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception ? e.toString().replaceFirst('Exception: ', '') : 'Failed to load details',
          onRetry: () => ref.invalidate(houseDetailProvider(houseId)),
        ),
      ),
    );
  }
}

// --- Gradient Header ---

class _HouseHeaderCard extends StatelessWidget {
  final HouseDetailModel detail;

  const _HouseHeaderCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: HodiColors.white.withValues(alpha: 0.2),
              borderRadius: HodiBorderRadius.small,
            ),
            child: const Icon(Icons.home_work_outlined, color: HodiColors.white, size: 28),
          ),
          const SizedBox(height: 14),
          Text(
            detail.houseName ?? 'House',
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          if (detail.houseCode != null) ...[
            const SizedBox(height: 4),
            Text(
              detail.houseCode!,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
          const SizedBox(height: 12),
          HodiStatusBadge(
            text: detail.isOccupied ? 'Occupied' : 'Vacant',
            type: detail.isOccupied ? BadgeType.success : BadgeType.warning,
          ),
          const SizedBox(height: 14),
          Text(
            'Monthly Rent',
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 2),
          HodiAmountText(
            amount: detail.rent,
            style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
          ),
        ],
      ),
    );
  }
}

// --- House Information Card ---

class _HouseInfoCard extends StatelessWidget {
  final HouseDetailModel detail;

  const _HouseInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: HodiColors.primaryStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: const Icon(Icons.info_outline, color: HodiColors.primaryStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('House Information', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          _DetailRow(icon: Icons.category_outlined, label: 'Type', value: detail.houseType ?? '-'),
          _DetailRow(icon: Icons.meeting_room_outlined, label: 'Category', value: detail.category ?? '-'),
          if (detail.floor != null)
            _DetailRow(icon: Icons.layers_outlined, label: 'Floor', value: detail.floor!),
          _DetailRow(icon: Icons.location_on_outlined, label: 'Location', value: detail.location ?? '-'),
          if (detail.squareFt != null)
            _DetailRow(icon: Icons.square_foot_outlined, label: 'Size', value: '${detail.squareFt!.toStringAsFixed(0)} sq ft'),
          _DetailRow(icon: Icons.apartment_outlined, label: 'Property', value: detail.property ?? '-'),
          _DetailRow(icon: Icons.domain_outlined, label: 'Estate', value: detail.estate ?? '-', isLast: true),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: HodiColors.textLight),
          const SizedBox(width: 10),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: HodiTextStyles.label.copyWith(
                color: HodiColors.textLight,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Features Card ---

class _FeaturesCard extends StatelessWidget {
  final List<String> features;

  const _FeaturesCard({required this.features});

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: HodiColors.warningStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: const Icon(Icons.star_outline, color: HodiColors.warningStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Features', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: features.map((name) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: HodiColors.primaryStart.withValues(alpha: 0.08),
                borderRadius: HodiBorderRadius.full,
                border: Border.all(
                  color: HodiColors.primaryStart.withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, size: 14, color: HodiColors.successStart),
                  const SizedBox(width: 6),
                  Text(
                    name,
                    style: HodiTextStyles.bodySmall.copyWith(
                      color: HodiColors.primaryStart,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

// --- Tenant Card ---

class _TenantCard extends StatelessWidget {
  final HouseTenant tenant;
  final bool isOccupied;

  const _TenantCard({required this.tenant, required this.isOccupied});

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: HodiColors.successStart.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: const Icon(Icons.person_outline, color: HodiColors.successStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Current Tenant', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          // Tenant name & phone
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: HodiGradients.primary,
                  borderRadius: HodiBorderRadius.small,
                ),
                child: Center(
                  child: Text(
                    _initials(tenant.name),
                    style: HodiTextStyles.labelBold.copyWith(
                      color: HodiColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tenant.name ?? '-',
                      style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (tenant.phone != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.phone_outlined, size: 13, color: HodiColors.textLight),
                          const SizedBox(width: 4),
                          Text(tenant.phone!, style: HodiTextStyles.bodySmall),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Info rows
          _TenantInfoRow(label: 'Invoice Month', value: tenant.invoiceMonth ?? '-'),
          _TenantInfoRow(label: 'Due Date', value: tenant.dueDate ?? '-'),
          _TenantInfoRow(label: 'Occupied On', value: tenant.occupiedOn ?? '-'),

          const SizedBox(height: 16),

          // Financial metric tiles
          Row(
            children: [
              Expanded(
                child: _FinancialTile(
                  label: 'Arrears',
                  amount: tenant.rentOwed,
                  color: tenant.rentOwed > 0
                      ? HodiColors.errorStart
                      : HodiColors.successStart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FinancialTile(
                  label: 'Refundable',
                  amount: tenant.refundableAmount,
                  color: HodiColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _initials(String? name) {
    if (name == null || name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return parts[0][0].toUpperCase();
  }
}

class _TenantInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _TenantInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinancialTile extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _FinancialTile({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: HodiBorderRadius.small,
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 6),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}

// --- Vacant Card ---

class _VacantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: HodiColors.textLight.withValues(alpha: 0.1),
              borderRadius: HodiBorderRadius.full,
            ),
            child: const Icon(Icons.person_off_outlined, color: HodiColors.textLight, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            'No Current Tenant',
            style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'This house is currently vacant',
            style: HodiTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
