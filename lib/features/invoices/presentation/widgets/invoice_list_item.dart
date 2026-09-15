import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../domain/invoice_model.dart';

class InvoiceListItem extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onTap;

  const InvoiceListItem({super.key, required this.invoice, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            invoice.rrn ?? '-',
            style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  invoice.tenantName ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(
                invoice.unitLabel.isEmpty ? '-' : invoice.unitLabel,
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              Text(
                invoice.periodLabel ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),
          if (invoice.propertyName != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.apartment_outlined, size: 14, color: Color(0xFF9CA3AF)),
                const SizedBox(width: 4),
                Text(invoice.propertyName!, style: HodiTextStyles.bodySmall),
              ],
            ),
          ],
          const SizedBox(height: 8),
          if (invoice.isPaid)
            HodiAmountText(
              amount: invoice.paidAmount,
              style: HodiTextStyles.currency.copyWith(
                fontSize: 15,
                color: HodiColors.successStart,
              ),
            )
          else if (!invoice.isVoided)
            Text(
              'Bal: ${invoice.balance >= 0 ? "" : "-"}KES ${invoice.balance.abs().toStringAsFixed(0)}',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.errorStart,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
