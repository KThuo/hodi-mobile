import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/browse_filters.dart';
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
              // The web's words. Somebody comparing the two should not have to work out that
              // these are the same box.
              hintText: 'Where do you want to live',
              onChanged: (v) =>
                  ref.read(vacantHouseListProvider.notifier).search(v),
              onClear: () =>
                  ref.read(vacantHouseListProvider.notifier).search(''),
            ),
          ),

          // Bedrooms lead, as they do on the web: it is the filter somebody arrives with already
          // decided. Capped by what is actually listed, so there is no "4+" over an estate whose
          // largest unit has two.
          BedroomPills(
            value: state.minBedrooms,
            max: _bedroomCap(filters?.maxBedrooms ?? 0),
            onChanged: (n) =>
                ref.read(vacantHouseListProvider.notifier).filterByBedrooms(n),
          ),

          FilterActionsRow(
            activeCount: state.extraCount,
            onMore: () => _openMore(state, filters),
            sortLabel: _sortLabel(state.sort),
            onSort: () => _openSort(state.sort),
          ),

          ResultCountLine(
            text: _countText(state),
            activeCount: state.activeCount,
            onClear: () {
              _searchController.clear();
              ref.read(vacantHouseListProvider.notifier).clearFilters();
            },
          ),

          Expanded(child: _buildList(state)),
        ],
      ),
    );
  }

  /// The web offers 1+ through 4+. Fewer where fewer are listed; never more.
  int _bedroomCap(int listed) => listed < 1 ? 0 : (listed > 4 ? 4 : listed);

  /// `newest` is the server's own order and is sent as no parameter at all, which is exactly what
  /// `ToLetPage.vue` does with it. Carrying it as a value rather than as null keeps a dismissed
  /// sort sheet — which returns null — distinguishable from a chosen "Newest first".
  ///
  /// The web also offers "Nearest first". It is left out here because it needs a pinned place to
  /// be nearest to, and this screen has no place autocomplete to pin one with; an option that
  /// silently does nothing is worse than one that is absent.
  static const _sorts = <({String value, String label})>[
    (value: 'newest', label: 'Newest first'),
    (value: 'rent', label: 'Rent: low to high'),
    (value: '-rent', label: 'Rent: high to low'),
  ];

  String _sortLabel(String? sort) => _sorts
      .firstWhere((o) => o.value == (sort ?? 'newest'), orElse: () => _sorts.first)
      .label;

  String _countText(VacantHouseListState state) {
    if (state.isLoading && state.houses.isEmpty) return 'Searching\u2026';
    if (state.houses.isEmpty) {
      return state.filtered
          ? 'Nothing matches those filters'
          : 'Nothing is available right now';
    }
    final n = state.totalElements;
    return '$n available';
  }

  Future<void> _openSort(String? current) async {
    final picked = await showSortSheet<String>(
      context: context,
      options: _sorts,
      selected: current ?? 'newest',
    );
    // Null here means dismissed, not "Newest first" — that arrives as its own value.
    if (picked == null || !mounted) return;
    await ref
        .read(vacantHouseListProvider.notifier)
        .sortBy(picked == 'newest' ? null : picked);
  }

  void _openMore(VacantHouseListState state, ListingFilters? filters) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _MoreFilters(state: state, filters: filters),
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

/// Everything the web keeps behind "More filters", in the same order.
///
/// Held locally and applied on "Show results" rather than refetching per keystroke: a rent box
/// that searches as somebody types searches for 1, then 10, then 100.
class _MoreFilters extends ConsumerStatefulWidget {
  const _MoreFilters({required this.state, required this.filters});

  final VacantHouseListState state;
  final ListingFilters? filters;

  @override
  ConsumerState<_MoreFilters> createState() => _MoreFiltersState();
}

class _MoreFiltersState extends ConsumerState<_MoreFilters> {
  late final TextEditingController _minRent;
  late final TextEditingController _maxRent;
  late final TextEditingController _minBaths;

  String? _category;
  String? _area;
  late bool _dsq;
  late bool _parking;

  @override
  void initState() {
    super.initState();
    final s = widget.state;
    _minRent = TextEditingController(text: _plain(s.minRent));
    _maxRent = TextEditingController(text: _plain(s.maxRent));
    _minBaths = TextEditingController(text: s.minBathrooms?.toString() ?? '');
    _category = s.category;
    _area = s.area;
    _dsq = s.dsq;
    _parking = s.parking;
  }

  /// No decimal tail on a rent. "45000", not "45000.0".
  static String _plain(double? value) =>
      value == null ? '' : value.truncateToDouble() == value
          ? value.toInt().toString()
          : value.toString();

  @override
  void dispose() {
    _minRent.dispose();
    _maxRent.dispose();
    _minBaths.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _minRent.clear();
      _maxRent.clear();
      _minBaths.clear();
      _category = null;
      _area = null;
      _dsq = false;
      _parking = false;
    });
  }

  void _apply() {
    Navigator.of(context).pop();
    ref.read(vacantHouseListProvider.notifier).applyMore(
          category: _category,
          area: _area,
          minBathrooms: int.tryParse(_minBaths.text.trim()),
          minRent: double.tryParse(_minRent.text.trim()),
          maxRent: double.tryParse(_maxRent.text.trim()),
          dsq: _dsq,
          parking: _parking,
        );
  }

  @override
  Widget build(BuildContext context) {
    final filters = widget.filters;

    return FilterSheet(
      onApply: _apply,
      onReset: _reset,
      children: [
        if (filters != null && filters.categories.isNotEmpty)
          FilterField(
            label: 'Kind of home',
            child: _Choices(
              choices: filters.categories,
              selected: _category,
              onSelect: (v) => setState(() => _category = v),
            ),
          ),
        if (filters != null && filters.areas.isNotEmpty)
          FilterField(
            label: 'Area',
            child: _Choices(
              choices: filters.areas,
              selected: _area,
              onSelect: (v) => setState(() => _area = v),
            ),
          ),
        FilterField(
          label: 'Rent per month',
          child: Row(
            children: [
              Expanded(
                child: FilterNumberField(
                    controller: _minRent, hint: 'Minimum rent'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('\u2013'),
              ),
              Expanded(
                child: FilterNumberField(
                    controller: _maxRent, hint: 'Maximum rent'),
              ),
            ],
          ),
        ),
        FilterField(
          label: 'Bathrooms',
          child: FilterNumberField(
              controller: _minBaths, hint: 'Minimum bathrooms'),
        ),
        const SizedBox(height: 10),
        FilterCheck(
          label: 'Parking',
          value: _parking,
          onChanged: (v) => setState(() => _parking = v),
        ),
        FilterCheck(
          label: 'Has DSQ',
          value: _dsq,
          onChanged: (v) => setState(() => _dsq = v),
        ),
      ],
    );
  }
}

/// The server's choices, each with the count it came with.
///
/// The count is the point: a category with three units behind it is worth a tap and one with none
/// is not, and the server counted so the app would not have to search to find out.
class _Choices extends StatelessWidget {
  const _Choices({
    required this.choices,
    required this.selected,
    required this.onSelect,
  });

  final List<ListingChoice> choices;
  final String? selected;
  final ValueChanged<String?> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final choice in choices)
          GestureDetector(
            // Tapping the chosen one clears it, so a filter can be undone where it was set.
            onTap: () =>
                onSelect(selected == choice.value ? null : choice.value),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              decoration: BoxDecoration(
                color: selected == choice.value
                    ? HodiColors.primaryStart
                    : HodiColors.surfaceLight,
                borderRadius: HodiBorderRadius.full,
                border: Border.all(
                  color: selected == choice.value
                      ? HodiColors.primaryStart
                      : HodiColors.divider,
                ),
              ),
              child: Text(
                // "Apartment (12)", as the web composes it.
                choice.count > 0
                    ? '${choice.label} (${choice.count})'
                    : choice.label,
                style: HodiTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selected == choice.value
                      ? HodiColors.white
                      : HodiColors.textMedium,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
