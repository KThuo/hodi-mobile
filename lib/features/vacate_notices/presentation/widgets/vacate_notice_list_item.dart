import 'package:flutter/material.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_status_badge.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../domain/vacate_notice_model.dart';

class VacateNoticeListItem extends StatelessWidget {
  final VacateNoticeModel notice;
  final VoidCallback? onTap;

  const VacateNoticeListItem({super.key, required this.notice, this.onTap});

  BadgeType get _badgeType {
    switch (notice.flag) {
      case 'PENDING':
        return BadgeType.warning;
      case 'APPROVED':
        return BadgeType.success;
      case 'REJECTED':
        return BadgeType.error;
      case 'CANCELLED':
        return BadgeType.info;
      case 'PROCESSED':
        return BadgeType.info;
      default:
        return BadgeType.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: RRN + status badge
          Row(
            children: [
              Expanded(
                child: Text(
                  notice.rrn ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              HodiStatusBadge(
                text: notice.flag ?? '-',
                type: _badgeType,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Tenant name + phone
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: HodiColors.textLight),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  notice.tenantName ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (notice.tenantPhone != null)
                Text(notice.tenantPhone!, style: HodiTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 4),

          // House name
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 14, color: HodiColors.textLight),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  notice.houseName ?? notice.houseCode ?? '-',
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (notice.propertyName != null)
                Text(notice.propertyName!, style: HodiTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 8),

          // Bottom row: vacate date + settlement / net amount
          Row(
            children: [
              if (notice.vacateDate != null) ...[
                const Icon(Icons.event_outlined, size: 14, color: HodiColors.textLight),
                const SizedBox(width: 4),
                Text(
                  notice.vacateDate!,
                  style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
                ),
              ],
              const Spacer(),
              if (notice.settlementType != null) ...[
                _SettlementChip(type: notice.settlementType!),
                const SizedBox(width: 8),
              ],
              if (notice.netAmount != 0)
                HodiAmountText(
                  amount: notice.netAmount,
                  style: HodiTextStyles.currency.copyWith(
                    fontSize: 14,
                    color: notice.netAmount > 0
                        ? HodiColors.successStart
                        : HodiColors.errorStart,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettlementChip extends StatelessWidget {
  final String type;

  const _SettlementChip({required this.type});

  Color get _color {
    switch (type) {
      case 'REFUND':
        return HodiColors.successStart;
      case 'INVOICE':
        return HodiColors.errorStart;
      case 'BALANCED':
        return HodiColors.secondary;
      default:
        return HodiColors.textMedium;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _color.withValues(alpha: 0.3)),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}
