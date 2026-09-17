import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../invoices/presentation/widgets/invoice_list_item.dart';
import '../../payments/presentation/widgets/payment_list_item.dart';
import '../domain/occupation_model.dart';
import '../domain/tenancy_balance_model.dart';
import '../providers/occupation_providers.dart';

/// One tenancy: what is owed, what was billed, what was paid.
///
/// The balance is at the top because *what do I owe* is the question somebody opens this screen
/// to answer, and answering it above the tabs saves them reading an invoice list to work it out.
///
/// [occupation] arrives with the tap and may be null when the screen is opened cold — there is no
/// `GET /occupations/{id}` to fetch a single tenancy back from. The balance read carries the unit
/// code and the tenant's name, so the header stands on its own either way; the terms below it are
/// what the list row adds.
class OccupationDetailScreen extends ConsumerWidget {
  final String occupationId;
  final OccupationModel? occupation;

  const OccupationDetailScreen({
    super.key,
    required this.occupationId,
    this.occupation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(tenancyBalanceProvider(occupationId));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HodiColors.background,
        appBar: HodiAppBar(title: occupation?.displayName ?? 'My House'),
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    balanceAsync.when(
                      data: (balance) => _BalanceCard(
                        balance: balance,
                        occupation: occupation,
                      ),
                      loading: () =>
                          const HodiLoadingShimmer(itemCount: 1, itemHeight: 160),
                      error: (e, _) => HodiErrorState(
                        message: e is Exception
                            ? e.toString().replaceFirst('Exception: ', '')
                            : 'Could not read the balance',
                        onRetry: () =>
                            ref.invalidate(tenancyBalanceProvider(occupationId)),
                      ),
                    ),
                    if (occupation != null) ...[
                      const SizedBox(height: 16),
                      _TermsCard(occupation: occupation!),
                    ],
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarHeader(
                TabBar(
                  labelColor: HodiColors.primaryStart,
                  unselectedLabelColor: HodiColors.textLight,
                  indicatorColor: HodiColors.primaryStart,
                  labelStyle: HodiTextStyles.labelBold,
                  tabs: const [
                    Tab(text: 'Invoices'),
                    Tab(text: 'Payments'),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              _InvoicesTab(occupationId: occupationId),
              _PaymentsTab(occupationId: occupationId),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarHeader extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarHeader(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(color: HodiColors.background, child: tabBar);
  }

  @override
  bool shouldRebuild(_TabBarHeader oldDelegate) => oldDelegate.tabBar != tabBar;
}

// --- Balance ---

class _BalanceCard extends StatelessWidget {
  final TenancyBalanceModel? balance;
  final OccupationModel? occupation;

  const _BalanceCard({required this.balance, required this.occupation});

  @override
  Widget build(BuildContext context) {
    final outstanding = balance?.outstanding ?? occupation?.rentOwed ?? 0;
    final credit = balance?.creditInHand ?? 0;
    final settled = outstanding <= 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: settled ? HodiGradients.success : HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Column(
        children: [
          Text(
            settled ? 'Nothing outstanding' : 'Outstanding balance',
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 6),
          HodiAmountText(
            amount: outstanding.abs(),
            style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
          ),
          // Credit held is shown beside what is owed rather than netted off it. "You owe 4,000
          // and we are holding 1,000" is two facts, and a single difference loses one of them.
          if (credit > 0) ...[
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.white24),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.savings_outlined,
                  size: 14,
                  color: HodiColors.white.withValues(alpha: 0.8),
                ),
                const SizedBox(width: 6),
                Text(
                  'Credit held',
                  style: HodiTextStyles.bodySmall.copyWith(
                    color: HodiColors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(width: 8),
                HodiAmountText(
                  amount: credit,
                  style: HodiTextStyles.currency.copyWith(
                    fontSize: 14,
                    color: HodiColors.white,
                  ),
                ),
              ],
            ),
          ],
          if ((balance?.invoices.length ?? 0) > 0) ...[
            const SizedBox(height: 10),
            Text(
              '${balance!.invoices.length} unsettled '
              'invoice${balance!.invoices.length == 1 ? '' : 's'}',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.white.withValues(alpha: 0.75),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// --- Terms ---

class _TermsCard extends StatelessWidget {
  final OccupationModel occupation;

  const _TermsCard({required this.occupation});

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
          Text('Tenancy', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 14),
          _Row(label: 'Unit', value: occupation.displayName),
          if (occupation.propertyName != null)
            _Row(label: 'Property', value: occupation.propertyName!),
          _RowAmount(label: 'Rent', amount: occupation.rent),
          if (occupation.refundableDeposit > 0)
            _RowAmount(label: 'Refundable deposit', amount: occupation.refundableDeposit),
          _Row(label: 'Occupied on', value: _date(occupation.occupiedOn)),
          _Row(label: 'Next due', value: _date(occupation.nextDueOn)),
          // Null is a periodic tenancy with no agreed end, which is not the same as an expiry
          // nobody has recorded — so the row is absent rather than showing a dash.
          if (occupation.expiresOn != null)
            _Row(
              label: 'Expires',
              value: _date(occupation.expiresOn),
              // Negative days are normal: a periodic tenancy that ran past its first term.
              note: (occupation.daysToExpiry ?? 0) < 0
                  ? 'term passed'
                  : occupation.daysToExpiry != null
                      ? 'in ${occupation.daysToExpiry} days'
                      : null,
            ),
          if (occupation.noticeDays != null)
            _Row(label: 'Notice required', value: '${occupation.noticeDays} days', isLast: true),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final String? note;
  final bool isLast;

  const _Row({
    required this.label,
    required this.value,
    this.note,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: HodiTextStyles.bodyMedium.copyWith(
                    color: HodiColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
                if (note != null)
                  Text(
                    note!,
                    style: HodiTextStyles.bodySmall.copyWith(
                      color: HodiColors.textLight,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RowAmount extends StatelessWidget {
  final String label;
  final double amount;

  const _RowAmount({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: HodiAmountText(
                amount: amount,
                style: HodiTextStyles.currency.copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Tabs ---

class _InvoicesTab extends ConsumerWidget {
  final String occupationId;

  const _InvoicesTab({required this.occupationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(tenancyInvoicesProvider(occupationId));

    return async.when(
      loading: () => const HodiLoadingShimmer(),
      error: (e, _) => HodiErrorState(
        message: e is Exception
            ? e.toString().replaceFirst('Exception: ', '')
            : 'Could not load invoices',
        onRetry: () => ref.invalidate(tenancyInvoicesProvider(occupationId)),
      ),
      data: (result) {
        if (result.rows.isEmpty) {
          return const HodiEmptyState(
            icon: Icons.receipt_long_outlined,
            title: 'No Invoices',
            subtitle: 'Nothing has been billed against this tenancy yet',
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: result.rows.length + (result.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == result.rows.length) {
              return _LoadMore(
                onTap: () =>
                    ref.read(tenancyInvoicePageSizeProvider.notifier).more(),
              );
            }
            final invoice = result.rows[index];
            return InvoiceListItem(
              invoice: invoice,
              onTap: invoice.rrn == null
                  ? null
                  : () => context.push('/invoices/${invoice.rrn}'),
            );
          },
        );
      },
    );
  }
}

class _PaymentsTab extends ConsumerWidget {
  final String occupationId;

  const _PaymentsTab({required this.occupationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(tenancyPaymentsProvider(occupationId));

    return async.when(
      loading: () => const HodiLoadingShimmer(),
      error: (e, _) => HodiErrorState(
        message: e is Exception
            ? e.toString().replaceFirst('Exception: ', '')
            : 'Could not load payments',
        onRetry: () => ref.invalidate(tenancyPaymentsProvider(occupationId)),
      ),
      data: (result) {
        if (result.rows.isEmpty) {
          return const HodiEmptyState(
            icon: Icons.payments_outlined,
            title: 'No Payments',
            subtitle: 'Nothing has been received against this tenancy yet',
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: result.rows.length + (result.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == result.rows.length) {
              return _LoadMore(
                onTap: () =>
                    ref.read(tenancyPaymentPageSizeProvider.notifier).more(),
              );
            }
            final payment = result.rows[index];
            return PaymentListItem(
              payment: payment,
              onTap: payment.rrn == null
                  ? null
                  : () => context.push('/payments/${payment.rrn}'),
            );
          },
        );
      },
    );
  }
}

class _LoadMore extends StatelessWidget {
  final VoidCallback onTap;

  const _LoadMore({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: TextButton(onPressed: onTap, child: const Text('Show more')),
      ),
    );
  }
}
