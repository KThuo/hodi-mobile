import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../data/house_repository.dart';
import '../domain/house_model.dart';
import '../domain/house_detail_model.dart';
import '../domain/house_feature_model.dart';

final houseRepositoryProvider = Provider<HouseRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return HouseRepository(apiClient: apiClient);
});

// Houses list state
class HouseListState {
  final List<HouseModel> houses;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final String? occupiedFilter; // null=all, 'true'=occupied, 'false'=vacant

  const HouseListState({
    this.houses = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.occupiedFilter,
  });

  HouseListState copyWith({
    List<HouseModel>? houses,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    String? occupiedFilter,
  }) {
    return HouseListState(
      houses: houses ?? this.houses,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      occupiedFilter: occupiedFilter ?? this.occupiedFilter,
    );
  }
}

class HouseListNotifier extends Notifier<HouseListState> {
  @override
  HouseListState build() {
    _loadInitial();
    return const HouseListState(isLoading: true);
  }

  HouseRepository get _repository => ref.read(houseRepositoryProvider);

  Future<void> _loadInitial() async {
    state = const HouseListState(isLoading: true);
    await _fetchPage(0);
  }

  Future<void> _fetchPage(int page) async {
    final response = await _repository.getHouses(
      page: page,
      searchTerm: state.searchTerm,
      occupied: state.occupiedFilter,
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
      state = state.copyWith(
        isLoading: false,
        error: response.message,
      );
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
    state = HouseListState(isLoading: true, searchTerm: term, occupiedFilter: state.occupiedFilter);
    await _fetchPage(0);
  }

  Future<void> filterByOccupancy(String? occupied) async {
    state = HouseListState(isLoading: true, searchTerm: state.searchTerm, occupiedFilter: occupied);
    await _fetchPage(0);
  }
}

final houseListProvider = NotifierProvider<HouseListNotifier, HouseListState>(
  HouseListNotifier.new,
);

// House detail
final houseDetailProvider = FutureProvider.autoDispose.family<HouseDetailModel?, int>((ref, id) async {
  final repo = ref.watch(houseRepositoryProvider);
  final response = await repo.getHouseDetail(id);
  return response.isSuccess ? response.data : null;
});

// House features
final houseFeaturesProvider = FutureProvider.autoDispose.family<List<HouseFeatureModel>, int>((ref, houseId) async {
  final repo = ref.watch(houseRepositoryProvider);
  final response = await repo.getHouseFeatures(houseId);
  return response.isSuccess ? (response.data ?? []) : [];
});
