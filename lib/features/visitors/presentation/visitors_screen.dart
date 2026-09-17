import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/visit_model.dart';
import '../providers/visit_providers.dart';
import 'widgets/visit_card.dart';

/// Who is at the gate.
///
/// **The decision is the feature.** A tenant holds `ROLE_VISIT_VIEW` and `ROLE_VISIT_DECIDE` and
/// nothing else, and the situation is always the same: somebody is standing at a gate and being
/// kept waiting. So the screen opens on the people awaiting an answer, and Approve and Refuse are
/// on the card itself — a decision that takes a tap into a detail screen first has already cost
/// the visitor the time the feature exists to save.
class VisitorsScreen extends ConsumerStatefulWidget {
  const VisitorsScreen({super.key});

  @override
  ConsumerState<VisitorsScreen> createState() => _VisitorsScreenState();
}

class _VisitorsScreenState extends ConsumerState<VisitorsScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(visitListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _decide(VisitModel visit, bool approve) async {
    final result = await ref.read(visitListProvider.notifier).decide(
          visit: visit,
          approve: approve,
        );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // The server's sentence names the visitor and says what the gate was told, which is more
      // use than "saved".
      content: Text(result.message),
      backgroundColor:
          result.ok ? HodiColors.successStart : HodiColors.errorStart,
    ));
  }

  Future<void> _checkOut(VisitModel visit) async {
    final result = await ref.read(visitListProvider.notifier).checkOut(visit);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result.message),
      backgroundColor:
          result.ok ? HodiColors.successStart : HodiColors.errorStart,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(visitListProvider);
    final summary = ref.watch(onSiteProvider).value;
    final user = ref.watch(authProvider).user;
    final canDecide = user?.hasPermission(AppPermissions.visitDecide) ?? false;
    final isGate = user?.hasPermission(AppPermissions.visitNew) ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Visitors', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      // The gate's own action, and the biggest thing on the screen for them: somebody is standing
      // at the barrier. Only for ROLE_VISIT_NEW — a tenant answers visits, they do not admit them.
      floatingActionButton: isGate
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/more/visitors/check-in'),
              backgroundColor: HodiColors.primaryStart,
              foregroundColor: HodiColors.white,
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Bring someone in'),
            )
          : null,
      body: Column(
        children: [
          if (summary != null) _Summary(summary: summary),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search visitors...',
              onChanged: (v) => ref.read(visitListProvider.notifier).search(v),
              onClear: () => ref.read(visitListProvider.notifier).search(''),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _Chip(
                  label: 'Waiting',
                  selected: state.filter == VisitFilter.awaiting,
                  onTap: () => ref
                      .read(visitListProvider.notifier)
                      .setFilter(VisitFilter.awaiting),
                ),
                const SizedBox(width: 8),
                _Chip(
                  label: 'On site',
                  selected: state.filter == VisitFilter.onSite,
                  onTap: () => ref
                      .read(visitListProvider.notifier)
                      .setFilter(VisitFilter.onSite),
                ),
                const SizedBox(width: 8),
                _Chip(
                  label: 'All',
                  selected: state.filter == VisitFilter.all,
                  onTap: () => ref
                      .read(visitListProvider.notifier)
                      .setFilter(VisitFilter.all),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildList(state, canDecide, isGate)),
        ],
      ),
    );
  }

  Widget _buildList(VisitListState state, bool canDecide, bool isGate) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 4, itemHeight: 140);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(visitListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return HodiEmptyState(
        icon: Icons.meeting_room_outlined,
        title: switch (state.filter) {
          VisitFilter.awaiting => 'Nobody waiting',
          VisitFilter.onSite => 'Nobody on site',
          VisitFilter.all => 'No visitors',
        },
        subtitle: state.filter == VisitFilter.awaiting
            ? 'Anybody at the gate will appear here'
            : 'Nothing recorded yet',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(visitListProvider.notifier).refresh(),
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
          final visit = state.items[index];
          return VisitCard(
            visit: visit,
            canDecide: canDecide,
            canCheckOut: isGate,
            onApprove: () => _decide(visit, true),
            onRefuse: () => _decide(visit, false),
            onCheckOut: () => _checkOut(visit),
          );
        },
      ),
    );
  }
}

/// On site now, and how many are being kept waiting.
class _Summary extends StatelessWidget {
  const _Summary({required this.summary});

  final OnSiteSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final waiting = summary.awaitingApproval;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        // Tinted only when somebody is actually waiting. A permanently amber header stops being
        // read within a day.
        color: waiting > 0 ? HodiColors.warningBg : HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Row(
        children: [
          Icon(
            waiting > 0 ? Icons.notifications_active_outlined : Icons.groups_outlined,
            size: 20,
            color: waiting > 0 ? HodiColors.warningEnd : HodiColors.textMedium,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              waiting > 0
                  ? '$waiting ${waiting == 1 ? 'person is' : 'people are'} waiting to be let in'
                  : '${summary.onSite} on site',
              style: HodiTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: waiting > 0 ? HodiColors.warningEnd : HodiColors.textDark,
              ),
            ),
          ),
          if (waiting > 0)
            Text(
              '${summary.onSite} on site',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textMedium),
            ),
        ],
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
