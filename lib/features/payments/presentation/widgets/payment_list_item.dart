import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../domain/payment_model.dart';

class PaymentListItem extends StatelessWidget {
  final PaymentModel payment;
  final VoidCallback? onTap;

  const PaymentListItem({super.key, required this.payment, this.onTap});

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
                  payment.rrn ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const HodiStatusBadge(text: 'Paid', type: BadgeType.success),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  payment.tenantName ?? '-',
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
                payment.unitLabel.isEmpty ? '-' : payment.unitLabel,
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              Text(
                payment.receivedOn ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: payment.amount,
                style: HodiTextStyles.currency.copyWith(fontSize: 15),
              ),
              if (payment.paidBy != null)
                Text(
                  'by ${payment.paidBy}',
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
