import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../data/vacant_house_repository.dart';
import '../domain/vacant_house_model.dart';
import '../domain/vacant_house_detail_model.dart';

final vacantHouseRepositoryProvider = Provider<VacantHouseRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return VacantHouseRepository(apiClient: apiClient);
});

// --- Filter options ---

final vacantHouseCategoriesProvider =
    FutureProvider<List<FilterItem>>((ref) async {
  final repo = ref.watch(vacantHouseRepositoryProvider);
  final response = await repo.getCategories();
  if (response.isSuccess && response.data != null) return response.data!;
  return [];
});

final vacantHouseTypesProvider =
    FutureProvider<List<FilterItem>>((ref) async {
  final repo = ref.watch(vacantHouseRepositoryProvider);
  final response = await repo.getHouseTypes();
  if (response.isSuccess && response.data != null) return response.data!;
  return [];
});

// --- Vacant House List ---

class VacantHouseListState {
  final List<VacantHouseModel> houses;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final String? categoryId;
  final String? houseTypeId;

  VacantHouseListState({
    this.houses = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.categoryId,
    this.houseTypeId,
  });

  VacantHouseListState copyWith({
    List<VacantHouseModel>? houses,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    String? Function()? categoryId,
    String? Function()? houseTypeId,
  }) {
    return VacantHouseListState(
      houses: houses ?? this.houses,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      categoryId: categoryId != null ? categoryId() : this.categoryId,
      houseTypeId: houseTypeId != null ? houseTypeId() : this.houseTypeId,
    );
  }
}

class VacantHouseListNotifier extends Notifier<VacantHouseListState> {
  @override
  VacantHouseListState build() {
    Future.microtask(() => _fetchPage(0));
    return VacantHouseListState(isLoading: true);
  }

  VacantHouseRepository get _repository => ref.read(vacantHouseRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.searchVacantHouses(
      page: page,
      searchTerm: state.searchTerm,
      categoryId: state.categoryId,
      houseTypeId: state.houseTypeId,
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
    state = VacantHouseListState(
      isLoading: true,
      searchTerm: term,
      categoryId: state.categoryId,
      houseTypeId: state.houseTypeId,
    );
    await _fetchPage(0);
  }

  Future<void> filterByCategory(String? id) async {
    state = VacantHouseListState(
      isLoading: true,
      searchTerm: state.searchTerm,
      categoryId: id,
      houseTypeId: state.houseTypeId,
    );
    await _fetchPage(0);
  }

  Future<void> filterByHouseType(String? id) async {
    state = VacantHouseListState(
      isLoading: true,
      searchTerm: state.searchTerm,
      categoryId: state.categoryId,
      houseTypeId: id,
    );
    await _fetchPage(0);
  }
}

final vacantHouseListProvider =
    NotifierProvider<VacantHouseListNotifier, VacantHouseListState>(
  VacantHouseListNotifier.new,
);

// --- Vacant House Detail ---

final vacantHouseDetailProvider =
    FutureProvider.autoDispose.family<VacantHouseDetailModel?, String>((ref, id) async {
  final repo = ref.watch(vacantHouseRepositoryProvider);
  final response = await repo.getVacantHouseDetail(id);
  if (response.isEstateOverdue) return null;
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load details');
  }
  return response.data;
});
