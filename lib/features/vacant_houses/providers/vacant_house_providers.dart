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
  final String? error;
  final String? searchTerm;
  final String? category;
  final String? area;

  /// "2+ beds". The server filters on a minimum rather than an exact count, which is what
  /// somebody looking for a place actually means — nobody turns down a three-bedroom because
  /// they asked for two.
  final int? minBedrooms;

  const VacantHouseListState({
    this.houses = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.category,
    this.area,
    this.minBedrooms,
  });

  bool get filtered =>
      category != null || area != null || minBedrooms != null;

  VacantHouseListState copyWith({
    List<VacantHouseModel>? houses,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    String? Function()? category,
    String? Function()? area,
    int? Function()? minBedrooms,
  }) {
    return VacantHouseListState(
      houses: houses ?? this.houses,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      category: category != null ? category() : this.category,
      area: area != null ? area() : this.area,
      minBedrooms: minBedrooms != null ? minBedrooms() : this.minBedrooms,
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
      searchTerm: state.searchTerm,
      category: state.category,
      area: state.area,
      minBedrooms: state.minBedrooms,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        houses: page == 0 ? paged.content : [...state.houses, ...paged.content],
        isLoading: false,
        hasMore: paged.hasMore,
        currentPage: page,
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

  Future<void> clearFilters() async {
    state = state.copyWith(
      houses: const [],
      isLoading: true,
      category: () => null,
      area: () => null,
      minBedrooms: () => null,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final vacantHouseListProvider =
    NotifierProvider<VacantHouseListNotifier, VacantHouseListState>(
  VacantHouseListNotifier.new,
);
