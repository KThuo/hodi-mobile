import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/permissions/permission_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/dashboard_provider.dart';
import 'widgets/summary_card.dart';
import 'widgets/calendar_chart.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isAdmin =
        ref.watch(hasPermissionProvider(AppPermissions.dashboardView));
    final overallAsync = ref.watch(overallSummaryProvider);
    final monthlyAsync = ref.watch(monthlySummaryProvider);
    final calendarAsync = ref.watch(calendarDataProvider);

    final userName =
        authState.user?.firstName ?? authState.user?.name ?? 'User';

    return Scaffold(
      backgroundColor: HodiColors.background,
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () async {
          ref.invalidate(overallSummaryProvider);
          ref.invalidate(monthlySummaryProvider);
          ref.invalidate(calendarDataProvider);
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
                      SummaryCard(
                        label: 'Overpayments',
                        amount: summary.totalOverpayments,
                        icon: Icons.trending_up,
                        gradient: HodiGradients.warning,
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

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Monthly summary section
            if (isAdmin)
              monthlyAsync.when(
                data: (monthly) {
                  if (monthly == null) {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: HodiColors.cardBackground,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF667EEA)
                                  .withValues(alpha: 0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('This Month',
                                style: HodiTextStyles.heading3),
                            const SizedBox(height: 12),
                            _MonthlyRow(
                              label: 'Invoiced',
                              value: monthly.totalInvoice,
                            ),
                            _MonthlyRow(
                              label: 'Collected',
                              value: monthly.totalPayment,
                            ),
                            _MonthlyRow(
                              label: 'Arrears',
                              value: monthly.totalArrears,
                            ),
                            if (monthly.totalUnits != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Occupancy',
                                        style: HodiTextStyles.bodyMedium),
                                    Text(
                                      '${monthly.occupiedUnits ?? 0} / ${monthly.totalUnits} units',
                                      style: HodiTextStyles.labelBold,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                loading: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                error: (_, _) =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Calendar chart
            if (isAdmin)
              calendarAsync.when(
                data: (calendar) {
                  if (calendar == null) {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: CalendarChart(data: calendar),
                    ),
                  );
                },
                loading: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                error: (_, _) =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

class _MonthlyRow extends StatelessWidget {
  final String label;
  final double value;

  const _MonthlyRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: HodiTextStyles.bodyMedium),
          Text(
            'KES ${CurrencyFormatter.format(value)}',
            style: HodiTextStyles.currency.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
