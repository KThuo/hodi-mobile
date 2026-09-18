import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../data/vacant_house_repository.dart';
import '../domain/vacant_house_detail_model.dart';
import '../domain/vacant_house_model.dart';

final vacantHouseRepositoryProvider = Provider<VacantHouseRepository>((ref) {
  return VacantHouseRepository(apiClient: ref.watch(apiClientProvider));
});

/// Categories and areas, each with a count, from one call.
///
/// Empty rather than an error if it fails: filters are how somebody narrows a list, and a list
/// that will not render because its filter bar could not load is worse than a list with no filters.
final listingFiltersProvider = FutureProvider<ListingFilters>((ref) async {
  final response = await ref.watch(vacantHouseRepositoryProvider).filters();
  return response.isSuccess
      ? (response.data ?? const ListingFilters())
      : const ListingFilters();
});

final vacantHouseDetailProvider = FutureProvider.autoDispose
    .family<VacantHouseDetailModel?, String>((ref, id) async {
  final response =
      await ref.watch(vacantHouseRepositoryProvider).getVacantHouseDetail(id);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That listing is no longer available.');
  }
  return response.data;
});

class VacantHouseListState {
  final List<VacantHouseModel> houses;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;

  /// How many match, across every page — what the count line reports. The list holds only what
  /// has been scrolled in so far, which is a different number and not the one to show.
  final int totalElements;
  final String? error;
  final String? searchTerm;
  final String? category;
  final String? area;

  /// "2+ beds". The server filters on a minimum rather than an exact count, which is what
  /// somebody looking for a place actually means — nobody turns down a three-bedroom because
  /// they asked for two.
  final int? minBedrooms;
  final int? minBathrooms;
  final double? minRent;
  final double? maxRent;
  final bool dsq;
  final bool parking;

  /// `null` is the server's own order, which `ToLetPage.vue` labels "Newest first" and sends as
  /// no parameter at all.
  final String? sort;

  /// Where a chosen place is. Both or neither — half a coordinate is not a point.
  final double? latitude;
  final double? longitude;

  /// How far from it to look. Only meaningful while [pinned].
  final double radiusKm;

  const VacantHouseListState({
    this.houses = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.totalElements = 0,
    this.error,
    this.searchTerm,
    this.category,
    this.area,
    this.minBedrooms,
    this.minBathrooms,
    this.minRent,
    this.maxRent,
    this.dsq = false,
    this.parking = false,
    this.sort,
    this.latitude,
    this.longitude,
    this.radiusKm = 5,
  });

  /// A point has been chosen, so distance is a question that can be asked.
  bool get pinned => latitude != null && longitude != null;

  /// The filters behind "More filters" that are set. The button carries this, so a narrowed list
  /// is never unexplained.
  int get extraCount => [
        minBathrooms,
        minRent,
        maxRent,
        dsq ? true : null,
        parking ? true : null,
        category,
        area,
      ].whereType<Object>().length;

  /// Everything a "Clear" would undo — which is what the web counts, the pin included.
  int get activeCount =>
      extraCount + (minBedrooms == null ? 0 : 1) + (pinned ? 1 : 0);

  bool get filtered => activeCount > 0;

  VacantHouseListState copyWith({
    List<VacantHouseModel>? houses,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    int? totalElements,
    String? error,
    String? searchTerm,
    String? Function()? category,
    String? Function()? area,
    int? Function()? minBedrooms,
    int? Function()? minBathrooms,
    double? Function()? minRent,
    double? Function()? maxRent,
    bool? dsq,
    bool? parking,
    String? Function()? sort,
    double? Function()? latitude,
    double? Function()? longitude,
    double? radiusKm,
  }) {
    return VacantHouseListState(
      houses: houses ?? this.houses,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      totalElements: totalElements ?? this.totalElements,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      category: category != null ? category() : this.category,
      area: area != null ? area() : this.area,
      minBedrooms: minBedrooms != null ? minBedrooms() : this.minBedrooms,
      minBathrooms: minBathrooms != null ? minBathrooms() : this.minBathrooms,
      minRent: minRent != null ? minRent() : this.minRent,
      maxRent: maxRent != null ? maxRent() : this.maxRent,
      dsq: dsq ?? this.dsq,
      parking: parking ?? this.parking,
      sort: sort != null ? sort() : this.sort,
      latitude: latitude != null ? latitude() : this.latitude,
      longitude: longitude != null ? longitude() : this.longitude,
      radiusKm: radiusKm ?? this.radiusKm,
    );
  }
}

class VacantHouseListNotifier extends Notifier<VacantHouseListState> {
  @override
  VacantHouseListState build() {
    Future.microtask(() => _fetchPage(0));
    return const VacantHouseListState(isLoading: true);
  }

  VacantHouseRepository get _repository =>
      ref.read(vacantHouseRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.searchVacantHouses(
      page: page,
      category: state.category,
      area: state.area,
      minBedrooms: state.minBedrooms,
      minBathrooms: state.minBathrooms,
      minRent: state.minRent,
      maxRent: state.maxRent,
      dsq: state.dsq ? true : null,
      parking: state.parking ? true : null,
      sort: state.sort,
      latitude: state.latitude,
      longitude: state.longitude,
      // Only alongside a point. A radius with nothing to be a radius of is not a filter.
      radiusKm: state.pinned ? state.radiusKm : null,
      // With coordinates the radius is the filter, and matching the words as well would exclude
      // the next street over — which is `ToLetPage.vue`'s own reasoning.
      searchTerm: state.pinned ? null : state.searchTerm,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        houses: page == 0 ? paged.content : [...state.houses, ...paged.content],
        isLoading: false,
        hasMore: paged.hasMore,
        currentPage: page,
        totalElements: paged.totalElements,
      );
    } else {
      state = state.copyWith(isLoading: false, error: response.message);
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    state = state.copyWith(isLoading: true);
    await _fetchPage(state.currentPage + 1);
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    await _fetchPage(0);
  }

  Future<void> search(String term) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      searchTerm: term,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> filterByCategory(String? category) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      category: () => category,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> filterByArea(String? area) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      area: () => area,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> filterByBedrooms(int? minBedrooms) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      minBedrooms: () => minBedrooms,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  /// Everything behind "More filters", applied together when the sheet is dismissed.
  ///
  /// One call rather than one per field: each would refetch, so closing the sheet with four
  /// things changed would fire four searches and show the answer to the third.
  Future<void> applyMore({
    required String? category,
    required String? area,
    required int? minBathrooms,
    required double? minRent,
    required double? maxRent,
    required bool dsq,
    required bool parking,
  }) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      category: () => category,
      area: () => area,
      minBathrooms: () => minBathrooms,
      minRent: () => minRent,
      maxRent: () => maxRent,
      dsq: dsq,
      parking: parking,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  /// A place was chosen. The point replaces the words as the filter, and distance becomes an
  /// order somebody can ask for.
  Future<void> pinTo(double latitude, double longitude, String label) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      searchTerm: label,
      latitude: () => latitude,
      longitude: () => longitude,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> setRadius(double km) async {
    if (!state.pinned) return;
    state = state.copyWith(houses: const [], isLoading: true, radiusKm: km, currentPage: 0);
    await _fetchPage(0);
  }

  /// Back to matching words. Keeps whatever is typed — dropping the pin is not the same as
  /// clearing the search.
  Future<void> unpin() async {
    if (!state.pinned) return;
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      latitude: () => null,
      longitude: () => null,
      // "Nearest first" cannot survive losing the point it measured from.
      sort: () => state.sort == 'nearest' ? null : state.sort,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> sortBy(String? sort) async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      sort: () => sort,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> clearFilters() async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      category: () => null,
      area: () => null,
      minBedrooms: () => null,
      minBathrooms: () => null,
      minRent: () => null,
      maxRent: () => null,
      dsq: false,
      parking: false,
      searchTerm: '',
      latitude: () => null,
      longitude: () => null,
      sort: () => state.sort == 'nearest' ? null : state.sort,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final vacantHouseListProvider =
    NotifierProvider<VacantHouseListNotifier, VacantHouseListState>(
  VacantHouseListNotifier.new,
);
