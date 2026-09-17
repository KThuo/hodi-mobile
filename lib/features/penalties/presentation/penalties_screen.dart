import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/filters/filter_button.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../domain/penalty_models.dart';
import '../providers/penalty_providers.dart';

/// Late-payment charges, and what to do about them.
///
/// Opens on what is waiting for a decision, because that is the only state with anything to do in
/// it — the rest is a record. The three decisions are the server's three, kept distinct:
///
/// - **Apply** — put a charge held for review onto its invoice. `ROLE_PENALTY_APPLY`.
/// - **Waive** — forgive one that was correctly raised. `ROLE_PENALTY_WAIVE`.
/// - **Reverse** — say it should never have been raised. Also `ROLE_PENALTY_WAIVE`, and **not**
///   the same thing as waiving. The server keeps two reasons and two sets of timestamps precisely
///   so the difference survives, and collapsing them here would throw that away.
class PenaltiesScreen extends ConsumerStatefulWidget {
  const PenaltiesScreen({super.key});

  @override
  ConsumerState<PenaltiesScreen> createState() => _PenaltiesScreenState();
}

class _PenaltiesScreenState extends ConsumerState<PenaltiesScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(penaltyListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _decide(
    PenaltyChargeModel charge,
    PenaltyDecision decision,
  ) async {
    String? reason;

    // Applying needs no reason — it is doing what the rule already said. The other two are
    // somebody overriding it, and the server requires the why: "It is recorded against your name."
    if (decision != PenaltyDecision.apply) {
      reason = await _askReason(decision);
      if (reason == null) return;
    }

    final result = await ref.read(penaltyListProvider.notifier).decide(
          charge: charge,
          decision: decision,
          reason: reason,
        );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result.message),
      backgroundColor:
          result.ok ? HodiColors.successStart : HodiColors.errorStart,
    ));
  }

  Future<String?> _askReason(PenaltyDecision decision) async {
    final controller = TextEditingController();
    final waiving = decision == PenaltyDecision.waive;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
          title: Text(waiving ? 'Waive this charge' : 'Reverse this charge',
              style: HodiTextStyles.heading3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                waiving
                    ? 'Forgiving a charge that was correctly raised. The tenant stops owing it.'
                    : 'Saying it should never have been raised. That is a different record from '
                        'forgiving one, and it is the one to use when the rule misfired.',
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.textMedium),
              ),
              const SizedBox(height: 14),
              HodiTextField(
                controller: controller,
                labelText: 'Why',
                maxLines: 3,
                onChanged: (_) => setDialogState(() {}),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              // The server refuses a blank reason, so the button waits for one rather than
              // bouncing back with a validation message.
              onPressed: controller.text.trim().isEmpty
                  ? null
                  : () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(foregroundColor: HodiColors.errorEnd),
              child: Text(waiving ? 'Waive' : 'Reverse'),
            ),
          ],
        ),
      ),
    );

    final reason = controller.text.trim();
    controller.dispose();
    return confirmed == true && reason.isNotEmpty ? reason : null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        ref.read(penaltyListProvider.notifier).refresh();
      }
    });

    final state = ref.watch(penaltyListProvider);
    final user = ref.watch(authProvider).user;
    final canApply = user?.hasPermission(AppPermissions.penaltyApply) ?? false;
    final canWaive = user?.hasPermission(AppPermissions.penaltyWaive) ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Penalties', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search charges...',
              onChanged: (v) => ref.read(penaltyListProvider.notifier).search(v),
              onClear: () => ref.read(penaltyListProvider.notifier).search(''),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                for (final f in PenaltyFilter.values) ...[
                  _Chip(
                    label: f.label,
                    selected: state.filter == f,
                    onTap: () =>
                        ref.read(penaltyListProvider.notifier).setFilter(f),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildList(state, canApply, canWaive)),
        ],
      ),
    );
  }

  Widget _buildList(PenaltyListState state, bool canApply, bool canWaive) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 4, itemHeight: 130);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(penaltyListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return HodiEmptyState(
        icon: Icons.gavel_outlined,
        title: state.filter == PenaltyFilter.pending
            ? 'Nothing awaiting a decision'
            : 'No charges',
        subtitle: 'Nothing matches this selection',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(penaltyListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final charge = state.items[index];
          return _ChargeCard(
            charge: charge,
            canApply: canApply,
            canWaive: canWaive,
            onApply: () => _decide(charge, PenaltyDecision.apply),
            onWaive: () => _decide(charge, PenaltyDecision.waive),
            onReverse: () => _decide(charge, PenaltyDecision.reverse),
          );
        },
      ),
    );
  }
}

class _ChargeCard extends StatelessWidget {
  const _ChargeCard({
    required this.charge,
    required this.canApply,
    required this.canWaive,
    required this.onApply,
    required this.onWaive,
    required this.onReverse,
  });

  final PenaltyChargeModel charge;
  final bool canApply;
  final bool canWaive;
  final VoidCallback onApply;
  final VoidCallback onWaive;
  final VoidCallback onReverse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
        border: charge.pending
            ? Border.all(
                color: HodiColors.warningStart.withValues(alpha: 0.5),
                width: 1.5,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      charge.subjectName ?? charge.reference,
                      style: HodiTextStyles.bodyLarge
                          .copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      [
                        if (charge.houseCode != null) charge.houseCode!,
                        if (charge.ruleName != null) charge.ruleName!,
                        if (charge.sourceRef != null) charge.sourceRef!,
                      ].join(' · '),
                      style: HodiTextStyles.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'KES ${CurrencyFormatter.format(charge.amount)}',
                style: HodiTextStyles.currency.copyWith(
                  fontSize: 16,
                  color: charge.reversed || charge.waived
                      ? HodiColors.textLight
                      : HodiColors.errorStart,
                  decoration: charge.reversed || charge.waived
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _StatusPill(charge: charge),
              const Spacer(),
              // A third late month is a different conversation from a first, which is why the
              // server counts rather than leaving it to be inferred.
              if (charge.occurrence > 1)
                Text(
                  'Occurrence ${charge.occurrence}',
                  style: HodiTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: HodiColors.warningEnd,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            charge.workingOut,
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),

          if (charge.decisionReason != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: HodiColors.surfaceInset,
                borderRadius: HodiBorderRadius.small,
              ),
              child: Text(
                _decisionLine(charge),
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.textMedium),
              ),
            ),
          ],

          if (charge.pending && (canApply || canWaive)) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                if (canWaive) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onWaive,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: HodiColors.textMedium,
                        side: const BorderSide(color: HodiColors.dividerStrong),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Waive'),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
                if (canApply)
                  Expanded(
                    child: FilledButton(
                      onPressed: onApply,
                      style: FilledButton.styleFrom(
                        backgroundColor: HodiColors.primaryStart,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Apply'),
                    ),
                  ),
              ],
            ),
          ],

          // Reversing an applied charge is the correction path, and it is separate from waiving
          // one that has not been applied yet.
          if (charge.applied && canWaive) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onReverse,
                icon: const Icon(Icons.undo, size: 17),
                label: const Text('Reverse — it should not have been raised'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: HodiColors.errorStart,
                  side: const BorderSide(color: HodiColors.errorStart),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// "Waived by Jane on 14 Aug 2026 — paid the same week."
  ///
  /// Built in a function rather than inside an interpolation: the version that lived there read
  /// `a ?? b != null ? x : y`, where `??` binds looser than `!=`, so it asked whether `b != null`
  /// and fell back to `a` only when that was null. It compiled, and it was nonsense.
  static String _decisionLine(PenaltyChargeModel c) {
    final what = c.reversed ? 'Reversed' : 'Waived';
    final who = c.waivedBy ?? c.reversedBy;
    final when = DateFormatter.parseApiDate(c.waivedOn ?? c.reversedOn);

    final parts = <String>[
      what,
      if (who != null && who.isNotEmpty) 'by $who',
      if (when != null) 'on ${DateFormatter.formatDate(when)}',
    ];
    return '${parts.join(' ')} — ${c.decisionReason}';
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.charge});

  final PenaltyChargeModel charge;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (charge.status) {
      'PENDING' => (HodiColors.warningBg, HodiColors.warningEnd),
      'APPLIED' => (HodiColors.dangerBg, HodiColors.errorStart),
      'WAIVED' => (HodiColors.successBg, HodiColors.successEnd),
      'REVERSED' => (HodiColors.surfaceInset, HodiColors.textMedium),
      _ => (HodiColors.surfaceInset, HodiColors.textMedium),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(
        charge.statusLabel,
        style: HodiTextStyles.bodySmall.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}
