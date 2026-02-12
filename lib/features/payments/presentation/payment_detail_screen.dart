import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/utils/currency_formatter.dart';
import '../providers/payment_providers.dart';

class PaymentDetailScreen extends ConsumerWidget {
  final String rrn;

  const PaymentDetailScreen({super.key, required this.rrn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(paymentDetailProvider(rrn));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Payment Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'Payment not found');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: HodiGradients.success,
                    borderRadius: HodiBorderRadius.card,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Payment Receipt',
                        style: HodiTextStyles.bodyMedium.copyWith(
                          color: HodiColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail.paymentRrn ?? rrn,
                        style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
                      ),
                      const SizedBox(height: 8),
                      HodiAmountText(
                        amount: detail.totalAmount,
                        style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
                      ),
                      if (detail.paidBy != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Paid by: ${detail.paidBy}',
                          style: HodiTextStyles.bodySmall.copyWith(
                            color: HodiColors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Line items
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
                        Text('Payment Breakdown', style: HodiTextStyles.heading3),
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
                                amount: detail.totalAmount,
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
          message: 'Failed to load payment',
          onRetry: () => ref.invalidate(paymentDetailProvider(rrn)),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(paymentRepositoryProvider).downloadReceiptPdf(rrn);
        },
        backgroundColor: HodiColors.successStart,
        icon: const Icon(Icons.download, color: HodiColors.white),
        label: Text(
          'Download Receipt',
          style: HodiTextStyles.button.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
