import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../domain/vacate_notice_detail_model.dart';
import '../domain/vacate_notice_model.dart';
import '../providers/vacate_notice_providers.dart';

/// One notice to vacate.
///
/// The page is organised around the two questions somebody opens it with — **when are they
/// leaving** and **who owes whom** — and everything else supports one of those.
///
/// The settlement is shown as the subtraction it is: the deposit held, each deduction against it,
/// then the figure that falls out. A tenant disputing a charge wants to see the working, and a
/// meter reading beside a utility line is what lets them check it against the dial rather than
/// take it on trust.
class VacateNoticeDetailScreen extends ConsumerStatefulWidget {
  const VacateNoticeDetailScreen({super.key, required this.noticeId});

  final String noticeId;

  @override
  ConsumerState<VacateNoticeDetailScreen> createState() =>
      _VacateNoticeDetailScreenState();
}

class _VacateNoticeDetailScreenState
    extends ConsumerState<VacateNoticeDetailScreen> {
  bool _busy = false;

  Future<void> _decide(String action, {required String title}) async {
    final notes = await _askNotes(title, action);
    if (notes == null) return;

    setState(() => _busy = true);
    final response = await ref.read(vacateNoticeRepositoryProvider).decide(
          id: widget.noticeId,
          action: action,
          notes: notes.isEmpty ? null : notes,
        );
    if (!mounted) return;
    setState(() => _busy = false);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message.isNotEmpty
          ? response.message
          : response.isSuccess
              ? 'Done.'
              : 'That decision did not go through.'),
      backgroundColor:
          response.isSuccess ? HodiColors.successStart : HodiColors.errorStart,
    ));

    if (response.isSuccess) {
      ref.invalidate(vacateNoticeDetailProvider(widget.noticeId));
      ref.read(vacateNoticeListProvider.notifier).refresh();
    }
  }

  /// Notes are optional on the server, so the dialogue asks without insisting — but it does ask,
  /// because a refusal with no reason is one somebody has to ring up about.
  Future<String?> _askNotes(String title, String action) async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
        title: Text(title, style: HodiTextStyles.heading3),
        content: HodiTextField(
          controller: controller,
          labelText: action == 'REJECT' ? 'Why (recommended)' : 'Notes (optional)',
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: action == 'APPROVE'
                  ? HodiColors.successEnd
                  : HodiColors.errorEnd,
            ),
            child: Text(title),
          ),
        ],
      ),
    );
    final notes = controller.text.trim();
    controller.dispose();
    return confirmed == true ? notes : null;
  }

  Future<void> _statement() async {
    setState(() => _busy = true);
    try {
      await ref
          .read(vacateNoticeRepositoryProvider)
          .downloadStatement(widget.noticeId);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e is Exception
            ? e.toString().replaceFirst('Exception: ', '')
            : 'That statement could not be opened.'),
        backgroundColor: HodiColors.errorStart,
      ));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(vacateNoticeDetailProvider(widget.noticeId));
    final canDecide = ref.watch(canDecideVacateProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Notice to vacate'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 150),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That notice could not be loaded.',
          onRetry: () =>
              ref.invalidate(vacateNoticeDetailProvider(widget.noticeId)),
        ),
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'That notice was not found.');
          }
          final n = detail.notice;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _WhenCard(notice: n),

              // The server's own sentence about what happens next. The most useful line on the
              // page, and the app does not try to work it out for itself.
              if ((detail.nextStep ?? n.nextStep) != null) ...[
                const SizedBox(height: 12),
                _NextStep(text: detail.nextStep ?? n.nextStep!),
              ],

              const SizedBox(height: 16),
              _WhoCard(notice: n),

              if (detail.shortNotice != null &&
                  detail.shortNotice!.isShort) ...[
                const SizedBox(height: 16),
                _ShortNoticeCard(view: detail.shortNotice!),
              ],

              const SizedBox(height: 16),
              _SettlementCard(detail: detail),

              if (detail.payments.isNotEmpty) ...[
                const SizedBox(height: 16),
                _PaymentsCard(detail: detail),
              ],

              if (n.decisionNotes != null && n.decisionNotes!.isNotEmpty) ...[
                const SizedBox(height: 16),
                _Card(
                  title: n.rejected ? 'Why it was refused' : 'Decision notes',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(n.decisionNotes!, style: HodiTextStyles.bodyMedium),
                      if (n.decidedByName != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          '${n.decidedByName} · ${_date(n.decidedOn)}',
                          style: HodiTextStyles.bodySmall
                              .copyWith(color: HodiColors.textLight),
                        ),
                      ],
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: _busy ? null : _statement,
                icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
                label: const Text('Settlement statement'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: HodiColors.primaryStart,
                  side: BorderSide(color: HodiColors.primaryStart),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              if (n.pending) ...[
                const SizedBox(height: 12),
                if (canDecide)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _busy
                              ? null
                              : () => _decide('REJECT', title: 'Refuse'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: HodiColors.errorStart,
                            side: const BorderSide(color: HodiColors.errorStart),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Refuse'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: _busy
                              ? null
                              : () => _decide('APPROVE', title: 'Approve'),
                          style: FilledButton.styleFrom(
                            backgroundColor: HodiColors.successStart,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Approve'),
                        ),
                      ),
                    ],
                  )
                else
                  // A tenant's own notice: theirs to withdraw, not to approve.
                  OutlinedButton.icon(
                    onPressed:
                        _busy ? null : () => _decide('CANCEL', title: 'Withdraw'),
                    icon: const Icon(Icons.undo, size: 18),
                    label: const Text('Withdraw this notice'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: HodiColors.textMedium,
                      side: const BorderSide(color: HodiColors.dividerStrong),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
              ],
              const SizedBox(height: 28),
            ],
          );
        },
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
  }
}

/// When they are leaving, which is the first question.
class _WhenCard extends StatelessWidget {
  const _WhenCard({required this.notice});

  final VacateNoticeModel notice;

  @override
  Widget build(BuildContext context) {
    final days = notice.daysToVacate;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: notice.overdue ? HodiGradients.error : HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Column(
        children: [
          Text(
            notice.reference,
            style: HodiTextStyles.bodySmall
                .copyWith(color: HodiColors.white.withValues(alpha: 0.8)),
          ),
          const SizedBox(height: 10),
          Text(
            _date(notice.vacateDate),
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
          ),
          const SizedBox(height: 4),
          Text(
            // Counted by the server, so the app and the office agree about "today".
            days > 0
                ? 'in $days day${days == 1 ? '' : 's'}'
                : days == 0
                    ? 'today'
                    : '${-days} day${days == -1 ? '' : 's'} ago',
            style: HodiTextStyles.bodyMedium
                .copyWith(color: HodiColors.white.withValues(alpha: 0.9)),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: HodiColors.white.withValues(alpha: 0.2),
              borderRadius: HodiBorderRadius.full,
            ),
            child: Text(
              notice.statusLabel,
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? 'No date' : DateFormatter.formatDate(parsed);
  }
}

class _NextStep extends StatelessWidget {
  const _NextStep({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: HodiColors.brandSoft,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.flag_outlined, size: 18, color: HodiColors.primaryStart),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.primaryStart,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhoCard extends StatelessWidget {
  const _WhoCard({required this.notice});

  final VacateNoticeModel notice;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Who and where',
      child: Column(
        children: [
          _Row(label: 'Tenant', value: notice.tenantName),
          if (notice.tenantPhone != null)
            _Row(label: 'Phone', value: notice.tenantPhone!),
          _Row(label: 'Unit', value: notice.unit),
          if (notice.propertyName != null)
            _Row(label: 'Property', value: notice.propertyName!),
          if (notice.raisedByName != null)
            _Row(label: 'Raised by', value: notice.raisedByName!),
          if (notice.reason != null && notice.reason!.isNotEmpty)
            _Row(label: 'Reason', value: notice.reason!, isLast: true),
        ],
      ),
    );
  }
}

/// Whether enough notice was given.
///
/// Only rendered when it is short. The server has already judged it, worked out the shortfall, and
/// decided whether it is chargeable at all — short notice is not automatically a penalty, that is
/// a property setting. Its [ShortNoticeModel.explanation] is shown verbatim, because a tenant
/// disputing a charge wants the reasoning rather than a paraphrase of it.
class _ShortNoticeCard extends StatelessWidget {
  const _ShortNoticeCard({required this.view});

  final ShortNoticeModel view;

  @override
  Widget build(BuildContext context) {
    final chargeable = view.chargeable;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: chargeable ? HodiColors.warningBg : HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.card,
        border: Border.all(
          color: chargeable
              ? HodiColors.warningStart.withValues(alpha: 0.4)
              : HodiColors.divider,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                chargeable ? Icons.warning_amber_rounded : Icons.info_outline,
                size: 18,
                color: chargeable ? HodiColors.warningEnd : HodiColors.textMedium,
              ),
              const SizedBox(width: 8),
              Text(
                'Short notice',
                style: HodiTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color:
                      chargeable ? HodiColors.warningEnd : HodiColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            view.required != null
                ? '${view.given} days given, ${view.required} required — '
                    'short by ${view.shortBy}.'
                : '${view.given} days given.',
            style: HodiTextStyles.bodyMedium,
          ),
          if (view.explanation != null && view.explanation!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              view.explanation!,
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textMedium),
            ),
          ],
          if (chargeable && view.suggestedAmount > 0) ...[
            const SizedBox(height: 10),
            Text(
              'Suggested charge: KES '
              '${CurrencyFormatter.format(view.suggestedAmount)}',
              style: HodiTextStyles.currency.copyWith(
                fontSize: 14,
                color: HodiColors.warningEnd,
              ),
            ),
          ] else if (!chargeable) ...[
            const SizedBox(height: 6),
            Text(
              // Worth saying out loud: short notice is not automatically a charge.
              'Not chargeable on this property.',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textLight),
            ),
          ],
        ],
      ),
    );
  }
}

/// Who owes whom, shown as the subtraction it is.
class _SettlementCard extends StatelessWidget {
  const _SettlementCard({required this.detail});

  final VacateNoticeDetailModel detail;

  @override
  Widget build(BuildContext context) {
    final n = detail.notice;

    if (!n.hasSettlement && detail.lines.isEmpty) {
      return _Card(
        title: 'Settlement',
        child: Row(
          children: [
            const Icon(Icons.hourglass_empty,
                size: 18, color: HodiColors.textLight),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                // Not a column of noughts. "Not worked out yet" and "nothing owed" are different
                // answers, and only one of them is true here.
                'Not worked out yet. The figures appear once the settlement is prepared.',
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.textMedium),
              ),
            ),
          ],
        ),
      );
    }

    final net = n.netAmount ?? 0;
    final refund = net > 0;

    return _Card(
      title: 'Settlement',
      child: Column(
        children: [
          for (final line in detail.lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(line.description,
                            style: HodiTextStyles.bodyMedium),
                        // The reading behind a utility deduction, so a tenant can check the
                        // figure against the dial instead of taking it on trust.
                        if (line.reading != null)
                          Text(
                            'reading ${line.reading!.toStringAsFixed(0)}',
                            style: HodiTextStyles.bodySmall.copyWith(
                              fontSize: 11,
                              color: HodiColors.textLight,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${line.isDeduction ? '-' : ''}KES '
                    '${CurrencyFormatter.format(line.amount.abs())}',
                    style: HodiTextStyles.currency.copyWith(
                      fontSize: 14,
                      color: line.isDeduction
                          ? HodiColors.errorStart
                          : HodiColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          if (detail.lines.isNotEmpty)
            const Divider(height: 18, color: HodiColors.divider),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            decoration: BoxDecoration(
              color: refund ? HodiColors.successBg : HodiColors.dangerBg,
              borderRadius: HodiBorderRadius.small,
            ),
            child: Row(
              children: [
                Text(
                  // Named by direction rather than by sign. "Net -4,500" makes somebody work out
                  // which way the money goes.
                  refund ? 'REFUND TO TENANT' : 'TENANT STILL OWES',
                  style: HodiTextStyles.labelBold
                      .copyWith(fontSize: 12, color: HodiColors.textDark),
                ),
                const Spacer(),
                Text(
                  'KES ${CurrencyFormatter.format(net.abs())}',
                  style: HodiTextStyles.currency.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color:
                        refund ? HodiColors.successEnd : HodiColors.errorStart,
                  ),
                ),
              ],
            ),
          ),

          if (n.settled) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.check_circle_outline,
                    size: 15, color: HodiColors.successEnd),
                const SizedBox(width: 6),
                Text(
                  'Settled${n.settledOn != null ? ' on ${_date(n.settledOn)}' : ''}',
                  style: HodiTextStyles.bodySmall
                      .copyWith(color: HodiColors.successEnd),
                ),
              ],
            ),
          ] else if (n.balanceRemaining > 0) ...[
            const SizedBox(height: 10),
            Text(
              'KES ${CurrencyFormatter.format(n.balanceRemaining)} still to change hands.',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textMedium),
            ),
          ],
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '' : DateFormatter.formatDate(parsed);
  }
}

class _PaymentsCard extends StatelessWidget {
  const _PaymentsCard({required this.detail});

  final VacateNoticeDetailModel detail;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Paid so far',
      child: Column(
        children: [
          for (final p in detail.payments)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      [p.rrn ?? '', p.method ?? ''].where((s) => s.isNotEmpty).join(' · '),
                      style: HodiTextStyles.bodySmall,
                    ),
                  ),
                  Text(
                    'KES ${CurrencyFormatter.format(p.amount)}',
                    style: HodiTextStyles.currency.copyWith(
                      fontSize: 13,
                      color: HodiColors.successEnd,
                    ),
                  ),
                ],
              ),
            ),
          const Divider(height: 14, color: HodiColors.divider),
          Row(
            children: [
              Text('Total paid',
                  style: HodiTextStyles.bodyMedium
                      .copyWith(fontWeight: FontWeight.w600)),
              const Spacer(),
              Text(
                'KES ${CurrencyFormatter.format(detail.notice.totalPaid)}',
                style: HodiTextStyles.currency
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value, this.isLast = false});

  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 82,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
