import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../domain/invoice_model.dart';

class InvoiceListItem extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onTap;

  const InvoiceListItem({super.key, required this.invoice, this.onTap});

  BadgeType get _badgeType {
    if (invoice.isVoided) return BadgeType.error;
    if (invoice.isPaid) return BadgeType.success;
    return BadgeType.warning;
  }

  String get _statusText {
    if (invoice.isVoided) return 'Voided';
    if (invoice.isPaid) return 'Paid';
    return 'Unpaid';
  }

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  invoice.rrn ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              HodiStatusBadge(text: _statusText, type: _badgeType),
            ],
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
                invoice.houseName ?? invoice.houseCode ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              Text(
                invoice.monthName ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: invoice.rentOwed,
                style: HodiTextStyles.currency.copyWith(fontSize: 15),
              ),
              if (!invoice.isPaid && !invoice.isVoided)
                Text(
                  'Bal: ${invoice.balance >= 0 ? "" : "-"}KES ${invoice.balance.abs().toStringAsFixed(0)}',
                  style: HodiTextStyles.bodySmall.copyWith(
                    color: const Color(0xFFEF4444),
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
