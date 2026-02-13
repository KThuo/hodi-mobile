import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../domain/tenant_model.dart';

class TenantListItem extends StatelessWidget {
  final TenantModel tenant;
  final VoidCallback? onTap;

  const TenantListItem({super.key, required this.tenant, this.onTap});

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
                  tenant.tenantName ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (tenant.tenantPhone != null)
                Text(
                  tenant.tenantPhone!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  tenant.houseName ?? tenant.houseCode ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (tenant.category != null)
                Text(
                  tenant.category!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
          if (tenant.property != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.apartment_outlined, size: 14, color: Color(0xFF9CA3AF)),
                const SizedBox(width: 4),
                Text(tenant.property!, style: HodiTextStyles.bodySmall),
              ],
            ),
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: tenant.rentOwed,
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 15,
                  color: tenant.hasDebt
                      ? HodiColors.errorStart
                      : tenant.hasCredit
                          ? HodiColors.successStart
                          : HodiColors.textDark,
                ),
              ),
              if (tenant.dueDate != null)
                Text(
                  tenant.dueDate!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
