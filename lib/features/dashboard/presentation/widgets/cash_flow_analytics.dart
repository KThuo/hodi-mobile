import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/dashboard_summary.dart';

class CashFlowAnalytics extends StatelessWidget {
  final DashboardSummary summary;

  const CashFlowAnalytics({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final netCashFlow = summary.totalPayment - summary.totalExpense;
    final isPositive = netCashFlow >= 0;
    final totalFlow = summary.totalPayment + summary.totalExpense;
    final inflowPercent = totalFlow > 0 ? summary.totalPayment / totalFlow : 0.5;

    return Container(
      padding: const EdgeInsets.all(16),
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
              const Icon(Icons.analytics, size: 20, color: HodiColors.primaryStart),
              const SizedBox(width: 8),
              Text('Cash Flow Analytics', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),

          // Net cash flow + badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  'KES ${CurrencyFormatter.format(netCashFlow.abs())}',
                  style: GoogleFonts.robotoMono(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: isPositive ? HodiColors.successStart : HodiColors.errorStart,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (isPositive ? HodiColors.successStart : HodiColors.errorStart)
                      .withValues(alpha: 0.12),
                  borderRadius: HodiBorderRadius.badge,
                ),
                child: Text(
                  isPositive ? 'Positive Flow' : 'Negative Flow',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isPositive ? HodiColors.successStart : HodiColors.errorStart,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Net Cash Flow', style: HodiTextStyles.bodySmall),

          const SizedBox(height: 16),

          // Cash In section
          _FlowRow(
            label: 'Payments',
            amount: summary.totalPayment,
            color: HodiColors.successStart,
            icon: Icons.arrow_downward,
          ),
          const SizedBox(height: 8),
          _FlowRow(
            label: 'Invoiced',
            amount: summary.totalInvoice,
            color: HodiColors.primaryStart,
            icon: Icons.receipt,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: HodiColors.divider),
          ),

          // Cash Out section
          _FlowRow(
            label: 'Expenses',
            amount: summary.totalExpense,
            color: HodiColors.errorStart,
            icon: Icons.arrow_upward,
          ),
          const SizedBox(height: 8),
          _FlowRow(
            label: 'Arrears',
            amount: summary.totalArrears,
            color: HodiColors.warningStart,
            icon: Icons.warning_amber,
          ),

          const SizedBox(height: 16),

          // Stacked bar: inflow vs outflow
          ClipRRect(
            borderRadius: HodiBorderRadius.full,
            child: SizedBox(
              height: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: (inflowPercent * 100).round().clamp(1, 99),
                    child: Container(color: HodiColors.successStart),
                  ),
                  Expanded(
                    flex: ((1 - inflowPercent) * 100).round().clamp(1, 99),
                    child: Container(color: HodiColors.errorStart),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Inflow', style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.successStart)),
              Text('Outflow', style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.errorStart)),
            ],
          ),
        ],
      ),
    );
  }
}

class _FlowRow extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;
  final IconData icon;

  const _FlowRow({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        Expanded(child: Text(label, style: HodiTextStyles.bodyMedium)),
        Text(
          'KES ${CurrencyFormatter.format(amount)}',
          style: HodiTextStyles.currency.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
