import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../../core/widgets/hodi_empty_state.dart';
import '../../../../core/widgets/hodi_error_state.dart';
import '../../domain/tenant_model.dart';
import '../../providers/tenant_providers.dart';

class TenantUnitsTab extends ConsumerWidget {
  final String userId;

  const TenantUnitsTab({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsAsync = ref.watch(tenantUnitsProvider(userId));

    return unitsAsync.when(
      data: (units) {
        if (units.isEmpty) {
          return const HodiEmptyState(
            icon: Icons.home_outlined,
            title: 'No Units Found',
            subtitle: 'This tenant has no occupied units',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: units.length,
          itemBuilder: (context, index) => _UnitItem(
            unit: units[index],
            onTap: () {
              if (units[index].houseId != null) {
                context.push('/houses/${units[index].houseId}');
              }
            },
          ),
        );
      },
      loading: () => const HodiLoadingShimmer(),
      error: (e, _) => HodiErrorState(
        message: e is Exception
            ? e.toString().replaceFirst('Exception: ', '')
            : 'Failed to load units',
        onRetry: () => ref.invalidate(tenantUnitsProvider(userId)),
      ),
    );
  }
}

class _UnitItem extends StatelessWidget {
  final TenantModel unit;
  final VoidCallback? onTap;

  const _UnitItem({required this.unit, this.onTap});

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
                  unit.houseName ?? unit.houseCode ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (unit.category != null)
                Text(unit.category!, style: HodiTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.apartment_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(unit.property ?? '-', style: HodiTextStyles.bodySmall),
              if (unit.houseType != null) ...[
                const SizedBox(width: 12),
                const Icon(Icons.home_outlined, size: 14, color: Color(0xFF9CA3AF)),
                const SizedBox(width: 4),
                Text(unit.houseType!, style: HodiTextStyles.bodySmall),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: unit.rentOwed,
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 15,
                  color: unit.hasDebt
                      ? HodiColors.errorStart
                      : unit.hasCredit
                          ? HodiColors.successStart
                          : HodiColors.textDark,
                ),
              ),
              if (unit.dueDate != null)
                Text(unit.dueDate!, style: HodiTextStyles.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
