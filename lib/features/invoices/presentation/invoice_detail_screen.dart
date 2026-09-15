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
import '../../../core/widgets/hodi_gradient_button.dart';
import '../domain/invoice_detail_model.dart';
import '../providers/invoice_providers.dart';
import 'widgets/make_payment_sheet.dart';

class InvoiceDetailScreen extends ConsumerWidget {
  final String rrn;

  const InvoiceDetailScreen({super.key, required this.rrn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(invoiceDetailProvider(rrn));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Invoice Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return HodiErrorState(
              message: 'Invoice not found',
              onRetry: () => ref.invalidate(invoiceDetailProvider(rrn)),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header card with RRN
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
                        detail.rrn ?? rrn,
                        style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
                      ),
                      const SizedBox(height: 8),
                      _InvoiceStatusBadge(status: detail.invoice.status, label: detail.invoice.statusLabel),
                      const SizedBox(height: 8),
                      HodiAmountText(
                        amount: detail.invoice.amount,
                        style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Line items card
                if (detail.lines.isNotEmpty)
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
                        ...detail.lines.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.narration.isEmpty ? '-' : item.narration,
                                  style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
                                ),
                              ),
                              Text(
                                'KES ${CurrencyFormatter.format(item.amount)}',
                                style: HodiTextStyles.currency.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        )),
                        const Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Text(
                                'Total',
                                style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              HodiAmountText(
                                amount: detail.invoice.amount,
                                style: HodiTextStyles.currency.copyWith(fontWeight: FontWeight.w700),
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
          onRetry: () => ref.invalidate(invoiceDetailProvider(rrn)),
        ),
      ),
      bottomNavigationBar: detailAsync.when(
        data: (detail) {
          if (detail == null) return const SizedBox.shrink();
          return _BottomActions(
            detail: detail,
            rrn: rrn,
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}

class _BottomActions extends ConsumerWidget {
  final InvoiceDetailModel detail;
  final String rrn;

  const _BottomActions({required this.detail, required this.rrn});

  // Said in terms of what it means rather than of an integer: `flag < 2` happened to be right
  // because UNPAID is 0 and PARTIAL is 1, and would have quietly become wrong the day a status was
  // inserted between them. A voided invoice owes nothing whatever its amount says.
  bool get _canPay =>
      !detail.isPaid && !detail.isVoided && detail.balance > 0;

  void _openPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MakePaymentSheet(invoice: detail),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            flex: _canPay ? 1 : 2,
            child: OutlinedButton.icon(
              onPressed: () {
                ref.read(invoiceRepositoryProvider).downloadInvoicePdf(rrn);
              },
              icon: const Icon(Icons.download, size: 18),
              label: Text(
                'Download',
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
          if (_canPay) ...[
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: HodiGradientButton(
                text: 'Make Payment',
                icon: Icons.payment,
                onPressed: () => _openPaymentSheet(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InvoiceStatusBadge extends StatelessWidget {
  const _InvoiceStatusBadge({required this.status, this.label});

  final int status;

  /// The server's own wording, which is what gets shown. The switch below is only a fallback for a
  /// response that predates the field — the app used to name every status itself, so a status added
  /// on the server read "Unpaid" here until somebody shipped a new build.
  final String? label;

  String get _label {
    if (label != null && label!.isNotEmpty) return label!;
    switch (status) {
      case 2:
        return 'Paid';
      case 1:
        return 'Partially Paid';
      case 4:
        return 'Voided';
      case 3:
        return 'Brought Forward';
      default:
        return 'Unpaid';
    }
  }

  BadgeType get _type {
    switch (status) {
      case 2:
        return BadgeType.success;
      case 1:
        return BadgeType.warning;
      case 4:
      case 3:
        return BadgeType.info;
      default:
        return BadgeType.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HodiStatusBadge(text: _label, type: _type);
  }
}
