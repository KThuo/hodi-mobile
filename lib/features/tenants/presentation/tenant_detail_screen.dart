import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../domain/tenant_detail_model.dart';
import '../providers/tenant_providers.dart';
import 'widgets/tenant_units_tab.dart';
import 'widgets/tenant_invoices_tab.dart';
import 'widgets/tenant_payments_tab.dart';

class TenantDetailScreen extends ConsumerWidget {
  final String userId;

  const TenantDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(tenantDetailProvider(userId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Tenant Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'Tenant not found');
          }
          return _TenantDetailContent(detail: detail, userId: userId);
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load tenant details',
          onRetry: () => ref.invalidate(tenantDetailProvider(userId)),
        ),
      ),
    );
  }
}

class _TenantDetailContent extends StatelessWidget {
  final TenantDetailModel detail;
  final String userId;

  const _TenantDetailContent({required this.detail, required this.userId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _PersonalInfoCard(detail: detail),
                  const SizedBox(height: 16),
                  if (detail.content != null)
                    _FinancialOverviewCard(summary: detail.content!),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                labelColor: HodiColors.primaryStart,
                unselectedLabelColor: HodiColors.textLight,
                indicatorColor: HodiColors.primaryStart,
                indicatorWeight: 3,
                labelStyle: HodiTextStyles.label.copyWith(fontWeight: FontWeight.w600),
                unselectedLabelStyle: HodiTextStyles.label,
                tabs: const [
                  Tab(text: 'Units'),
                  Tab(text: 'Invoices'),
                  Tab(text: 'Payments'),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          children: [
            TenantUnitsTab(userId: userId),
            TenantInvoicesTab(userId: userId),
            TenantPaymentsTab(userId: userId),
          ],
        ),
      ),
    );
  }
}

class _PersonalInfoCard extends StatelessWidget {
  final TenantDetailModel detail;

  const _PersonalInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: HodiColors.white.withValues(alpha: 0.2),
                    borderRadius: HodiBorderRadius.small,
                  ),
                  child: const Icon(Icons.person, color: HodiColors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    detail.name ?? '-',
                    style: HodiTextStyles.heading3.copyWith(color: HodiColors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (detail.email != null)
              _ContactRow(icon: Icons.email_outlined, value: detail.email!),
            if (detail.phone != null)
              _ContactRow(icon: Icons.phone_outlined, value: detail.phone!),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _ContactRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: HodiColors.white.withValues(alpha: 0.8)),
          const SizedBox(width: 10),
          Text(
            value,
            style: HodiTextStyles.bodyMedium.copyWith(
              color: HodiColors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinancialOverviewCard extends StatelessWidget {
  final TenantFinancialSummary summary;

  const _FinancialOverviewCard({required this.summary});

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
          Text('Financial Overview', style: HodiTextStyles.heading3),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _MetricTile(
                  label: 'Total Rent',
                  amount: summary.totalRent,
                  color: HodiColors.primaryStart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricTile(
                  label: 'Total Arrears',
                  amount: summary.totalArrears,
                  color: summary.totalArrears > 0
                      ? HodiColors.errorStart
                      : HodiColors.successStart,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MetricTile(
                  label: 'Total Payments',
                  amount: summary.totalPayment,
                  color: HodiColors.successStart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _UnitCountTile(count: summary.occupiedUnits),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _MetricTile({
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

class _UnitCountTile extends StatelessWidget {
  final int count;

  const _UnitCountTile({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: HodiColors.primaryStart.withValues(alpha: 0.08),
        borderRadius: HodiBorderRadius.small,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Occupied Units',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 6),
          Text(
            count.toString(),
            style: HodiTextStyles.currency.copyWith(
              fontSize: 14,
              color: HodiColors.primaryStart,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: HodiColors.background,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
