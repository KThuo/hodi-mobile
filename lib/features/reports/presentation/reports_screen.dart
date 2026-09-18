import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/filters/filter_button.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/tenant_report_model.dart';
import '../providers/report_providers.dart';

/// Where every tenancy stands.
///
/// **The lens comes first, not the list.** `TenantReportController` puts it plainly: four hundred
/// tenancies is not a decision, "who owes, oldest first" is. So the screen opens on Owing, sorted
/// by balance, and the other lenses are one tap away.
///
/// There is no export. `/export` returns a spreadsheet and a phone is not where somebody builds
/// one — the browser has that button and this does not pretend to.
class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lens = ref.watch(tenantLensProvider);
    final async = ref.watch(tenantReportProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Tenancies', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search tenants...',
              onChanged: (v) =>
                  ref.read(tenantReportSearchProvider.notifier).set(v),
              onClear: () =>
                  ref.read(tenantReportSearchProvider.notifier).set(''),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                for (final l in TenantLens.values) ...[
                  _Chip(
                    label: l.label,
                    selected: lens == l,
                    onTap: () => ref.read(tenantLensProvider.notifier).set(l),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: async.when(
              loading: () =>
                  const HodiLoadingShimmer(itemCount: 5, itemHeight: 92),
              error: (e, _) => HodiErrorState(
                message: e is Exception
                    ? e.toString().replaceFirst('Exception: ', '')
                    : 'That report could not be loaded.',
                onRetry: () => ref.invalidate(tenantReportProvider),
              ),
              data: (page) {
                if (page == null || page.content.isEmpty) {
                  return HodiEmptyState(
                    icon: Icons.fact_check_outlined,
                    title: switch (lens) {
                      TenantLens.owing => 'Nobody owes anything',
                      TenantLens.credit => 'Nobody is in credit',
                      TenantLens.clear => 'Nobody is clear',
                      TenantLens.all => 'No tenancies',
                    },
                    subtitle: 'Nothing matches this selection',
                  );
                }

                return RefreshIndicator(
                  color: HodiColors.primaryStart,
                  onRefresh: () async => ref.invalidate(tenantReportProvider),
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      if (page.totals != null)
                        _Totals(page: page, totals: page.totals!),
                      for (final row in page.content) _TenancyRow(row: row),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// The server's aggregate over the rows returned.
///
/// **Said out loud when it is partial.** These are the totals of what came back, not of the whole
/// lens, and the property report card learnt the same lesson: a total covering part of a set,
/// presented as the set, is what somebody copies into a report.
class _Totals extends StatelessWidget {
  const _Totals({required this.page, required this.totals});

  final TenantReportPageModel page;
  final TenantReportTotalsModel totals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.all(18),
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
              Text(
                '${totals.tenancies} tenanc${totals.tenancies == 1 ? 'y' : 'ies'}',
                style: HodiTextStyles.heading3.copyWith(fontSize: 15),
              ),
              const Spacer(),
              if (totals.collectionRate != null)
                Text(
                  '${totals.collectionRate!.toStringAsFixed(1)}% collected',
                  style: HodiTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: totals.collectionRate! >= 80
                        ? HodiColors.successEnd
                        : HodiColors.warningEnd,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          _Line(label: 'Invoiced', amount: totals.invoicedAmount),
          _Line(
            label: 'Received',
            amount: totals.paidAmount,
            tone: HodiColors.successEnd,
          ),
          _Line(
            label: 'Arrears',
            amount: totals.arrears,
            tone: totals.arrears > 0 ? HodiColors.errorStart : null,
          ),
          _Line(label: 'Credit held', amount: totals.credit),
          const Divider(height: 18, color: HodiColors.divider),
          _Line(
            label: '${totals.owing} owing',
            amount: totals.accountBalance,
            tone: totals.accountBalance > 0 ? HodiColors.errorStart : null,
            bold: true,
          ),
          // Only when it is actually true. The report asks for the server's whole ceiling, so
          // for any normal estate these figures are the figures and there is nothing to qualify
          // — the old sentence ran under every report and read as a disclaimer on all of them.
          if (page.partial) ...[
            const SizedBox(height: 10),
            Text(
              'Largest ${page.content.length} of ${page.totalElements}. '
              'Filter by property to total the rest.',
              style: HodiTextStyles.bodySmall
                  .copyWith(fontSize: 11, color: HodiColors.textLight),
            ),
          ],
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
    required this.label,
    required this.amount,
    this.tone,
    this.bold = false,
  });

  final String label;
  final double amount;
  final Color? tone;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.textMedium,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(
              fontSize: bold ? 15 : 13,
              color: tone ?? HodiColors.textDark,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TenancyRow extends StatelessWidget {
  const _TenancyRow({required this.row});

  final TenantReportModel row;

  @override
  Widget build(BuildContext context) {
    final owes = row.owes;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        border: Border.all(color: HodiColors.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  row.tenantName,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    if (row.unit.isNotEmpty) row.unit,
                    if (row.propertyName != null) row.propertyName!,
                  ].join(' · '),
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (row.unpaidInvoices > 0) ...[
                  const SizedBox(height: 4),
                  Text(
                    // The age of the oldest is what decides whether this is a reminder or a call.
                    row.oldestUnpaid != null
                        ? '${row.unpaidInvoices} unpaid · oldest ${row.oldestUnpaid} days'
                        : '${row.unpaidInvoices} unpaid',
                    style: HodiTextStyles.bodySmall.copyWith(
                      fontSize: 11,
                      color: HodiColors.errorStart,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                // One column with a sign, named by which side of nought it falls.
                owes
                    ? 'KES ${CurrencyFormatter.format(row.accountBalance)}'
                    : row.inCredit
                        ? 'KES ${CurrencyFormatter.format(-row.accountBalance)}'
                        : 'Clear',
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 15,
                  color: owes
                      ? HodiColors.errorStart
                      : row.inCredit
                          ? HodiColors.successEnd
                          : HodiColors.textMedium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                owes ? 'owing' : row.inCredit ? 'in credit' : 'settled',
                style: HodiTextStyles.bodySmall
                    .copyWith(fontSize: 10, color: HodiColors.textLight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}
