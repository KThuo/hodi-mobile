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
import '../../../core/widgets/place_field.dart';
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
          // A place, not words. Choosing one captures a point, and a point is what lets the
          // search say "within 5 km" and "nearest first" — see [PlaceField], which degrades to
          // a plain text box wherever Places is unavailable.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: PlaceField(
              controller: _searchController,
              hintText: 'Where do you want to live',
              pinned: state.pinned,
              onText: (text) =>
                  ref.read(vacantHouseListProvider.notifier).search(text ?? ''),
              onPlace: (place) => ref
                  .read(vacantHouseListProvider.notifier)
                  .pinTo(place.latitude, place.longitude, place.name),
              onClearPin: () =>
                  ref.read(vacantHouseListProvider.notifier).unpin(),
            ),
          ),

          // Only once there is a point to be a radius of.
          if (state.pinned)
            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final km in _radii) ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterTapButton(
                        onTap: () => ref
                            .read(vacantHouseListProvider.notifier)
                            .setRadius(km),
                        icon: Icons.my_location,
                        label: 'Within ${km.toInt()} km',
                        emphasised: state.radiusKm == km,
                      ),
                    ),
                  ],
                ],
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
            sortLabel: _sortLabel(state.sort, state.pinned),
            onSort: () => _openSort(state.sort, state.pinned),
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

  /// The distances `ToLetPage.vue` offers, unchanged.
  static const _radii = <double>[1, 2, 5, 10, 25];

  /// The web offers 1+ through 4+. Fewer where fewer are listed; never more.
  int _bedroomCap(int listed) => listed < 1 ? 0 : (listed > 4 ? 4 : listed);

  /// `newest` is the server's own order and is sent as no parameter at all, which is exactly what
  /// `ToLetPage.vue` does with it. Carrying it as a value rather than as null keeps a dismissed
  /// sort sheet — which returns null — distinguishable from a chosen "Newest first".
  ///
  /// "Nearest first" is offered only once a place has been chosen, because that is the only time
  /// there is anything to be nearest to. Offering it always would be an option that silently
  /// does nothing.
  static List<({String value, String label})> _sortsFor(bool pinned) => [
        const (value: 'newest', label: 'Newest first'),
        const (value: 'rent', label: 'Rent: low to high'),
        const (value: '-rent', label: 'Rent: high to low'),
        if (pinned) const (value: 'nearest', label: 'Nearest first'),
      ];

  String _sortLabel(String? sort, bool pinned) => _sortsFor(pinned)
      .firstWhere((o) => o.value == (sort ?? 'newest'),
          orElse: () => _sortsFor(pinned).first)
      .label;

  String _countText(VacantHouseListState state) {
    if (state.isLoading && state.houses.isEmpty) return 'Searching\u2026';
    if (state.houses.isEmpty) {
      return state.filtered
          ? 'Nothing matches those filters'
          : 'Nothing is available right now';
    }
    final n = state.totalElements;
    return state.pinned
        ? '$n available within ${state.radiusKm.toInt()} km'
        : '$n available';
  }

  Future<void> _openSort(String? current, bool pinned) async {
    final picked = await showSortSheet<String>(
      context: context,
      options: _sortsFor(pinned),
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
      _dsq = false;
      _parking = false;
    });
  }

  void _apply() {
    Navigator.of(context).pop();
    ref.read(vacantHouseListProvider.notifier).applyMore(
          category: _category,
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
