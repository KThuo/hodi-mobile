import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_status_badge.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../domain/vacate_notice_detail_model.dart';
import '../providers/vacate_notice_providers.dart';

class VacateNoticeDetailScreen extends ConsumerWidget {
  final String noticeId;

  const VacateNoticeDetailScreen({super.key, required this.noticeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(vacateNoticeDetailProvider(noticeId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Notice Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'Notice not found');
          }
          return _DetailContent(detail: detail, noticeId: noticeId, ref: ref);
        },
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load notice details',
          onRetry: () => ref.invalidate(vacateNoticeDetailProvider(noticeId)),
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final VacateNoticeDetailModel detail;
  final String noticeId;
  final WidgetRef ref;

  const _DetailContent({required this.detail, required this.noticeId, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _NoticeHeaderCard(detail: detail),
        const SizedBox(height: 16),
        _PropertyInfoCard(detail: detail),
        const SizedBox(height: 16),
        _TenantInfoCard(detail: detail),
        const SizedBox(height: 16),
        _NoticeInfoCard(detail: detail),
        if (detail.approvedByName != null || detail.approvalDate != null) ...[
          const SizedBox(height: 16),
          _ApprovalInfoCard(detail: detail),
        ],
        if (detail.hasSettlement) ...[
          const SizedBox(height: 16),
          _SettlementCard(detail: detail),
        ],
        if (detail.totalPaid > 0 || detail.paymentRrn != null) ...[
          const SizedBox(height: 16),
          _PaymentInfoCard(detail: detail),
        ],
        if (detail.isProcessed) ...[
          const SizedBox(height: 16),
          _ProcessingInfoCard(detail: detail),
        ],
        // Action buttons
        if (detail.isPending) ...[
          const SizedBox(height: 20),
          _ActionButtons(detail: detail, noticeId: noticeId, ref: ref),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

// --- Header Card ---

class _NoticeHeaderCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _NoticeHeaderCard({required this.detail});

  BadgeType get _badgeType {
    switch (detail.flag) {
      case 'PENDING':
        return BadgeType.warning;
      case 'APPROVED':
        return BadgeType.success;
      case 'REJECTED':
        return BadgeType.error;
      case 'CANCELLED':
      case 'PROCESSED':
        return BadgeType.info;
      default:
        return BadgeType.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: HodiColors.white.withValues(alpha: 0.2),
                    borderRadius: HodiBorderRadius.small,
                  ),
                  child: const Icon(Icons.description_outlined, color: HodiColors.white, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.rrn ?? '-',
                        style: HodiTextStyles.heading3.copyWith(color: HodiColors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail.houseName ?? detail.houseCode ?? '-',
                        style: HodiTextStyles.bodyMedium.copyWith(
                          color: HodiColors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                HodiStatusBadge(text: detail.flag ?? '-', type: _badgeType),
              ],
            ),
            if (detail.vacateDate != null) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.event_outlined, size: 16, color: HodiColors.white.withValues(alpha: 0.8)),
                  const SizedBox(width: 8),
                  Text(
                    'Vacate Date: ${detail.vacateDate}',
                    style: HodiTextStyles.bodyMedium.copyWith(
                      color: HodiColors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// --- Property Info Card ---

class _PropertyInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _PropertyInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.apartment_outlined,
      title: 'Property Information',
      color: HodiColors.primaryStart,
      children: [
        _DetailRow(label: 'House', value: detail.houseName ?? detail.houseCode ?? '-'),
        if (detail.houseNumber != null)
          _DetailRow(label: 'House No.', value: detail.houseNumber!),
        if (detail.propertyName != null)
          _DetailRow(label: 'Property', value: detail.propertyName!),
        if (detail.estateName != null)
          _DetailRow(label: 'Estate', value: detail.estateName!),
      ],
    );
  }
}

// --- Tenant Info Card ---

class _TenantInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _TenantInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.person_outline,
      title: 'Tenant Information',
      color: HodiColors.secondary,
      children: [
        _DetailRow(label: 'Name', value: detail.tenantName ?? '-'),
        if (detail.tenantEmail != null)
          _DetailRow(label: 'Email', value: detail.tenantEmail!),
        if (detail.tenantPhone != null)
          _DetailRow(label: 'Phone', value: detail.tenantPhone!),
      ],
    );
  }
}

// --- Notice Info Card ---

class _NoticeInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _NoticeInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.info_outline,
      title: 'Notice Information',
      color: HodiColors.warningStart,
      children: [
        _DetailRow(label: 'RRN', value: detail.rrn ?? '-'),
        _DetailRow(label: 'Vacate Date', value: detail.vacateDate ?? '-'),
        _DetailRow(label: 'Status', value: detail.flag ?? '-'),
        if (detail.initiatedBy != null)
          _DetailRow(label: 'Initiated By', value: '${detail.initiatedByName ?? '-'} (${detail.initiatedBy})'),
        if (detail.reason != null && detail.reason!.isNotEmpty)
          _DetailRow(label: 'Reason', value: detail.reason!),
        if (detail.createdOn != null)
          _DetailRow(label: 'Created', value: detail.createdOn!),
      ],
    );
  }
}

// --- Approval Info Card ---

class _ApprovalInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _ApprovalInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.check_circle_outline,
      title: 'Approval Information',
      color: HodiColors.successStart,
      children: [
        if (detail.approvedByName != null)
          _DetailRow(label: 'Approved By', value: detail.approvedByName!),
        if (detail.approvalDate != null)
          _DetailRow(label: 'Approval Date', value: detail.approvalDate!),
        if (detail.approvalComments != null && detail.approvalComments!.isNotEmpty)
          _DetailRow(label: 'Comments', value: detail.approvalComments!),
      ],
    );
  }
}

// --- Settlement Card ---

class _SettlementCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _SettlementCard({required this.detail});

  Color get _typeColor {
    switch (detail.settlementType) {
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
    // Parse settlement details JSON for expenses/utility bills
    List<dynamic> expenses = [];
    List<dynamic> utilityBills = [];
    if (detail.settlementDetails != null && detail.settlementDetails!.isNotEmpty) {
      try {
        final parsed = jsonDecode(detail.settlementDetails!);
        expenses = parsed['expenses'] ?? [];
        utilityBills = parsed['utilityBills'] ?? [];
      } catch (_) {}
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Settlement',
            color: _typeColor,
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          // Settlement type badge
          Row(
            children: [
              Text('Type', style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _typeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _typeColor.withValues(alpha: 0.3)),
                ),
                child: Text(
                  detail.settlementType ?? '-',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _typeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Financial breakdown
          _AmountRow(label: 'Refundable Deposit', amount: detail.refundableDeposit, color: HodiColors.successStart),
          _AmountRow(label: 'Rent Owed', amount: detail.rentOwed, color: HodiColors.errorStart, isNegative: true),
          _AmountRow(label: 'Total Expenses', amount: detail.totalExpenses, color: HodiColors.errorStart, isNegative: true),

          // Expense breakdown
          if (expenses.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: expenses.map<Widget>((e) {
                  final desc = e['description'] ?? '';
                  final category = e['category'] ?? '';
                  final amount = (e['amount'] as num?)?.toDouble() ?? 0;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.remove, size: 12, color: HodiColors.textLight),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '$desc ($category)',
                            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                          ),
                        ),
                        HodiAmountText(
                          amount: amount,
                          style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],

          // Utility bills
          if (utilityBills.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: utilityBills.map<Widget>((b) {
                  final name = b['name'] ?? '';
                  final amount = (b['amount'] as num?)?.toDouble() ?? 0;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.bolt_outlined, size: 12, color: HodiColors.textLight),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            name,
                            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                          ),
                        ),
                        HodiAmountText(
                          amount: amount,
                          style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],

          const SizedBox(height: 12),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 12),

          // Net amount
          Row(
            children: [
              Text(
                'Net Amount',
                style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              HodiAmountText(
                amount: detail.netAmount,
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 16,
                  color: detail.netAmount >= 0
                      ? HodiColors.successStart
                      : HodiColors.errorStart,
                ),
              ),
            ],
          ),

          if (detail.invoiceRrn != null) ...[
            const SizedBox(height: 8),
            _DetailRow(label: 'Invoice RRN', value: detail.invoiceRrn!),
          ],
        ],
      ),
    );
  }
}

// --- Payment Info Card ---

class _PaymentInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _PaymentInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    // Parse payment history JSON
    List<dynamic> history = [];
    if (detail.paymentHistory != null && detail.paymentHistory!.isNotEmpty) {
      try {
        history = jsonDecode(detail.paymentHistory!);
      } catch (_) {}
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            icon: Icons.payments_outlined,
            title: 'Payment Information',
            color: HodiColors.successStart,
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),

          // Payment summary tiles
          Row(
            children: [
              Expanded(
                child: _MetricTile(
                  label: 'Total Paid',
                  amount: detail.totalPaid,
                  color: HodiColors.successStart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MetricTile(
                  label: 'Balance',
                  amount: detail.balanceRemaining,
                  color: detail.balanceRemaining > 0
                      ? HodiColors.errorStart
                      : HodiColors.successStart,
                ),
              ),
            ],
          ),

          if (detail.paymentRrn != null) ...[
            const SizedBox(height: 12),
            _DetailRow(label: 'Payment RRN', value: detail.paymentRrn!),
          ],
          if (detail.paymentFlag != null) ...[
            _DetailRow(label: 'Payment Status', value: detail.paymentFlag!),
          ],

          // Payment history
          if (history.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Payment History',
              style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
            ),
            const SizedBox(height: 8),
            ...history.map<Widget>((h) {
              final rrn = h['paymentRrn'] ?? '';
              final amount = (h['amount'] as num?)?.toDouble() ?? 0;
              final type = h['paymentType'] ?? '';
              final paidBy = h['paidBy'] ?? '';
              final paidOn = h['paidOn'] ?? '';
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: HodiColors.surfaceLight,
                  borderRadius: HodiBorderRadius.small,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            rrn,
                            style: HodiTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        HodiAmountText(
                          amount: amount,
                          style: HodiTextStyles.currency.copyWith(
                            fontSize: 13,
                            color: HodiColors.successStart,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$type - $paidBy - $paidOn',
                      style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}

// --- Processing Info Card ---

class _ProcessingInfoCard extends StatelessWidget {
  final VacateNoticeDetailModel detail;

  const _ProcessingInfoCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: Icons.task_alt_outlined,
      title: 'Processing Information',
      color: HodiColors.secondary,
      children: [
        if (detail.processedBy != null)
          _DetailRow(label: 'Processed By', value: detail.processedBy!),
        if (detail.processedDate != null)
          _DetailRow(label: 'Processed Date', value: detail.processedDate!),
        if (detail.unpaidBalanceHandling != null)
          _DetailRow(label: 'Unpaid Balance', value: detail.unpaidBalanceHandling!),
        if (detail.unpaidHandlingNotes != null && detail.unpaidHandlingNotes!.isNotEmpty)
          _DetailRow(label: 'Notes', value: detail.unpaidHandlingNotes!),
        if (detail.unpaidAmount > 0)
          _DetailRow(label: 'Unpaid Amount', value: 'KES ${detail.unpaidAmount.toStringAsFixed(2)}'),
        if (detail.refundConfirmed)
          const _DetailRow(label: 'Refund', value: 'Confirmed'),
      ],
    );
  }
}

// --- Action Buttons ---

class _ActionButtons extends StatelessWidget {
  final VacateNoticeDetailModel detail;
  final String noticeId;
  final WidgetRef ref;

  const _ActionButtons({required this.detail, required this.noticeId, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showRejectDialog(context),
            icon: const Icon(Icons.close, size: 18),
            label: const Text('Reject'),
            style: OutlinedButton.styleFrom(
              foregroundColor: HodiColors.errorStart,
              side: const BorderSide(color: HodiColors.errorStart),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showApproveDialog(context),
            icon: const Icon(Icons.check, size: 18),
            label: const Text('Approve'),
            style: ElevatedButton.styleFrom(
              backgroundColor: HodiColors.successStart,
              foregroundColor: HodiColors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }

  void _showApproveDialog(BuildContext context) {
    final commentsController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Approve Notice'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure you want to approve this vacate notice?'),
            const SizedBox(height: 16),
            TextField(
              controller: commentsController,
              decoration: const InputDecoration(
                labelText: 'Comments (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final repo = ref.read(vacateNoticeRepositoryProvider);
              final result = await repo.approveNotice(
                noticeId,
                comments: commentsController.text,
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result.isSuccess ? 'Notice approved' : result.message),
                    backgroundColor: result.isSuccess ? HodiColors.successStart : HodiColors.errorStart,
                  ),
                );
                if (result.isSuccess) {
                  ref.invalidate(vacateNoticeDetailProvider(noticeId));
                  ref.read(vacateNoticeListProvider.notifier).refresh();
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: HodiColors.successStart),
            child: const Text('Approve', style: TextStyle(color: HodiColors.white)),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    final reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reject Notice'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please provide a reason for rejection.'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Rejection Reason *',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Rejection reason is required'),
                    backgroundColor: HodiColors.errorStart,
                  ),
                );
                return;
              }
              Navigator.pop(ctx);
              final repo = ref.read(vacateNoticeRepositoryProvider);
              final result = await repo.rejectNotice(
                noticeId,
                reason: reasonController.text.trim(),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result.isSuccess ? 'Notice rejected' : result.message),
                    backgroundColor: result.isSuccess ? HodiColors.successStart : HodiColors.errorStart,
                  ),
                );
                if (result.isSuccess) {
                  ref.invalidate(vacateNoticeDetailProvider(noticeId));
                  ref.read(vacateNoticeListProvider.notifier).refresh();
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: HodiColors.errorStart),
            child: const Text('Reject', style: TextStyle(color: HodiColors.white)),
          ),
        ],
      ),
    );
  }
}

// --- Shared Widgets ---

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final List<Widget> children;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(icon: icon, title: title, color: color),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _SectionHeader({required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: HodiBorderRadius.small,
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Text(title, style: HodiTextStyles.heading3),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;
  final bool isNegative;

  const _AmountRow({
    required this.label,
    required this.amount,
    required this.color,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: HodiTextStyles.bodyMedium),
          ),
          Text(
            isNegative && amount > 0 ? '- ' : '',
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _MetricTile({required this.label, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: HodiBorderRadius.small,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 6),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }
}
