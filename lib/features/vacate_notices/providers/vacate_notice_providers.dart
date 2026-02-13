import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/vacate_notice_repository.dart';
import '../domain/vacate_notice_model.dart';
import '../domain/vacate_notice_detail_model.dart';

final vacateNoticeRepositoryProvider = Provider<VacateNoticeRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return VacateNoticeRepository(apiClient: apiClient);
});

// --- Vacate Notice List ---

class VacateNoticeListState {
  final List<VacateNoticeModel> notices;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final String? statusFilter;

  VacateNoticeListState({
    this.notices = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.statusFilter,
  });

  VacateNoticeListState copyWith({
    List<VacateNoticeModel>? notices,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    String? Function()? statusFilter,
  }) {
    return VacateNoticeListState(
      notices: notices ?? this.notices,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      statusFilter: statusFilter != null ? statusFilter() : this.statusFilter,
    );
  }
}

class VacateNoticeListNotifier extends Notifier<VacateNoticeListState> {
  @override
  VacateNoticeListState build() {
    Future.microtask(() => _fetchPage(0));
    return VacateNoticeListState(isLoading: true);
  }

  VacateNoticeRepository get _repository => ref.read(vacateNoticeRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.getVacateNotices(
      page: page,
      status: state.statusFilter,
      searchTerm: state.searchTerm,
      estateId: filters.selectedEstateId,
      propertyId: filters.selectedPropertyId,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        notices: page == 0 ? paged.content : [...state.notices, ...paged.content],
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
    state = VacateNoticeListState(
      isLoading: true,
      searchTerm: term,
      statusFilter: state.statusFilter,
    );
    await _fetchPage(0);
  }

  Future<void> filterByStatus(String? status) async {
    state = VacateNoticeListState(
      isLoading: true,
      searchTerm: state.searchTerm,
      statusFilter: status,
    );
    await _fetchPage(0);
  }
}

final vacateNoticeListProvider =
    NotifierProvider<VacateNoticeListNotifier, VacateNoticeListState>(
  VacateNoticeListNotifier.new,
);

// --- Vacate Notice Detail ---

final vacateNoticeDetailProvider =
    FutureProvider.autoDispose.family<VacateNoticeDetailModel?, String>((ref, id) async {
  final repo = ref.watch(vacateNoticeRepositoryProvider);
  final response = await repo.getVacateNoticeDetail(id);
  if (response.isEstateOverdue) return null;
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load notice details');
  }
  return response.data;
});
