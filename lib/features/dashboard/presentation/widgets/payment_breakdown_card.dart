import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/dashboard_summary.dart';

class PaymentBreakdownCard extends StatelessWidget {
  final DashboardSummary summary;

  const PaymentBreakdownCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final paymentOnInvoice = summary.totalPayment - summary.totalOverpayments;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: HodiColors.white.withValues(alpha: 0.2),
              borderRadius: HodiBorderRadius.small,
            ),
            child: const Icon(Icons.pie_chart, color: HodiColors.white, size: 20),
          ),
          const SizedBox(height: 12),
          _BreakdownRow(
            label: 'On Invoice',
            amount: paymentOnInvoice,
          ),
          const SizedBox(height: 4),
          _BreakdownRow(
            label: 'Overpayment',
            amount: summary.totalOverpayments,
          ),
          if ((summary.occupiedUnits ?? 0) > 0) ...[
            const SizedBox(height: 4),
            Text(
              '${summary.occupiedUnits} units',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final double amount;

  const _BreakdownRow({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
        Text(
          'KES ${CurrencyFormatter.format(amount)}',
          style: HodiTextStyles.currencySmall.copyWith(
            color: HodiColors.white,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
