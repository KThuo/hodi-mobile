import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../providers/maintenance_providers.dart';
import 'widgets/maintenance_list_item.dart';
import 'widgets/raise_request_sheet.dart';

/// Repairs.
///
/// One screen for two audiences, because the server serves them from one endpoint and the
/// difference between them is which rows come back rather than which page they are on.
///
/// - A **tenant** holds `ROLE_MAINT_{VIEW,NEW}`: their own requests, and a button to raise one.
/// - A **caretaker** holds `ROLE_MAINT_{NEW,RESOLVE}`: what has been assigned to them, and a way
///   to say it is done.
///
/// The scope opens on whichever of those the person is, rather than asking them to choose between
/// chips labelled with something already true of them.
class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  ConsumerState<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(maintenanceListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _raise() async {
    final raised = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const RaiseRequestSheet(),
    );
    if (raised == true) {
      await ref.read(maintenanceListProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(maintenanceListProvider);
    final user = ref.watch(authProvider).user;
    final canRaise = user?.hasPermission(AppPermissions.maintNew) ?? false;
    final manages = user?.hasPermission(AppPermissions.maintResolve) ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Repairs', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: canRaise
          ? FloatingActionButton.extended(
              onPressed: _raise,
              backgroundColor: HodiColors.primaryStart,
              foregroundColor: HodiColors.white,
              icon: const Icon(Icons.add),
              label: const Text('Report'),
            )
          : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search repairs...',
              onChanged: (v) =>
                  ref.read(maintenanceListProvider.notifier).search(v),
              onClear: () =>
                  ref.read(maintenanceListProvider.notifier).search(''),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _Chip(
                  label: 'Open',
                  selected: state.openOnly,
                  onTap: () => ref
                      .read(maintenanceListProvider.notifier)
                      .showOpenOnly(true),
                ),
                const SizedBox(width: 8),
                _Chip(
                  label: 'All',
                  selected: !state.openOnly,
                  onTap: () => ref
                      .read(maintenanceListProvider.notifier)
                      .showOpenOnly(false),
                ),
                // Only for somebody who has both a worklist and a wider view. A tenant has one
                // scope and would be choosing between two names for it.
                if (manages) ...[
                  const SizedBox(width: 16),
                  _Chip(
                    label: 'Mine',
                    selected: state.scope == MaintenanceScope.assigned,
                    onTap: () => ref
                        .read(maintenanceListProvider.notifier)
                        .setScope(MaintenanceScope.assigned),
                  ),
                  const SizedBox(width: 8),
                  _Chip(
                    label: 'Everything',
                    selected: state.scope == MaintenanceScope.all,
                    onTap: () => ref
                        .read(maintenanceListProvider.notifier)
                        .setScope(MaintenanceScope.all),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildList(state, canRaise)),
        ],
      ),
    );
  }

  Widget _buildList(MaintenanceListState state, bool canRaise) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 4, itemHeight: 110);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(maintenanceListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return HodiEmptyState(
        icon: Icons.build_outlined,
        title: state.openOnly ? 'Nothing open' : 'No repairs',
        subtitle: canRaise
            ? 'Report something and it will appear here'
            : 'Nothing has been reported yet',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(maintenanceListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = state.items[index];
          return MaintenanceListItem(
            request: item,
            onTap: () => context.push('/more/maintenance/${item.id}'),
          );
        },
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
