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
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/document_actions.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../domain/invoice_detail_model.dart';
import '../domain/invoice_document_model.dart';
import '../providers/invoice_providers.dart';
import 'widgets/make_payment_sheet.dart';

/// One invoice.
///
/// **Two reads, as `hodi-f`'s invoice page does it.** `/invoices/detail/{rrn}` is the document —
/// the charges, the payments against them, and what is left — and it drives everything on screen.
/// `/invoices/reference/{rrn}` is fetched alongside it purely for the ids an action needs, and is
/// allowed to fail: it is scoped, so a caretaker opening another property's invoice is refused it
/// while still being served the document. They then read the invoice and cannot act on it, which
/// is the right answer rather than an error.
///
/// The app used to read only the second one, which carries no payments — so it could show what
/// was owed and never what had been paid towards it, while the browser showed both from an
/// endpoint that was there all along.
class InvoiceDetailScreen extends ConsumerWidget {
  final String rrn;

  const InvoiceDetailScreen({super.key, required this.rrn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(invoiceDocumentProvider(rrn));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Invoice Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return HodiErrorState(
              message: 'Invoice not found',
              onRetry: () => ref.invalidate(invoiceDocumentProvider(rrn)),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ── The headline is what is owed ────────────────────────
                //
                // It was the invoice's face value, which is the wrong figure to shout: somebody
                // opening a bill they have already part-paid was met with the original total and
                // no sign of their money. The charge is still here, one line down, because the
                // balance means nothing without it.
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: HodiGradients.primary,
                    borderRadius: HodiBorderRadius.card,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Invoice',
                        style: HodiTextStyles.bodyMedium.copyWith(
                          color: HodiColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail.rrn,
                        style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
                      ),
                      const SizedBox(height: 8),
                      _InvoiceStatusBadge(label: detail.statusLabel),
                      const SizedBox(height: 12),
                      Text(
                        detail.balanceDue > 0 ? 'Balance due' : 'Settled in full',
                        style: HodiTextStyles.bodySmall.copyWith(
                          color: HodiColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 2),
                      HodiAmountText(
                        // The server's own figure. A voided invoice already reads nought here,
                        // because `balanceDue` is its outstanding and a void clears it.
                        amount: detail.balanceDue,
                        style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
                      ),
                      if (detail.amount != detail.balanceDue) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Invoiced KES ${CurrencyFormatter.format(detail.amount)}',
                          style: HodiTextStyles.bodySmall.copyWith(
                            color: HodiColors.white.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── The document: charges, then payments, then what is left ──
                //
                // Payments sit in the same table as the charges, which is how the web document
                // and legacy both read it: the page is a subtraction, and splitting it into two
                // cards makes the reader do the arithmetic across a gap.
                if (detail.lines.isNotEmpty || detail.payments.isNotEmpty)
                  Container(
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
                        Text('Line Items', style: HodiTextStyles.heading3),
                        const SizedBox(height: 12),
                        const Divider(height: 1),
                        ...detail.lines.map((item) => _DocRow(
                              label: item.narration.isEmpty ? '-' : item.narration,
                              amount: item.amount,
                            )),
                        const Divider(height: 1),
                        _DocRow(
                          label: 'Total charged',
                          amount: detail.amount,
                          bold: true,
                        ),

                        if (detail.payments.isNotEmpty) ...[
                          const Divider(height: 1),
                          const SizedBox(height: 8),
                          Text(
                            'Payments received',
                            style: HodiTextStyles.label.copyWith(
                              color: HodiColors.textLight,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Negative, because that is what they do to the total above. Printed as
                          // positive numbers under a "payments" heading, they read as more charge.
                          ...detail.payments.map((p) => _DocRow(
                                label: p.label,
                                amount: -p.amount,
                                tone: HodiColors.successEnd,
                              )),
                          const Divider(height: 1),
                        ],

                        // The after-figure, shaded, as the printed document has it.
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: detail.balanceDue > 0
                                ? HodiColors.dangerBg
                                : HodiColors.successBg,
                            borderRadius: HodiBorderRadius.small,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'BALANCE DUE',
                                style: HodiTextStyles.labelBold.copyWith(
                                  color: HodiColors.textDark,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              HodiAmountText(
                                amount: detail.balanceDue,
                                style: HodiTextStyles.currency.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: detail.balanceDue > 0
                                      ? HodiColors.errorStart
                                      : HodiColors.successEnd,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 2, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception ? e.toString().replaceFirst('Exception: ', '') : 'Failed to load invoice',
          onRetry: () => ref.invalidate(invoiceDocumentProvider(rrn)),
        ),
      ),
      bottomNavigationBar: detailAsync.when(
        data: (document) {
          if (document == null) return const SizedBox.shrink();
          return _BottomActions(
            document: document,
            rrn: rrn,
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}

/// Download, and — where there is something to pay it with — Make Payment.
///
/// **Whether it can be paid is the document's answer, not a status integer.** `payable` is the
/// server's own test, which is what the web puts its Pay button behind; deciding it here from a
/// status code means keeping a second copy of a rule that already exists.
///
/// **Whether it can be paid *from here* is a second question.** Receiving a payment needs the
/// tenancy and invoice ids, and those live only on the scoped read — so the button appears when
/// the document says payable *and* that read succeeded. A caretaker looking at another property's
/// invoice sees it and cannot pay it, which is exactly right.
class _BottomActions extends ConsumerStatefulWidget {
  final InvoiceDocumentModel document;
  final String rrn;

  const _BottomActions({required this.document, required this.rrn});

  @override
  ConsumerState<_BottomActions> createState() => _BottomActionsState();
}

class _BottomActionsState extends ConsumerState<_BottomActions> {
  bool _busy = false;

  InvoiceDocumentModel get document => widget.document;
  String get rrn => widget.rrn;

  /// Opens the **web's** invoice page in the browser.
  ///
  /// The page `hodi-f` serves at `/invoices/detail/{rrn}`, publicly and by reference, with its own
  /// Download on it. So the document somebody saves from a phone is the document somebody saves
  /// from a laptop — the same page, the same button, the same output.
  ///
  /// The server's `invoice.pdf` is the fallback, for a handset with no browser able to take the
  /// link. It is a different document, which is exactly why it is second rather than first.
  Future<void> _openPdf() async {
    final repo = ref.read(invoiceRepositoryProvider);
    final opened = await DocumentActions.openInBrowser(repo.webInvoiceUrl(rrn));
    if (opened || !mounted) return;

    await DocumentActions.run(
      context,
      () => repo.downloadInvoicePdf(rrn),
      onBusy: (busy) {
        if (mounted) setState(() => _busy = busy);
      },
    );
  }

  void _openPaymentSheet(BuildContext context, InvoiceDetailModel actions) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MakePaymentSheet(invoice: actions),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Null while it loads and null when it is refused — both mean "no actions yet", and neither
    // is worth a spinner on a bar whose other button works regardless.
    final actions = ref.watch(invoiceActionsProvider(rrn)).value;
    final canPay = document.payable && document.balanceDue > 0 && actions != null;

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: const BoxDecoration(
        color: HodiColors.cardBackground,
        border: Border(top: BorderSide(color: HodiColors.divider)),
      ),
      child: Row(
        children: [
          // Download PDF button
          Expanded(
            flex: canPay ? 1 : 2,
            child: OutlinedButton.icon(
              onPressed: _busy ? null : _openPdf,
              icon: _busy
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.picture_as_pdf_outlined, size: 18),
              label: Text(
                'Invoice',
                style: HodiTextStyles.bodyMedium.copyWith(
                  color: HodiColors.primaryStart,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: HodiColors.primaryStart,
                side: BorderSide(color: HodiColors.primaryStart),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          if (canPay) ...[
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: HodiGradientButton(
                text: 'Make Payment',
                icon: Icons.payment,
                onPressed: () => _openPaymentSheet(context, actions),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// The invoice's status, in the server's own words.
///
/// The label is all that is carried, and all that is needed. This took a status integer and kept
/// its own switch translating it — a second copy of a vocabulary the server owns, which read
/// "Unpaid" for any status added after the build shipped. The tone is matched on the wording
/// because a colour is this screen's business; an unrecognised word gets the neutral one rather
/// than being asserted as an error.
class _InvoiceStatusBadge extends StatelessWidget {
  const _InvoiceStatusBadge({this.label});

  final String? label;

  BadgeType get _type => switch (label?.toLowerCase()) {
        'paid' => BadgeType.success,
        'partially paid' => BadgeType.warning,
        'voided' || 'brought forward' => BadgeType.info,
        'unpaid' || 'overdue' => BadgeType.error,
        _ => BadgeType.info,
      };

  @override
  Widget build(BuildContext context) {
    final text = label;
    if (text == null || text.isEmpty) return const SizedBox.shrink();
    return HodiStatusBadge(text: text, type: _type);
  }
}

/// One line of the document — a charge, or a payment taking away from it.
class _DocRow extends StatelessWidget {
  const _DocRow({
    required this.label,
    required this.amount,
    this.bold = false,
    this.tone,
  });

  final String label;
  final double amount;
  final bool bold;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    final sign = amount < 0 ? '-' : '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: tone ?? HodiColors.textDark,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
          Text(
            '${sign}KES ${CurrencyFormatter.format(amount.abs())}',
            style: HodiTextStyles.currency.copyWith(
              fontSize: 14,
              color: tone,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
