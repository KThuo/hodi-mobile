import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../data/property_repository.dart';
import '../domain/property_model.dart';

final propertyRepositoryProvider = Provider<PropertyRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PropertyRepository(apiClient: apiClient);
});

class PropertyListState {
  final List<PropertyModel> properties;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  const PropertyListState({
    this.properties = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
  });

  PropertyListState copyWith({
    List<PropertyModel>? properties,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
  }) {
    return PropertyListState(
      properties: properties ?? this.properties,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class PropertyListNotifier extends Notifier<PropertyListState> {
  @override
  PropertyListState build() {
    Future.microtask(() => _fetchPage(0));
    return const PropertyListState(isLoading: true);
  }

  PropertyRepository get _repository => ref.read(propertyRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.getProperties(
      page: page,
      searchTerm: state.searchTerm,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        properties: page == 0 ? paged.content : [...state.properties, ...paged.content],
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
    state = PropertyListState(isLoading: true, searchTerm: term);
    await _fetchPage(0);
  }
}

final propertyListProvider = NotifierProvider<PropertyListNotifier, PropertyListState>(
  PropertyListNotifier.new,
);
