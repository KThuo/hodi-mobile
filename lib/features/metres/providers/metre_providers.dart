import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/metre_repository.dart';
import '../domain/metre_model.dart';
import '../domain/metre_history_model.dart';

final metreRepositoryProvider = Provider<MetreRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MetreRepository(apiClient: apiClient);
});

// --- Metre List ---

class MetreListState {
  final List<MetreModel> metres;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final bool? currentReadingFilter; // null=All, true=Read, false=Unread

  MetreListState({
    this.metres = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.currentReadingFilter,
  });

  MetreListState copyWith({
    List<MetreModel>? metres,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    bool? Function()? currentReadingFilter,
  }) {
    return MetreListState(
      metres: metres ?? this.metres,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      currentReadingFilter: currentReadingFilter != null
          ? currentReadingFilter()
          : this.currentReadingFilter,
    );
  }
}

class MetreListNotifier extends Notifier<MetreListState> {
  @override
  MetreListState build() {
    Future.microtask(() => _fetchPage(0));
    return MetreListState(isLoading: true);
  }

  MetreRepository get _repository => ref.read(metreRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.getMetres(
      page: page,
      read: state.currentReadingFilter,
      searchTerm: state.searchTerm,
      estateId: filters.selectedEstateId,
      propertyId: filters.selectedPropertyId,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        metres: page == 0 ? paged.content : [...state.metres, ...paged.content],
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
    state = MetreListState(
      isLoading: true,
      searchTerm: term,
      currentReadingFilter: state.currentReadingFilter,
    );
    await _fetchPage(0);
  }

  Future<void> filterByCurrentReading(bool? value) async {
    state = MetreListState(
      isLoading: true,
      searchTerm: state.searchTerm,
      currentReadingFilter: value,
    );
    await _fetchPage(0);
  }
}

final metreListProvider = NotifierProvider<MetreListNotifier, MetreListState>(
  MetreListNotifier.new,
);

// --- Metre History ---

class MetreHistoryState {
  final List<MetreHistoryModel> histories;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final int year;

  MetreHistoryState({
    this.histories = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    int? year,
  }) : year = year ?? DateTime.now().year;

  MetreHistoryState copyWith({
    List<MetreHistoryModel>? histories,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    int? year,
  }) {
    return MetreHistoryState(
      histories: histories ?? this.histories,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      year: year ?? this.year,
    );
  }
}

/// Holds the currently viewed metre ID for history screen.
class _SelectedMetreIdNotifier extends Notifier<String> {
  @override
  String build() => '';
  void set(String value) => state = value;
}

final selectedMetreIdProvider =
    NotifierProvider<_SelectedMetreIdNotifier, String>(_SelectedMetreIdNotifier.new);

class MetreHistoryNotifier extends Notifier<MetreHistoryState> {
  @override
  MetreHistoryState build() {
    final metreId = ref.watch(selectedMetreIdProvider);
    if (metreId.isNotEmpty) {
      Future.microtask(() => _fetchPage(0));
      return MetreHistoryState(isLoading: true);
    }
    return MetreHistoryState();
  }

  MetreRepository get _repository => ref.read(metreRepositoryProvider);
  String get _metreId => ref.read(selectedMetreIdProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.getMetreHistory(
      page: page,
      metreId: _metreId,
      year: state.year,
      searchTerm: state.searchTerm,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        histories: page == 0 ? paged.content : [...state.histories, ...paged.content],
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
    state = MetreHistoryState(
      isLoading: true,
      searchTerm: term,
      year: state.year,
    );
    await _fetchPage(0);
  }

  Future<void> filterByYear(int year) async {
    state = MetreHistoryState(
      isLoading: true,
      searchTerm: state.searchTerm,
      year: year,
    );
    await _fetchPage(0);
  }
}

final metreHistoryProvider =
    NotifierProvider<MetreHistoryNotifier, MetreHistoryState>(
  MetreHistoryNotifier.new,
);
