import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../data/vacate_notice_repository.dart';
import '../domain/vacate_notice_detail_model.dart';
import '../domain/vacate_notice_model.dart';

final vacateNoticeRepositoryProvider = Provider<VacateNoticeRepository>((ref) {
  return VacateNoticeRepository(
    apiClient: ref.watch(apiClientProvider),
    pdfDownloader: ref.watch(pdfDownloaderProvider),
  );
});

/// Who is looking at this, which decides what they may do with it.
///
/// A tenant may withdraw their own notice; the office approves or refuses. Both are `/decision`,
/// with a different action, and `ROLE_VACATE_DECIDE` is what tells them apart.
final canDecideVacateProvider = Provider<bool>((ref) {
  final user = ref.watch(authProvider).user;
  return user?.hasPermission(AppPermissions.vacateDecide) ?? false;
});

/// Which notices to show. Opens on what needs an answer.
enum VacateFilter {
  pending('PENDING', 'Awaiting'),
  approved('APPROVED', 'Approved'),
  all(null, 'All');

  const VacateFilter(this.code, this.label);

  final String? code;
  final String label;
}

class VacateNoticeListState {
  final List<VacateNoticeModel> notices;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final VacateFilter filter;

  const VacateNoticeListState({
    this.notices = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.filter = VacateFilter.pending,
  });

  VacateNoticeListState copyWith({
    List<VacateNoticeModel>? notices,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    VacateFilter? filter,
  }) {
    return VacateNoticeListState(
      notices: notices ?? this.notices,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      filter: filter ?? this.filter,
    );
  }
}

class VacateNoticeListNotifier extends Notifier<VacateNoticeListState> {
  @override
  VacateNoticeListState build() {
    Future.microtask(() => _fetchPage(0));
    return const VacateNoticeListState(isLoading: true);
  }

  VacateNoticeRepository get _repository =>
      ref.read(vacateNoticeRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.getVacateNotices(
      page: page,
      searchTerm: state.searchTerm,
      status: state.filter.code,
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
      notices: const [],
      isLoading: true,
      searchTerm: term,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> setFilter(VacateFilter filter) async {
    state = state.copyWith(
      notices: const [],
      isLoading: true,
      filter: filter,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final vacateNoticeListProvider =
    NotifierProvider<VacateNoticeListNotifier, VacateNoticeListState>(
  VacateNoticeListNotifier.new,
);

final vacateNoticeDetailProvider = FutureProvider.autoDispose
    .family<VacateNoticeDetailModel?, String>((ref, id) async {
  final response =
      await ref.watch(vacateNoticeRepositoryProvider).getVacateNoticeDetail(id);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That notice could not be loaded.');
  }
  return response.data;
});
