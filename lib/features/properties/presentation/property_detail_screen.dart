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
import '../../../core/utils/currency_formatter.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';
import '../../invoices/domain/billing_period.dart';
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
                _QuickStatsGrid(detail: detail),
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

/// What the property *is* — units and tenancies. No money.
///
/// It carried Collected and Expenses tiles until the rent-collection card below grew into the
/// web's full layout, at which point the same two figures appeared twice on one screen, each
/// labelled with a month only one of them named. Two answers to one question is worse than one,
/// even when they agree.
class _QuickStatsGrid extends StatelessWidget {
  final PropertyDetailModel detail;

  const _QuickStatsGrid({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          // Tenancies, not occupied units. A unit is flagged occupied; a tenancy is a person with
          // terms and a balance. They agree in practice and are not the same count.
          child: _StatTile(
            icon: Icons.people_outline,
            iconColor: HodiColors.secondary,
            label: 'Tenancies',
            value: '${detail.tenancyCount}',
            subtitle: detail.tenures.map(_tenureLabel).join(' · '),
          ),
        ),
      ],
    );
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
  final String? subtitle;

  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.value,
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

// --- Rent Collection Progress ---

/// How a month's rent is being collected, and what is still owed.
///
/// **Laid out the way `hodi-f`'s `RentCollectionProgress.vue` lays it out**, minus the ring: the
/// same three months, the same bands in the same order, the same wording. Two screens describing
/// one month should not need translating between them.
///
/// **Every figure is read, not computed here** — they come from `property_reports`, which is where
/// the dashboard, the property report and the analytics charts read them too, so this card cannot
/// disagree with the screens beside it. The two exceptions are `paymentOnInvoice` and
/// `invoiceOverpayment`, derived on the model for the reason given there: subtracting them into
/// stored columns would destroy the totals they come out of.
class _RentCollectionCard extends ConsumerWidget {
  final String propertyId;

  const _RentCollectionCard({required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = ref.watch(propertyReportWindowProvider).value ?? const [];
    final chosen = ref.watch(effectiveReportPeriodProvider);
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
              Text('Rent Collection Progress',
                  style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),

          // Three months, not a picker. Previous, the billing month, next — which is the question
          // the card answers: is this month landing, did the last one, and has the next been
          // raised yet.
          if (window.length == 3 && chosen != null)
            _PeriodSelector(
              months: window,
              chosen: chosen,
              onSelect: (p) =>
                  ref.read(propertyReportPeriodProvider.notifier).set(p),
            ),

          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          reportAsync.when(
            data: (page) => page == null || page.nothingBilled
                ? _NothingBilled(month: chosen?.label)
                : _Figures(totals: page.totals!),
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
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

/// A month in which nothing was invoiced.
///
/// Said in a sentence rather than shown as a column of zeroes. Nought is a real answer; "nothing
/// invoiced" is not the same answer, and rendering it as a collection rate of zero would mark a
/// month red that nobody has been asked to pay for.
class _NothingBilled extends StatelessWidget {
  final String? month;

  const _NothingBilled({required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.event_busy_outlined, size: 18, color: HodiColors.textLight),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Nothing has been invoiced for ${month ?? 'this month'} yet, so there is nothing '
              'to collect against. Figures appear once the month is raised.',
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
            ),
          ),
        ],
      ),
    );
  }
}

class _Figures extends StatelessWidget {
  final PropertyReportTotalsModel totals;

  const _Figures({required this.totals});

  @override
  Widget build(BuildContext context) {
    // The server's own figure, so this card and the report agree to the decimal. Null means
    // nothing was charged, which the caller has already turned into the "nothing billed" state.
    final rate = totals.collectionRate ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CollectionProgressBar(percentage: rate),
        const SizedBox(height: 18),

        // The period's own charge, which is what the percentage above is a percentage of — not
        // the invoices' face value, which carries arrears brought forward inside it.
        _Band(
          label: 'Invoiced',
          amount: totals.chargedAmount,
          tone: _BandTone.neutral,
        ),
        const SizedBox(height: 10),

        // The four figures that explain the gap between what was billed and what settled it.
        _Pairs(
          rows: [
            ('Invoice Overpayment', totals.invoiceOverpayment),
            ('Payment on Invoice', totals.paymentOnInvoice),
            ('Credit (Top-up)', totals.topupAmount),
            ('Total Overpayment', totals.overpaymentAmount),
          ],
          // Held, not arisen — a running balance, and a different column from the four above it.
          // A property can hold a balance in a month where nothing arose at all, which is why the
          // web separates it with a rule rather than listing it among them.
          footer: ('Cumulative Credit Balance', totals.cumulativeCredit),
        ),
        const SizedBox(height: 10),

        _Band(
          label: 'Total Collected',
          amount: totals.paymentAmount,
          tone: _BandTone.good,
        ),
        const SizedBox(height: 8),
        _Band(
          label: 'Expenses',
          amount: totals.expenseAmount,
          tone: _BandTone.cost,
        ),
        const SizedBox(height: 8),
        _Band(
          label: 'Net Income',
          note: 'collected less expenses',
          amount: totals.netIncome,
          tone: totals.netIncome < 0 ? _BandTone.bad : _BandTone.good,
        ),
        const SizedBox(height: 8),
        // Owed at the end of the month, however old — a running balance, not the month's own.
        _Band(
          label: 'Arrears',
          amount: totals.closingArrears,
          tone: totals.closingArrears > 0 ? _BandTone.bad : _BandTone.neutral,
        ),

        // Only when there is some. Money gone rather than owed, so it is said under the arrears it
        // came out of rather than added into them.
        if (totals.forfeitedAmount > 0) ...[
          const SizedBox(height: 12),
          Text(
            '${CurrencyFormatter.format(totals.forfeitedAmount)} of arrears was forfeited when '
            'tenants vacated owing, and is no longer collectable.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
        ],
      ],
    );
  }
}

enum _BandTone { neutral, good, bad, cost }

/// One figure on its own line, tinted by what it means.
class _Band extends StatelessWidget {
  final String label;
  final String? note;
  final double amount;
  final _BandTone tone;

  const _Band({
    required this.label,
    required this.amount,
    required this.tone,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    final colour = switch (tone) {
      _BandTone.neutral => HodiColors.textDark,
      _BandTone.good => HodiColors.successEnd,
      _BandTone.bad => HodiColors.errorStart,
      _BandTone.cost => HodiColors.warningEnd,
    };
    final fill = switch (tone) {
      _BandTone.neutral => HodiColors.surfaceInset,
      _ => colour.withValues(alpha: 0.08),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: HodiBorderRadius.small,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: HodiTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: HodiColors.textDark,
                  ),
                ),
                if (note != null)
                  Text(
                    note!,
                    style: HodiTextStyles.bodySmall.copyWith(
                      fontSize: 11,
                      color: HodiColors.textLight,
                    ),
                  ),
              ],
            ),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(fontSize: 15, color: colour),
          ),
        ],
      ),
    );
  }
}

/// The four monthly credit figures, with the held balance ruled off below them.
class _Pairs extends StatelessWidget {
  final List<(String, double)> rows;
  final (String, double) footer;

  const _Pairs({required this.rows, required this.footer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.small,
        border: Border.all(color: HodiColors.divider),
      ),
      child: Column(
        children: [
          for (final (label, amount) in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: HodiTextStyles.bodySmall
                          .copyWith(color: HodiColors.textMedium),
                    ),
                  ),
                  HodiAmountText(
                    amount: amount,
                    style: HodiTextStyles.currencySmall.copyWith(
                      color: HodiColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          const Divider(height: 10, color: HodiColors.divider),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  footer.$1,
                  style: HodiTextStyles.bodySmall.copyWith(
                    color: HodiColors.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              HodiAmountText(
                amount: footer.$2,
                style: HodiTextStyles.currencySmall.copyWith(
                  color: HodiColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Previous, the billing month, next.
///
/// Three fixed months rather than a picker, as the web has them. An earlier pass here dropped
/// "next" on the reasoning that a report cannot report a month that has not happened — which was
/// wrong, and wrong in an interesting way: the middle month is the **billing** month, not the
/// calendar one, and past the invoice day the server is already raising invoices into the month
/// ahead. "Has next month been raised yet" is a real question with a real answer.
class _PeriodSelector extends StatelessWidget {
  final List<BillingPeriod> months;
  final BillingPeriod chosen;
  final ValueChanged<BillingPeriod> onSelect;

  const _PeriodSelector({
    required this.months,
    required this.chosen,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < months.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: _PeriodChip(
              // The month's name. The year is not on the chip — all three are within a month of
              // each other, so it would repeat on two of them and differ on one, which reads as a
              // difference that matters when it does not.
              label: months[i].label,
              isActive: months[i] == chosen,
              onTap: () => onSelect(months[i]),
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
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          gradient: isActive ? HodiGradients.primary : null,
          color: isActive ? null : HodiColors.surfaceInset,
          borderRadius: HodiBorderRadius.small,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: HodiTextStyles.bodySmall.copyWith(
            color: isActive ? HodiColors.white : HodiColors.textMedium,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
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
