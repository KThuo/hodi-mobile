import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/payment_detail_model.dart';
import '../domain/payment_model.dart';
import '../providers/payment_providers.dart';

/// One receipt, as the document it is.
///
/// ## What a receipt has to answer
///
/// This screen used to show the receipt number, the amount, and a list of allocations. That is not
/// a receipt — it is the top of one. What somebody holds a receipt to prove is a subtraction:
/// **what I owed, what I paid, what I owe now**, and against which bills. Without the two balances
/// the page hands over a figure to be trusted; with them it shows its working, and a tenant can
/// check it against their own arithmetic.
///
/// So the body is laid out as the sum, in the order the sum is performed, and it is the same
/// document the web prints and the server renders into the PDF behind the download button — three
/// places, one shape, so a tenant comparing a screen against a printout is reading the same thing
/// twice rather than two things that have to be reconciled.
///
/// ## More than one invoice
///
/// One payment can clear several months. Each one is its own line naming the month and the invoice,
/// and a partial settlement says so — "part payment" beside a bill still standing is the difference
/// between a tenant who is up to date and one who is not.
class PaymentDetailScreen extends ConsumerWidget {
  final String rrn;

  const PaymentDetailScreen({super.key, required this.rrn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(paymentDetailProvider(rrn));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Receipt'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return HodiErrorState(
              message: 'Payment not found',
              onRetry: () => ref.invalidate(paymentDetailProvider(rrn)),
            );
          }
          return _Receipt(detail: detail, fallbackRrn: rrn);
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load payment',
          onRetry: () => ref.invalidate(paymentDetailProvider(rrn)),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(paymentRepositoryProvider).downloadReceiptPdf(rrn),
        backgroundColor: HodiColors.successStart,
        icon: const Icon(Icons.download, color: HodiColors.white),
        label: Text('Download', style: HodiTextStyles.button.copyWith(fontSize: 14)),
      ),
    );
  }
}

class _Receipt extends StatelessWidget {
  final PaymentDetailModel detail;
  final String fallbackRrn;

  const _Receipt({required this.detail, required this.fallbackRrn});

  PaymentModel get p => detail.payment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          if (detail.isVoided) ...[
            const SizedBox(height: 12),
            _voidedNotice(),
          ],
          const SizedBox(height: 16),
          _facts(),
          const SizedBox(height: 16),
          _theSum(context),
        ],
      ),
    );
  }

  /// The amount, on the gradient — a voided receipt does not get the success colours, because the
  /// first thing it has to say is that this money is no longer counted.
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: detail.isVoided ? HodiGradients.primary : HodiGradients.success,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Column(
        children: [
          Text(
            detail.isVoided ? 'Voided receipt' : 'Receipt',
            style: HodiTextStyles.bodyMedium
                .copyWith(color: HodiColors.white.withValues(alpha: 0.85)),
          ),
          const SizedBox(height: 4),
          Text(
            p.rrn ?? fallbackRrn,
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
          ),
          const SizedBox(height: 10),
          HodiAmountText(
            amount: p.amount,
            style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
          ),
          if (p.receivedOn != null) ...[
            const SizedBox(height: 6),
            Text(
              _when(p.receivedOn),
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.white.withValues(alpha: 0.85)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _voidedNotice() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: HodiColors.dangerBg,
        borderRadius: HodiBorderRadius.card,
        border: Border.all(color: HodiColors.errorStart.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This payment was voided.',
            style: HodiTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: HodiColors.errorEnd,
            ),
          ),
          if (detail.voidReason != null) ...[
            const SizedBox(height: 4),
            Text(detail.voidReason!, style: HodiTextStyles.bodySmall),
          ],
          if (detail.voidedBy != null) ...[
            const SizedBox(height: 4),
            Text(
              '${detail.voidedBy}${detail.voidedOn == null ? '' : ' · ${_when(detail.voidedOn)}'}',
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
          ],
        ],
      ),
    );
  }

  /// How it was paid, and what it was paid against.
  ///
  /// The reference goes in monospace: somebody checking an M-PESA code against a phone is comparing
  /// it character by character, and proportional digits make that harder than it needs to be.
  Widget _facts() {
    final rows = <({String label, String value, bool mono})>[
      if (p.channel.isNotEmpty) (label: 'Paid by', value: p.channel, mono: false),
      if (p.reference != null && p.reference!.isNotEmpty)
        (label: 'Reference', value: p.reference!, mono: true),
      if (p.paidBy != null && p.paidBy!.isNotEmpty)
        (label: 'Received from', value: p.paidBy!, mono: false),
      if (p.payerPhone != null && p.payerPhone!.isNotEmpty)
        (label: 'Payer phone', value: p.payerPhone!, mono: true),
      if (p.tenantName != null && p.tenantName!.isNotEmpty)
        (label: 'Tenant', value: p.tenantName!, mono: false),
      if (p.unitLabel.isNotEmpty) (label: 'Unit', value: p.unitLabel, mono: false),
      if (p.propertyName != null && p.propertyName!.isNotEmpty)
        (label: 'Property', value: p.propertyName!, mono: false),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();

    return _Card(
      title: 'How it was paid',
      child: Column(
        children: [
          for (final r in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      r.label,
                      style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      r.value,
                      textAlign: TextAlign.right,
                      style: r.mono
                          ? HodiTextStyles.currencySmall.copyWith(color: HodiColors.textDark)
                          : HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// The subtraction, in the order it happens: what was owed, what this cleared, what is left.
  Widget _theSum(BuildContext context) {
    final lines = <Widget>[];

    /*
     * The opening balance, dated — legacy's line, in legacy's place.
     *
     * Legacy's receipt reads "September Invoice Balance as at 27-08-2026 11:13 - HPABABLUF1PB ...
     * 60.00", then "Amount Paid on 27-08-2026 11:13 (Coop STK Push REF: ...) ... 20.00", then
     * "BALANCE DUE ... 40.00". The timestamp belongs to the opening figure: a balance "as at" a
     * moment is one that was *observed* then, and it is the position this money was applied
     * against. The closing figure is not an observation, it is the arithmetic on this page, so
     * dating it would claim a second reading that never happened — and both would carry the same
     * timestamp anyway, which is how you can tell only one of them wants it.
     *
     * As a sublabel because the row is a label and an amount on a handset, where the whole phrase
     * on one line wraps and "Balance" does not.
     */
    if (p.rentOwedBefore != null) {
      lines.add(_SumLine(
        label: 'Balance',
        sublabel: p.receivedOn == null ? null : 'as at ${_when(p.receivedOn)}',
        amount: p.rentOwedBefore!,
        muted: true,
      ));
    }

    // Each bill this money actually cleared, negated — it is coming off the balance above.
    for (final a in detail.allocations) {
      lines.add(_SumLine(
        label: a.periodLabel ?? a.invoiceRrn ?? 'Invoice',
        sublabel: a.invoiceRrn == null
            ? null
            : (a.settlesIt ? a.invoiceRrn! : '${a.invoiceRrn!} · part payment'),
        amount: -a.amount,
        onTap: a.invoiceRrn == null
            ? null
            : () => context.push('/invoices/${a.invoiceRrn}'),
      ));
    }

    /*
     * Money with no invoice to sit against is not an error and must not read as one.
     *
     * A tenant can pay ahead, or pay in the gap between the billing run and the month it covers.
     * It is credit standing on the tenancy, and it is not negated here because it has reduced
     * nothing yet.
     */
    if (p.unallocated > 0) {
      lines.add(_SumLine(
        label: 'Held as credit',
        sublabel: 'Applied to the next invoice raised',
        amount: p.unallocated,
        tone: HodiColors.credit,
      ));
    }

    if (detail.allocations.isEmpty && p.unallocated <= 0) {
      lines.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          detail.isVoided
              ? 'Nothing — the allocations were removed when this payment was voided.'
              : 'Nothing was applied.',
          style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
        ),
      ));
    }

    /*
     * The result of that subtraction, under legacy's own label, and the only place it is said.
     *
     * This line used to be followed by a coloured strip reading "Still owed: KES x" — the same
     * figure, one line below itself, in more words. The colour does that work now: an amount
     * standing is warning-toned, a cleared account is success-toned and reads nought.
     */
    if (p.rentOwed != null) {
      lines.add(const Divider(height: 20));
      lines.add(_SumLine(
        label: 'Balance due',
        amount: p.rentOwed!,
        bold: true,
        tone: p.rentOwed! > 0 ? HodiColors.warningEnd : HodiColors.successEnd,
      ));
    }

    return _Card(
      title: detail.allocations.length > 1
          ? 'What it settled (${detail.allocations.length} invoices)'
          : 'What it settled',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...lines,
          const Divider(height: 20),
          Row(
            children: [
              Text(
                'Received',
                style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              HodiAmountText(
                amount: p.amount,
                style: HodiTextStyles.currency.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _when(String? iso) {
    if (iso == null) return '';
    final when = DateTime.tryParse(iso);
    return when == null ? iso : DateFormatter.formatDateTime(when.toLocal());
  }
}

/// One line of the sum. A negative amount is money coming off a balance, and reads that way.
class _SumLine extends StatelessWidget {
  final String label;
  final String? sublabel;
  final double amount;
  final bool muted;
  final bool bold;
  final Color? tone;
  final VoidCallback? onTap;

  const _SumLine({
    required this.label,
    required this.amount,
    this.sublabel,
    this.muted = false,
    this.bold = false,
    this.tone,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final negative = amount < 0;
    final text = '${negative ? '-' : ''}KES ${CurrencyFormatter.format(amount.abs())}';

    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        label,
                        style: (bold
                                ? HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)
                                : HodiTextStyles.bodyMedium)
                            .copyWith(
                          color: muted ? HodiColors.textMedium : HodiColors.textDark,
                        ),
                      ),
                    ),
                    if (onTap != null) ...[
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, size: 16, color: HodiColors.textFaint),
                    ],
                  ],
                ),
                if (sublabel != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      sublabel!,
                      style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: HodiTextStyles.currency.copyWith(
              fontSize: bold ? 15 : 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
              color: tone ?? (negative ? HodiColors.credit : HodiColors.textDark),
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return row;
    return InkWell(onTap: onTap, borderRadius: HodiBorderRadius.card, child: row);
  }
}

class _Card extends StatelessWidget {
  final String title;
  final Widget child;

  const _Card({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: HodiTextStyles.heading3),
          const SizedBox(height: 6),
          const Divider(height: 1),
          child,
        ],
      ),
    );
  }
}
