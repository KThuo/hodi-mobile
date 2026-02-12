import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../core/auth/providers/auth_provider.dart';
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
import 'widgets/collections_table.dart';
import 'widgets/payment_breakdown_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isAdmin =
        ref.watch(hasPermissionProvider(AppPermissions.dashboardView));
    final overallAsync = ref.watch(overallSummaryProvider);
    final monthlyAsync = ref.watch(monthlySummaryProvider);
    final collectionsAsync = ref.watch(collectionsProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final selectedYear = ref.watch(selectedYearProvider);

    final userName =
        authState.user?.firstName ?? authState.user?.name ?? 'User';

    return Scaffold(
      backgroundColor: HodiColors.background,
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () async {
          ref.invalidate(overallSummaryProvider);
          ref.invalidate(monthlySummaryProvider);
          ref.invalidate(collectionsProvider);
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
                  gradient: HodiGradients.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $userName',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: HodiColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isAdmin ? 'Property Overview' : 'Your Dashboard',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: HodiColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
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
                          amount: summary.totalRent,
                          icon: Icons.receipt_long,
                          gradient: HodiGradients.primary,
                        ),
                        SummaryCard(
                          label: 'Total Payments',
                          amount: summary.totalPayment,
                          icon: Icons.payments,
                          gradient: HodiGradients.success,
                        ),
                        SummaryCard(
                          label: 'Expenses',
                          amount: summary.totalExpense,
                          icon: Icons.account_balance_wallet,
                          gradient: HodiGradients.warning,
                        ),
                        SummaryCard(
                          label: 'Arrears',
                          amount: summary.totalArrears,
                          icon: Icons.warning_amber,
                          gradient: HodiGradients.error,
                        ),
                      ],
                    ),
                  );
                }

                // Tenant: Invoice, Payment, Arrears + PaymentBreakdownCard
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
                        amount: summary.totalRent,
                        icon: Icons.receipt_long,
                        gradient: HodiGradients.primary,
                      ),
                      SummaryCard(
                        label: 'Total Payments',
                        amount: summary.totalPayment,
                        icon: Icons.payments,
                        gradient: HodiGradients.success,
                      ),
                      SummaryCard(
                        label: 'Arrears',
                        amount: summary.totalArrears,
                        icon: Icons.warning_amber,
                        gradient: HodiGradients.error,
                      ),
                      PaymentBreakdownCard(summary: summary),
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

                      // Both roles: Collections table
                      collectionsAsync.when(
                        data: (payments) => CollectionsTable(
                          payments: payments,
                          isAdmin: isAdmin,
                        ),
                        loading: () => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: HodiColors.primaryStart,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        error: (e, _) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'Failed to load collections',
                              style: HodiTextStyles.bodyMedium
                                  .copyWith(color: HodiColors.errorStart),
                            ),
                          ),
                        ),
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
