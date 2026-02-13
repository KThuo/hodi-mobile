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
import '../providers/invoice_providers.dart';

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
                      _InvoiceStatusBadge(flag: detail.flag),
                      const SizedBox(height: 8),
                      HodiAmountText(
                        amount: detail.invoiceAmount,
                        style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Line items card
                if (detail.items.isNotEmpty)
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
                        ...detail.items.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.narration ?? '-',
                                  style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
                                ),
                              ),
                              Text(
                                'KES ${CurrencyFormatter.format(item.value)}',
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
                                amount: detail.invoiceAmount,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(invoiceRepositoryProvider).downloadInvoicePdf(rrn);
        },
        backgroundColor: HodiColors.primaryStart,
        icon: const Icon(Icons.download, color: HodiColors.white),
        label: Text(
          'Download PDF',
          style: HodiTextStyles.button.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}

class _InvoiceStatusBadge extends StatelessWidget {
  final int flag;

  const _InvoiceStatusBadge({required this.flag});

  String get _label {
    switch (flag) {
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
    switch (flag) {
      case 2:
        return BadgeType.success;
      case 1:
        return BadgeType.warning;
      default:
        return BadgeType.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HodiStatusBadge(text: _label, type: _type);
  }
}
