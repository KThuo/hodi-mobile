import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/filters/filter_button.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/permissions/permission_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/dashboard_provider.dart';
import 'widgets/summary_card.dart';
import 'widgets/property_performance.dart';
import 'widgets/cash_flow_analytics.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isAdmin =
        ref.watch(hasPermissionProvider(AppPermissions.dashboardView));
    final overallAsync = ref.watch(overallSummaryProvider);
    final monthlyAsync = ref.watch(monthlySummaryProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final selectedYear = ref.watch(selectedYearProvider);

    final userName =
        authState.user?.firstName ?? authState.user?.fullName ?? 'User';

    return Scaffold(
      backgroundColor: HodiColors.background,
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () async {
          ref.invalidate(overallSummaryProvider);
          ref.invalidate(monthlySummaryProvider);
        },
        child: CustomScrollView(
          slivers: [
            // Gradient header
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 16,
                  left: 20,
                  right: 20,
                  bottom: 24,
                ),
                decoration: const BoxDecoration(
                  // The app's one gradient, and it is deliberately the only one. Built from the ink
                  // rather than the brand: a navy that deepens toward blue reads as a header, where
                  // full brand-into-accent reads as a warning label. axis-m makes the same choice on
                  // its home screen for the same reason.
                  gradient: HodiGradients.header,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Hello, $userName',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: HodiColors.white,
                            ),
                          ),
                        ),
                        const _DashboardFilterButton(),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      authState.user?.estateName ?? (isAdmin ? 'Property Overview' : 'Your Dashboard'),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        color: HodiColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Quick Access
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _QuickAccessSection(isAdmin: isAdmin),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Overall summary cards
            overallAsync.when(
              data: (summary) {
                if (summary == null) {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }

                if (isAdmin) {
                  // Admin: Invoice, Payment, Expense, Arrears (2x2)
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.4,
                      children: [
                        SummaryCard(
                          label: 'Total Invoiced',
                          amount: summary.totalInvoice,
                          icon: Icons.receipt_long,
                          tone: HodiColors.primaryStart,
                        ),
                        SummaryCard(
                          label: 'Total Payments',
                          amount: summary.totalPayment,
                          icon: Icons.payments,
                          tone: HodiColors.successStart,
                        ),
                        SummaryCard(
                          label: 'Expenses',
                          amount: summary.totalExpense,
                          icon: Icons.account_balance_wallet,
                          tone: HodiColors.warningStart,
                        ),
                        SummaryCard(
                          label: 'Arrears',
                          amount: summary.totalArrears,
                          icon: Icons.warning_amber,
                          tone: HodiColors.errorStart,
                        ),
                      ],
                    ),
                  );
                }

                // Tenant: Invoice, Payment, Arrears
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.4,
                    children: [
                      SummaryCard(
                        label: 'Total Invoiced',
                        amount: summary.totalInvoice,
                        icon: Icons.receipt_long,
                        tone: HodiColors.primaryStart,
                      ),
                      SummaryCard(
                        label: 'Total Payments',
                        amount: summary.totalPayment,
                        icon: Icons.payments,
                        tone: HodiColors.successStart,
                      ),
                      SummaryCard(
                        label: 'Arrears',
                        amount: summary.totalArrears,
                        icon: Icons.warning_amber,
                        tone: HodiColors.errorStart,
                      ),
                    ],
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: HodiLoadingShimmer(itemCount: 2, itemHeight: 100),
              ),
              error: (e, _) => SliverToBoxAdapter(
                child: HodiErrorState(
                  message: 'Failed to load summary',
                  onRetry: () => ref.invalidate(overallSummaryProvider),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // Monthly section card
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: HodiColors.cardBackground,
                    borderRadius: HodiBorderRadius.card,
                    boxShadow: HodiShadows.cardLight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with month/year navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Monthly Summary',
                              style: HodiTextStyles.heading3),
                          _MonthYearNav(
                            month: selectedMonth,
                            year: selectedYear,
                            onPrevious: () =>
                                _navigateMonth(ref, selectedMonth, selectedYear, -1),
                            onNext: () =>
                                _navigateMonth(ref, selectedMonth, selectedYear, 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Admin-only: Property Performance + Cash Flow
                      if (isAdmin)
                        monthlyAsync.when(
                          data: (monthly) {
                            if (monthly == null) {
                              return const SizedBox.shrink();
                            }
                            return Column(
                              children: [
                                PropertyPerformance(summary: monthly),
                                const SizedBox(height: 16),
                                CashFlowAnalytics(summary: monthly),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                          loading: () => const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: HodiColors.primaryStart,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          error: (_, _) => const SizedBox.shrink(),
                        ),

                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  void _navigateMonth(WidgetRef ref, int month, int year, int delta) {
    var newMonth = month + delta;
    var newYear = year;
    if (newMonth > 12) {
      newMonth = 1;
      newYear++;
    } else if (newMonth < 1) {
      newMonth = 12;
      newYear--;
    }
    ref.read(selectedMonthProvider.notifier).set(newMonth);
    ref.read(selectedYearProvider.notifier).set(newYear);
  }
}

class _QuickAccessSection extends StatelessWidget {
  final bool isAdmin;

  const _QuickAccessSection({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    final items = isAdmin
        ? const [
            _QuickAccessItem(
              icon: Icons.people_outline,
              label: 'Tenants',
              path: '/more/tenants',
              tone: HodiColors.primaryStart,
            ),
            _QuickAccessItem(
              icon: Icons.receipt_long_outlined,
              label: 'Invoices',
              path: '/invoices',
              tone: HodiColors.warningStart,
            ),
            _QuickAccessItem(
              icon: Icons.speed_outlined,
              label: 'Metres',
              path: '/more/metres',
              tone: HodiColors.successStart,
            ),
          ]
        : const [
            _QuickAccessItem(
              icon: Icons.home_work_outlined,
              label: 'My Houses',
              path: '/houses',
              tone: HodiColors.primaryStart,
            ),
            _QuickAccessItem(
              icon: Icons.receipt_long_outlined,
              label: 'My Invoices',
              path: '/invoices',
              tone: HodiColors.warningStart,
            ),
            _QuickAccessItem(
              icon: Icons.payments_outlined,
              label: 'My Payments',
              path: '/payments',
              tone: HodiColors.successStart,
            ),
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Access', style: HodiTextStyles.heading3),
        const SizedBox(height: 12),
        Row(
          children: items
              .map((item) => Expanded(child: item))
              .toList()
            ..insert(1, const Expanded(flex: 0, child: SizedBox(width: 12)))
            ..insert(3, const Expanded(flex: 0, child: SizedBox(width: 12))),
        ),
      ],
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String path;

  /// Which shortcut this is, in colour — the icon and the wash behind it, nothing more.
  final Color tone;

  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.path,
    required this.tone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(path),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: HodiColors.cardBackground,
          borderRadius: HodiBorderRadius.card,
          boxShadow: HodiShadows.cardLight,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // 12% of the tone. Enough to group the glyph with its colour, not enough to shout.
                color: tone.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: tone, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: HodiTextStyles.labelBold.copyWith(
                color: HodiColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardFilterButton extends ConsumerWidget {
  const _DashboardFilterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterNotifier = ref.read(filterProvider.notifier);
    if (filterNotifier.isTenant) return const SizedBox.shrink();

    final filterState = ref.watch(filterProvider);

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.filter_list, color: HodiColors.white),
          onPressed: () => showFilterBottomSheet(context),
          tooltip: 'Filter',
        ),
        if (filterState.hasActiveFilter)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: HodiColors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

class _MonthYearNav extends StatelessWidget {
  final int month;
  final int year;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _MonthYearNav({
    required this.month,
    required this.year,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final monthName = DateFormat.MMM().format(DateTime(year, month));
    final now = DateTime.now();
    final isCurrentMonth = month == now.month && year == now.year;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPrevious,
          borderRadius: HodiBorderRadius.small,
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.chevron_left, size: 20, color: HodiColors.textMedium),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$monthName $year',
            style: HodiTextStyles.labelBold.copyWith(
              color: HodiColors.primaryStart,
            ),
          ),
        ),
        InkWell(
          onTap: isCurrentMonth ? null : onNext,
          borderRadius: HodiBorderRadius.small,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.chevron_right,
              size: 20,
              color: isCurrentMonth ? HodiColors.textLight : HodiColors.textMedium,
            ),
          ),
        ),
      ],
    );
  }
}
