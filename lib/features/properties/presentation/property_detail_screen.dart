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
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/utils/date_formatter.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';
import '../providers/property_providers.dart';

/// One property.
///
/// Two reads behind two authorities. `GET /properties/{id}` is the property — what it is, who to
/// call, how it is set up — and anybody with `ROLE_PROPERTY_VIEW` may have it. The money is a
/// report, behind `ROLE_REPORT_VIEW`, and the card carrying it is not rendered at all for somebody
/// who does not hold that: a caretaker can be trusted with the block without being trusted with
/// what it collects.
class PropertyDetailScreen extends ConsumerWidget {
  final String propertyId;

  const PropertyDetailScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(propertyDetailProvider(propertyId));
    final canSeeMoney = ref.watch(authProvider).user?.hasPermission(
              AppPermissions.reportView,
            ) ??
        false;

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
                _QuickStatsGrid(detail: detail, propertyId: propertyId),
                if (canSeeMoney) ...[
                  const SizedBox(height: 16),
                  _RentCollectionCard(propertyId: propertyId),
                ],
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
            detail.name,
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((detail.floors ?? 0) > 0) ...[
                _HeaderBadge(
                  icon: Icons.layers_outlined,
                  text: '${detail.floors} Floor${detail.floors == 1 ? '' : 's'}',
                ),
                const SizedBox(width: 8),
              ],
              // An integer now, not a word. 1 is active, 0 inactive, 2 deleted — and 2 is the
              // same integer an invoice uses for PAID, which is why this reads the record
              // lifecycle explicitly rather than testing a bare number somewhere else.
              HodiStatusBadge(
                text: switch (detail.status) {
                  1 => 'Active',
                  0 => 'Inactive',
                  2 => 'Deleted',
                  _ => 'Unknown',
                },
                type: detail.status == 1 ? BadgeType.success : BadgeType.warning,
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
          if (detail.contactName != null) ...[
            _ContactRow(
              icon: Icons.person_outline,
              text: detail.contactName!,
            ),
            const SizedBox(height: 8),
          ],
          if (detail.email != null) ...[
            _ContactRow(
              icon: Icons.email_outlined,
              text: detail.email!,
            ),
            const SizedBox(height: 8),
          ],
          if (detail.phone != null)
            _ContactRow(
              icon: Icons.phone_outlined,
              text: detail.phone!,
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

/// Units and tenancies from the property; income and expense from the month's report.
///
/// The two halves come from different reads, so the money tiles carry their own loading and their
/// own empty state. A property that was not invoiced last month has no report row at all, and the
/// tile says so rather than printing a confident zero.
class _QuickStatsGrid extends ConsumerWidget {
  final PropertyDetailModel detail;
  final String propertyId;

  const _QuickStatsGrid({required this.detail, required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canSeeMoney = ref.watch(authProvider).user?.hasPermission(
              AppPermissions.reportView,
            ) ??
        false;
    final reportAsync =
        canSeeMoney ? ref.watch(propertyReportProvider(propertyId)) : null;
    final report = reportAsync?.value;

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
              // Tenancies, not occupied units. A unit is flagged occupied; a tenancy is a person
              // with terms and a balance. They agree in practice and are not the same count.
              child: _StatTile(
                icon: Icons.people_outline,
                iconColor: HodiColors.secondary,
                label: 'Tenancies',
                value: '${detail.tenancyCount}',
                subtitle: detail.tenures.map(_tenureLabel).join(' · '),
              ),
            ),
          ],
        ),
        if (canSeeMoney) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatTile(
                  icon: Icons.payments_outlined,
                  iconColor: HodiColors.successStart,
                  label: 'Collected',
                  valueWidget: report == null
                      ? null
                      : HodiAmountText(
                          amount: report.paymentAmount,
                          style: HodiTextStyles.currency.copyWith(fontSize: 14),
                        ),
                  value: report == null ? _pending(reportAsync) : null,
                  subtitle: report == null ? '' : _periodLabel(report),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatTile(
                  icon: Icons.receipt_long_outlined,
                  iconColor: HodiColors.errorStart,
                  label: 'Expenses',
                  valueWidget: report == null
                      ? null
                      : HodiAmountText(
                          amount: report.expenseAmount,
                          style: HodiTextStyles.currency.copyWith(fontSize: 14),
                        ),
                  value: report == null ? _pending(reportAsync) : null,
                  subtitle: report == null
                      ? ''
                      : '${report.expenseCount} recorded',
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  /// Three states and three different things to say: still asking, asked and refused, asked and
  /// there was no such month. A dash for all three would hide the difference.
  static String _pending(AsyncValue<PropertyReportModel?>? async) {
    if (async == null) return '-';
    return async.when(
      data: (_) => 'No data',
      loading: () => '…',
      error: (_, _) => 'Unavailable',
    );
  }

  static String _periodLabel(PropertyReportModel r) {
    final when = DateTime(r.periodYear, r.periodMonth);
    return DateFormatter.formatMonthYear(when);
  }

  static String _tenureLabel(String tenure) => switch (tenure) {
        'RENTAL' => 'Rental',
        'OWNED' => 'Owned',
        'BNB' => 'Short stay',
        _ => tenure,
      };
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

/// The property's month.
///
/// Every figure here is the report's, and the report is a projection over invoices, payments and
/// expenses rather than a stored total — so the rows below reconcile with each other by
/// construction and are shown in an order that lets somebody add them up:
///
///   charged + brought forward + credits and adjustments = invoiced
///
/// The legacy screen showed "Invoice Amount" and "Total Collected" next to each other with the
/// carried arrears invisible between them, which is why the same property could read as collecting
/// well under 100% in a month it had settled everything raised.
class _RentCollectionCard extends ConsumerWidget {
  final String propertyId;

  const _RentCollectionCard({required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(propertyReportPeriodProvider);
    final reportAsync = ref.watch(propertyReportProvider(propertyId));

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

          _PeriodSelector(
            active: period,
            onSelect: (p) =>
                ref.read(propertyReportPeriodProvider.notifier).set(p),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          reportAsync.when(
            data: (report) =>
                report == null ? const _NoMonth() : _Figures(report: report),
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                e is Exception
                    ? e.toString().replaceFirst('Exception: ', '')
                    : 'Could not read the month',
                style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.errorStart),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A month in which nothing was invoiced and nothing arrived.
///
/// Said in a sentence rather than shown as a column of zeroes, because a zero in a money field
/// reads as "nothing owed" when the truth here is "this property was not billed that month".
class _NoMonth extends StatelessWidget {
  const _NoMonth();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Icon(Icons.event_busy_outlined, size: 18, color: HodiColors.textLight),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Nothing was invoiced for this property in that month.',
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
            ),
          ),
        ],
      ),
    );
  }
}

class _Figures extends StatelessWidget {
  final PropertyReportModel report;

  const _Figures({required this.report});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CollectionProgressBar(percentage: report.collectionPercentage),
        const SizedBox(height: 16),

        // What was asked for, and what it is made of. The three components below the total add
        // up to it exactly — the server computes the last as the remainder so they cannot drift.
        _FinancialRow(
          label: 'Invoiced',
          amount: report.invoiceAmount,
          isBold: true,
        ),
        _FinancialRow(label: 'Charged this month', amount: report.chargedAmount),
        _FinancialRow(
          label: 'Brought forward',
          amount: report.broughtForwardAmount,
        ),
        _FinancialRow(
          label: 'Credits & adjustments',
          amount: report.creditsAndAdjustments,
          color: report.creditsAndAdjustments < 0 ? HodiColors.textMedium : null,
        ),

        const SizedBox(height: 8),
        const Divider(height: 1, color: HodiColors.divider),
        const SizedBox(height: 12),

        // What the charge was made of. Rent is the rent here — the legacy report labelled the
        // whole charge "Rent" and put "Utilities" beside it, which read as two siblings when the
        // second is inside the first.
        _FinancialRow(label: 'Rent', amount: report.rentAmount),
        if (report.serviceChargeAmount != 0)
          _FinancialRow(label: 'Service charge', amount: report.serviceChargeAmount),
        _FinancialRow(label: 'Utilities', amount: report.utilityAmount),
        if (report.depositAmount != 0)
          _FinancialRow(label: 'Deposits', amount: report.depositAmount),

        const SizedBox(height: 8),
        const Divider(height: 1, color: HodiColors.divider),
        const SizedBox(height: 12),

        _FinancialRow(
          label: 'Received',
          amount: report.paymentAmount,
          color: HodiColors.successStart,
          isBold: true,
        ),
        _FinancialRow(label: 'Expenses', amount: report.expenseAmount),
        _FinancialRow(
          label: 'Net income',
          amount: report.netIncome,
          color: report.netIncome < 0 ? HodiColors.errorStart : null,
          isBold: true,
        ),

        const SizedBox(height: 8),
        const Divider(height: 1, color: HodiColors.divider),
        const SizedBox(height: 12),

        // Opening and closing together, so the month reconciles on screen rather than inviting
        // somebody to work out which of the two "Arrears" meant.
        _FinancialRow(label: 'Opening arrears', amount: report.openingArrears),
        _FinancialRow(
          label: 'Closing arrears',
          amount: report.closingArrears,
          color: report.closingArrears > 0 ? HodiColors.errorStart : null,
          isBold: true,
        ),
        _FinancialRow(label: 'Credit arising', amount: report.overpaymentAmount),
        _FinancialRow(label: 'Credit held', amount: report.cumulativeCredit),
        if (report.forfeitedAmount != 0)
          _FinancialRow(label: 'Forfeited', amount: report.forfeitedAmount),
        // Null is "HODI has not invoiced that month yet", which is not a commission of zero.
        if (report.commissionAmount != null)
          _FinancialRow(
            label: report.commissionPercent == null
                ? 'Commission'
                : 'Commission (${report.commissionPercent!.toStringAsFixed(1)}%)',
            amount: report.commissionAmount!,
            isLast: true,
          ),
      ],
    );
  }
}

/// Which month to report on.
///
/// Three real months ending with the one just gone, and no "Next". Legacy offered one, because
/// its figures came off the property row and a future month simply read as zeroes; the report
/// cannot report a month that has not happened, and offering it would be offering an empty answer.
class _PeriodSelector extends StatelessWidget {
  final ReportPeriod active;
  final ValueChanged<ReportPeriod> onSelect;

  const _PeriodSelector({required this.active, required this.onSelect});

  /// The month just ended, which is what the server defaults to and so what "Latest" selects.
  static DateTime get _latest {
    final now = DateTime.now();
    return DateTime(now.year, now.month - 1);
  }

  @override
  Widget build(BuildContext context) {
    final months = [
      DateTime(_latest.year, _latest.month - 2),
      DateTime(_latest.year, _latest.month - 1),
      _latest,
    ];

    return Row(
      children: [
        for (var i = 0; i < months.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: _PeriodChip(
              label: DateFormatter.formatMonthYear(months[i]).split(' ').first,
              // The most recent chip is also what an unset period resolves to, so it reads as
              // selected on arrival rather than leaving all three looking untouched.
              isActive: active.isLatest
                  ? i == months.length - 1
                  : active.year == months[i].year && active.month == months[i].month,
              onTap: () => onSelect(
                ReportPeriod(year: months[i].year, month: months[i].month),
              ),
            ),
          ),
        ],
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
                child: Icon(Icons.settings_outlined,
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
            value: detail.invoiceGenerationDay != null
                ? 'Day ${detail.invoiceGenerationDay}'
                : 'Not configured',
            isConfigured: detail.invoiceGenerationDay != null,
          ),
          const SizedBox(height: 12),
          _SettingRow(
            icon: Icons.receipt_long_outlined,
            label: 'Expense auto-gen',
            value: detail.expenseGenerationDay != null
                ? 'Day ${detail.expenseGenerationDay}'
                : 'Not configured',
            isConfigured: detail.expenseGenerationDay != null,
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

  static final _boldPattern = RegExp(r'bold-([^-]+)-bold');

  List<TextSpan> _parseInstructions(String text, TextStyle baseStyle) {
    final spans = <TextSpan>[];
    var lastEnd = 0;

    for (final match in _boldPattern.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: baseStyle.copyWith(fontWeight: FontWeight.w700),
      ));
      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = HodiTextStyles.bodyMedium.copyWith(
      color: HodiColors.textDark,
      height: 1.5,
    );

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
          SizedBox(
            width: double.infinity,
            child: Text.rich(
              TextSpan(
                style: baseStyle,
                children: _parseInstructions(instructions, baseStyle),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
