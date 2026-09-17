import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../domain/vacate_notice_model.dart';

class VacateNoticeListItem extends StatelessWidget {
  const VacateNoticeListItem({super.key, required this.notice, this.onTap});

  final VacateNoticeModel notice;
  final VoidCallback? onTap;

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
                  notice.tenantName,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _StatusPill(notice: notice),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            [
              notice.reference,
              if (notice.unit.isNotEmpty) notice.unit,
              if (notice.propertyName != null) notice.propertyName!,
            ].join(' · '),
            style: HodiTextStyles.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.event_outlined,
                size: 14,
                color: notice.overdue ? HodiColors.errorStart : HodiColors.textLight,
              ),
              const SizedBox(width: 5),
              Text(
                _leaving(notice),
                style: HodiTextStyles.bodySmall.copyWith(
                  fontSize: 11,
                  color:
                      notice.overdue ? HodiColors.errorStart : HodiColors.textMedium,
                  fontWeight: notice.overdue ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              const Spacer(),
              // Only where a settlement exists. Until then there is no figure, and a nought here
              // would read as "nothing owed" rather than "not worked out yet".
              if (notice.hasSettlement)
                Text(
                  '${notice.isRefund ? 'Refund' : 'Owes'} KES '
                  '${CurrencyFormatter.format((notice.netAmount ?? 0).abs())}',
                  style: HodiTextStyles.currency.copyWith(
                    fontSize: 13,
                    color: notice.isRefund
                        ? HodiColors.successEnd
                        : HodiColors.errorStart,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  static String _leaving(VacateNoticeModel n) {
    final when = DateFormatter.parseApiDate(n.vacateDate);
    final date = when == null ? 'no date' : DateFormatter.formatDate(when);
    final days = n.daysToVacate;
    if (days > 0) return '$date · in $days day${days == 1 ? '' : 's'}';
    if (days == 0) return '$date · today';
    return '$date · ${-days} day${days == -1 ? '' : 's'} ago';
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.notice});

  final VacateNoticeModel notice;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (notice.status) {
      'PENDING' => (HodiColors.warningBg, HodiColors.warningEnd),
      'APPROVED' => (HodiColors.successBg, HodiColors.successEnd),
      'REJECTED' => (HodiColors.dangerBg, HodiColors.errorStart),
      'CANCELLED' => (HodiColors.surfaceInset, HodiColors.textMedium),
      _ => (HodiColors.surfaceInset, HodiColors.textMedium),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: HodiBorderRadius.full),
      child: Text(
        notice.statusLabel,
        style: HodiTextStyles.bodySmall.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: fg,
        ),
      ),
    );
  }
}
