import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_status_badge.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../occupations/domain/occupation_model.dart';
import '../../occupations/providers/occupation_providers.dart';
import '../domain/house_detail_model.dart';
import '../providers/house_providers.dart';

/// One unit.
///
/// Two reads, not one. `GET /units/{id}` describes the unit and carries its features; who lives in
/// it is `GET /occupations/house/{id}`, because a tenancy is a separate thing from a room. The
/// legacy endpoint nested the tenant inside the unit and the rebuilt one does not, so the tenant
/// card waits on its own request and the rest of the page does not wait with it.
class HouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const HouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(houseDetailProvider(houseId));
    final occupationAsync = ref.watch(occupationOfHouseProvider(houseId));

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
                if (detail.features.isNotEmpty) ...[
                  _FeaturesCard(
                    features: detail.features
                        .map((f) => f.label)
                        .where((n) => n.isNotEmpty)
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                ],
                occupationAsync.when(
                  data: (occupation) => occupation == null
                      ? const _VacantCard()
                      : _TenantCard(occupation: occupation),
                  // The unit is already on screen; a spinner where the tenant card will be says
                  // "still asking" without taking the page away.
                  loading: () => const HodiLoadingShimmer(itemCount: 1, itemHeight: 180),
                  error: (_, _) => const _VacantCard(),
                ),
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load details',
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
            detail.displayName,
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            detail.houseCode,
            style: HodiTextStyles.bodyMedium.copyWith(
              color: HodiColors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 12),
          HodiStatusBadge(
            text: detail.occupied ? 'Occupied' : 'Vacant',
            type: detail.occupied ? BadgeType.success : BadgeType.warning,
          ),
          const SizedBox(height: 14),
          // An owned unit has no rent. Saying "Monthly Rent KES 0" of it would be a claim, not a
          // blank, so the label changes with the tenure rather than the figure changing to zero.
          if (detail.rent != null) ...[
            Text(
              'Monthly Rent',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.white.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 2),
            HodiAmountText(
              amount: detail.rent!,
              style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
            ),
          ] else
            Text(
              detail.tenure == 'OWNED' ? 'Owned unit' : 'No rent set',
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.white.withValues(alpha: 0.85),
              ),
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
    final rooms = _rooms(detail);

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
                child: Icon(Icons.info_outline, color: HodiColors.primaryStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('House Information', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          _DetailRow(
            icon: Icons.category_outlined,
            label: 'Type',
            value: detail.usageClassName ?? '-',
          ),
          _DetailRow(
            icon: Icons.meeting_room_outlined,
            label: 'Category',
            value: detail.categoryName ?? '-',
          ),
          _DetailRow(
            icon: Icons.assignment_outlined,
            label: 'Tenure',
            value: _tenure(detail.tenure),
          ),
          // The floor in words, composed by the server. The number alone printed "Floor 0" for a
          // ground floor and said the same thing for a mezzanine, which shares the number.
          if (detail.floorLabel != null)
            _DetailRow(icon: Icons.layers_outlined, label: 'Floor', value: detail.floorLabel!),
          if (rooms != null)
            _DetailRow(icon: Icons.king_bed_outlined, label: 'Rooms', value: rooms),
          _DetailRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: detail.location ?? '-',
          ),
          if (detail.squareFt != null)
            _DetailRow(
              icon: Icons.square_foot_outlined,
              label: 'Size',
              value: '${detail.squareFt!.toStringAsFixed(0)} sq ft',
            ),
          _DetailRow(
            icon: Icons.apartment_outlined,
            label: 'Property',
            value: detail.propertyName ?? '-',
          ),
          _DetailRow(
            icon: Icons.domain_outlined,
            label: 'Estate',
            value: detail.estateName ?? '-',
            isLast: detail.lastOccupied == null,
          ),
          // Only for a unit standing empty. "Never occupied" is a different fact from a date, and
          // the server distinguishes them by sending null.
          if (!detail.occupied && detail.lastOccupied != null)
            _DetailRow(
              icon: Icons.history_outlined,
              label: 'Last let',
              value: _date(detail.lastOccupied),
              isLast: true,
            ),
        ],
      ),
    );
  }

  /// Beds and baths as one line, and nothing at all where the category does not allow bedrooms —
  /// an office or a stall has none, and "0 beds" of it would be wrong rather than empty.
  static String? _rooms(HouseDetailModel d) {
    final parts = <String>[
      if (d.beds != null) '${d.beds} bed${d.beds == 1 ? '' : 's'}',
      if (d.baths != null) '${d.baths} bath${d.baths == 1 ? '' : 's'}',
      if (d.ensuite != null && d.ensuite! > 0) '${d.ensuite} ensuite',
      if (d.dsq) 'DSQ',
      if (d.parking != null && d.parking! > 0) '${d.parking} parking',
    ];
    return parts.isEmpty ? null : parts.join(' · ');
  }

  static String _tenure(String? tenure) => switch (tenure) {
        'RENTAL' => 'Rental',
        'OWNED' => 'Owned',
        'BNB' => 'HODI Stays',
        _ => '-',
      };

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
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
  final OccupationModel occupation;

  const _TenantCard({required this.occupation});

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
                  child: Icon(
                    // An organisation is not a person, and initials on a limited company read as
                    // somebody's name. The server says which, so the glyph can say it too.
                    occupation.tenantIsOrganisation
                        ? Icons.business_outlined
                        : Icons.person_outline,
                    color: HodiColors.white,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      occupation.tenantName ?? '-',
                      style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (occupation.tenantPhone != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.phone_outlined, size: 13, color: HodiColors.textLight),
                          const SizedBox(width: 4),
                          Text(occupation.tenantPhone!, style: HodiTextStyles.bodySmall),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _TenantInfoRow(label: 'Occupied On', value: _date(occupation.occupiedOn)),
          _TenantInfoRow(label: 'Next Due', value: _date(occupation.nextDueOn)),
          _TenantInfoRow(label: 'Expires', value: _date(occupation.expiresOn)),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                // One column, one sign. Positive is arrears and negative is credit, so the tile
                // renames itself rather than printing a negative amount under "Arrears".
                child: _FinancialTile(
                  label: occupation.inCredit ? 'In Credit' : 'Arrears',
                  amount: occupation.rentOwed.abs(),
                  color: occupation.inArrears
                      ? HodiColors.errorStart
                      : HodiColors.successStart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FinancialTile(
                  label: 'Refundable',
                  amount: occupation.refundableDeposit,
                  color: HodiColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
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
  const _VacantCard();

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
