import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/vacant_house_detail_model.dart';
import '../providers/vacant_house_providers.dart';
import 'widgets/vacant_house_list_item.dart';

/// Somewhere to rent.
///
/// Public — no session anywhere on this screen, because somebody looking for a place to live does
/// not have an account yet.
///
/// The filters come from `GET /vacant-units/filters` in one call, and each choice carries a count.
/// That is worth using rather than hiding: a category with three units behind it is worth a tap
/// and one with none is not, and the server counted so the app would not have to search to find
/// out.
class VacantHousesScreen extends ConsumerStatefulWidget {
  const VacantHousesScreen({super.key});

  @override
  ConsumerState<VacantHousesScreen> createState() => _VacantHousesScreenState();
}

class _VacantHousesScreenState extends ConsumerState<VacantHousesScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(vacantHouseListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vacantHouseListProvider);
    final filters = ref.watch(listingFiltersProvider).value;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('To Let', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          if (state.filtered)
            TextButton(
              onPressed: () =>
                  ref.read(vacantHouseListProvider.notifier).clearFilters(),
              child: Text(
                'Clear',
                style: HodiTextStyles.bodySmall.copyWith(
                  color: HodiColors.primaryStart,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Where are you looking?',
              onChanged: (v) =>
                  ref.read(vacantHouseListProvider.notifier).search(v),
              onClear: () =>
                  ref.read(vacantHouseListProvider.notifier).search(''),
            ),
          ),

          if (filters != null && filters.areas.isNotEmpty)
            _ChoiceRow(
              choices: filters.areas,
              selected: state.area,
              onSelect: (v) =>
                  ref.read(vacantHouseListProvider.notifier).filterByArea(v),
            ),
          if (filters != null && filters.categories.isNotEmpty)
            _ChoiceRow(
              choices: filters.categories,
              selected: state.category,
              onSelect: (v) =>
                  ref.read(vacantHouseListProvider.notifier).filterByCategory(v),
            ),

          const SizedBox(height: 4),
          Expanded(child: _buildList(state)),
        ],
      ),
    );
  }

  Widget _buildList(VacantHouseListState state) {
    if (state.isLoading && state.houses.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 3, itemHeight: 260);
    }
    if (state.error != null && state.houses.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(vacantHouseListProvider.notifier).refresh(),
      );
    }
    if (state.houses.isEmpty) {
      return HodiEmptyState(
        icon: Icons.home_work_outlined,
        title: 'Nothing to show',
        subtitle: state.filtered
            ? 'Try clearing the filters'
            : 'No units are available right now',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(vacantHouseListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: state.houses.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.houses.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final house = state.houses[index];
          return VacantHouseListItem(
            house: house,
            // A public token, passed back exactly as it arrived.
            onTap: () => context.push('/vacant-houses/${house.id}'),
          );
        },
      ),
    );
  }
}

/// One row of filter chips, each carrying the server's count.
class _ChoiceRow extends StatelessWidget {
  const _ChoiceRow({
    required this.choices,
    required this.selected,
    required this.onSelect,
  });

  final List<ListingChoice> choices;
  final String? selected;
  final ValueChanged<String?> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: choices.length,
        itemBuilder: (context, i) {
          final choice = choices[i];
          final isOn = selected == choice.value;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              // Tapping the chosen one clears it, so a filter can be undone where it was set.
              onTap: () => onSelect(isOn ? null : choice.value),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isOn ? HodiColors.primaryStart : HodiColors.surfaceLight,
                  borderRadius: HodiBorderRadius.full,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      choice.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isOn ? HodiColors.white : HodiColors.textMedium,
                      ),
                    ),
                    if (choice.count > 0) ...[
                      const SizedBox(width: 6),
                      Text(
                        '${choice.count}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isOn
                              ? HodiColors.white.withValues(alpha: 0.8)
                              : HodiColors.textLight,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
