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
import '../domain/property_detail_model.dart';
import '../providers/property_providers.dart';

class PropertyDetailScreen extends ConsumerWidget {
  final int propertyId;

  const PropertyDetailScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(propertyDetailProvider(propertyId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Property Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'Property not found');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _PropertyHeaderCard(detail: detail),
                const SizedBox(height: 16),
                _QuickStatsGrid(detail: detail),
                const SizedBox(height: 16),
                _RentCollectionCard(
                  detail: detail,
                  propertyId: propertyId,
                ),
                const SizedBox(height: 16),
                _AutomationSettingsCard(detail: detail),
                if (detail.paymentInstructions != null &&
                    detail.paymentInstructions!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _PaymentInstructionsCard(
                    instructions: detail.paymentInstructions!,
                  ),
                ],
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 4, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load details',
          onRetry: () => ref.invalidate(propertyDetailProvider(propertyId)),
        ),
      ),
    );
  }
}

// --- Gradient Header ---

class _PropertyHeaderCard extends StatelessWidget {
  final PropertyDetailModel detail;

  const _PropertyHeaderCard({required this.detail});

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
            child: const Icon(Icons.apartment_outlined,
                color: HodiColors.white, size: 28),
          ),
          const SizedBox(height: 14),
          Text(
            detail.name ?? 'Property',
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (detail.floors > 0)
                _HeaderBadge(
                  icon: Icons.layers_outlined,
                  text: '${detail.floors} Floor${detail.floors == 1 ? '' : 's'}',
                ),
              if (detail.floors > 0) const SizedBox(width: 8),
              HodiStatusBadge(
                text: detail.status ?? 'Unknown',
                type: detail.status == 'ACTIVE' ? BadgeType.success : BadgeType.warning,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Colors.white24),
          const SizedBox(height: 16),
          if (detail.location != null) ...[
            _ContactRow(
              icon: Icons.location_on_outlined,
              text: detail.location!,
            ),
            const SizedBox(height: 8),
          ],
          if (detail.adminMail != null) ...[
            _ContactRow(
              icon: Icons.email_outlined,
              text: detail.adminMail!,
            ),
            const SizedBox(height: 8),
          ],
          if (detail.adminPhone != null)
            _ContactRow(
              icon: Icons.phone_outlined,
              text: detail.adminPhone!,
            ),
        ],
      ),
    );
  }
}

class _HeaderBadge extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HeaderBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: HodiColors.white.withValues(alpha: 0.2),
        borderRadius: HodiBorderRadius.badge,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: HodiColors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 14, color: HodiColors.white.withValues(alpha: 0.7)),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white.withValues(alpha: 0.9),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// --- Quick Stats Grid ---

class _QuickStatsGrid extends StatelessWidget {
  final PropertyDetailModel detail;

  const _QuickStatsGrid({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatTile(
                icon: Icons.meeting_room_outlined,
                iconColor: HodiColors.primaryStart,
                label: 'Total Units',
                value: '${detail.units}',
                subtitle:
                    '${detail.occupiedUnits} occupied / ${detail.vacantUnits} vacant',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatTile(
                icon: Icons.payments_outlined,
                iconColor: HodiColors.successStart,
                label: 'Total Income',
                valueWidget: HodiAmountText(
                  amount: detail.totalCollection,
                  style: HodiTextStyles.currency.copyWith(fontSize: 14),
                ),
                subtitle: detail.monthName ?? '',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                icon: Icons.receipt_long_outlined,
                iconColor: HodiColors.errorStart,
                label: 'Total Expenses',
                valueWidget: HodiAmountText(
                  amount: detail.totalExpense,
                  style: HodiTextStyles.currency.copyWith(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatTile(
                icon: Icons.percent_outlined,
                iconColor: HodiColors.warningStart,
                label: 'Commission',
                value: '${detail.chargeableCommission.toStringAsFixed(1)}%',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String? value;
  final Widget? valueWidget;
  final String? subtitle;

  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.value,
    this.valueWidget,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
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
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: HodiBorderRadius.small,
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
          const SizedBox(height: 4),
          if (valueWidget != null)
            valueWidget!
          else
            Text(
              value ?? '-',
              style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
            ),
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: HodiTextStyles.bodySmall
                  .copyWith(fontSize: 10, color: HodiColors.textLight),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}

// --- Rent Collection Card ---

class _RentCollectionCard extends ConsumerWidget {
  final PropertyDetailModel detail;
  final int propertyId;

  const _RentCollectionCard({
    required this.detail,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(propertyDetailPeriodProvider);
    final activePeriod = selectedPeriod ?? detail.period ?? 'CURRENT';

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
                child: const Icon(Icons.account_balance_wallet_outlined,
                    color: HodiColors.successStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Rent Collection',
                  style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),

          // Period selector chips
          _PeriodSelector(
            activePeriod: activePeriod,
            previousLabel: detail.previousMonthName ?? 'Previous',
            currentLabel: detail.currentMonthName ?? 'Current',
            nextLabel: detail.nextMonthName ?? 'Next',
            onSelect: (period) {
              ref.read(propertyDetailPeriodProvider.notifier).set(period);
            },
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          // Collection percentage
          _CollectionProgressBar(percentage: detail.collectionPercentage),
          const SizedBox(height: 16),

          // Financial breakdown
          _FinancialRow(
            label: 'Invoice Amount',
            amount: detail.totalInvoiced,
            isBold: true,
          ),
          _FinancialRow(
            label: 'Total Collected',
            amount: detail.totalCollection,
            color: HodiColors.successStart,
            isBold: true,
          ),
          _FinancialRow(
            label: 'Arrears',
            amount: detail.totalArrears,
            color: detail.totalArrears > 0 ? HodiColors.errorStart : null,
            isBold: true,
          ),

          const SizedBox(height: 8),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 12),

          // Detail rows
          _FinancialRow(
            label: 'Payment on Invoice',
            amount: detail.paymentOnInvoice,
          ),
          _FinancialRow(
            label: 'Invoice Overpayment',
            amount: detail.invoiceOverpayment,
          ),
          _FinancialRow(
            label: 'Credit (Top-up)',
            amount: detail.totalTopup,
          ),
          _FinancialRow(
            label: 'Total Overpayment',
            amount: detail.totalOverpayment,
          ),
          _FinancialRow(
            label: 'Cumulative Credit Balance',
            amount: detail.cumulativeOverpayment,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _PeriodSelector extends StatelessWidget {
  final String activePeriod;
  final String previousLabel;
  final String currentLabel;
  final String nextLabel;
  final ValueChanged<String> onSelect;

  const _PeriodSelector({
    required this.activePeriod,
    required this.previousLabel,
    required this.currentLabel,
    required this.nextLabel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PeriodChip(
            label: previousLabel,
            isActive: activePeriod == 'PREVIOUS',
            onTap: () => onSelect('PREVIOUS'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _PeriodChip(
            label: currentLabel,
            isActive: activePeriod == 'CURRENT',
            onTap: () => onSelect('CURRENT'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _PeriodChip(
            label: nextLabel,
            isActive: activePeriod == 'NEXT',
            onTap: () => onSelect('NEXT'),
          ),
        ),
      ],
    );
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _PeriodChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: isActive ? HodiGradients.primary : null,
          color: isActive ? null : HodiColors.surfaceLight,
          borderRadius: HodiBorderRadius.small,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: HodiTextStyles.bodySmall.copyWith(
            color: isActive ? HodiColors.white : HodiColors.textMedium,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _CollectionProgressBar extends StatelessWidget {
  final double percentage;

  const _CollectionProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    final clampedPct = percentage.clamp(0, 100).toDouble();
    final color = clampedPct >= 80
        ? HodiColors.successStart
        : clampedPct >= 50
            ? HodiColors.warningStart
            : HodiColors.errorStart;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Collection Rate',
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
            Text(
              '${clampedPct.toStringAsFixed(1)}%',
              style: HodiTextStyles.labelBold.copyWith(color: color),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: HodiBorderRadius.full,
          child: LinearProgressIndicator(
            value: clampedPct / 100,
            minHeight: 8,
            backgroundColor: HodiColors.surfaceLight,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _FinancialRow extends StatelessWidget {
  final String label;
  final double amount;
  final Color? color;
  final bool isBold;
  final bool isLast;

  const _FinancialRow({
    required this.label,
    required this.amount,
    this.color,
    this.isBold = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.textMedium,
                fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currencySmall.copyWith(
              color: color ?? HodiColors.textDark,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Automation Settings Card ---

class _AutomationSettingsCard extends StatelessWidget {
  final PropertyDetailModel detail;

  const _AutomationSettingsCard({required this.detail});

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
                  color: HodiColors.secondary.withValues(alpha: 0.1),
                  borderRadius: HodiBorderRadius.small,
                ),
                child: const Icon(Icons.settings_outlined,
                    color: HodiColors.secondary, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Automation Settings',
                  style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          _SettingRow(
            icon: Icons.receipt_outlined,
            label: 'Invoice auto-gen',
            value: detail.invoiceDay != null
                ? 'Day ${detail.invoiceDay}'
                : 'Not configured',
            isConfigured: detail.invoiceDay != null,
          ),
          const SizedBox(height: 12),
          _SettingRow(
            icon: Icons.receipt_long_outlined,
            label: 'Expense auto-gen',
            value: detail.expenseDay != null
                ? 'Day ${detail.expenseDay}'
                : 'Not configured',
            isConfigured: detail.expenseDay != null,
          ),
        ],
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isConfigured;

  const _SettingRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.isConfigured,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: HodiColors.textLight),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
          ),
        ),
        Text(
          value,
          style: HodiTextStyles.bodyMedium.copyWith(
            color: isConfigured ? HodiColors.textDark : HodiColors.textLight,
            fontWeight: isConfigured ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// --- Payment Instructions Card ---

class _PaymentInstructionsCard extends StatelessWidget {
  final String instructions;

  const _PaymentInstructionsCard({required this.instructions});

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
                child: const Icon(Icons.info_outline,
                    color: HodiColors.warningStart, size: 18),
              ),
              const SizedBox(width: 10),
              Text('Payment Instructions',
                  style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          Text(
            instructions,
            style: HodiTextStyles.bodyMedium.copyWith(
              color: HodiColors.textDark,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
