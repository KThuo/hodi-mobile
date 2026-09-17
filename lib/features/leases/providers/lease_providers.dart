import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../data/lease_repository.dart';
import '../domain/lease_models.dart';

final leaseRepositoryProvider = Provider<LeaseRepository>((ref) {
  return LeaseRepository(
    apiClient: ref.watch(apiClientProvider),
    pdfDownloader: ref.watch(pdfDownloaderProvider),
  );
});

/// Whether this person reads agreements as staff or as the tenant of one.
///
/// Decided from the authority rather than attempted and recovered from: trying the staff path and
/// reading a 403 as "must be a tenant then" would make every refusal look like a role, including
/// the ones that are not.
final readsOwnLeaseProvider = Provider<bool>((ref) {
  final user = ref.watch(authProvider).user;
  return !(user?.hasPermission(AppPermissions.leaseView) ?? false);
});

class LeaseListState {
  final List<LeaseModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  /// Showing only what needs renewing, which is its own endpoint rather than a filter.
  final bool expiringOnly;

  const LeaseListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.expiringOnly = false,
  });

  LeaseListState copyWith({
    List<LeaseModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    bool? expiringOnly,
  }) {
    return LeaseListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      expiringOnly: expiringOnly ?? this.expiringOnly,
    );
  }
}

class LeaseListNotifier extends Notifier<LeaseListState> {
  @override
  LeaseListState build() {
    Future.microtask(() => _fetchPage(0));
    return const LeaseListState(isLoading: true);
  }

  LeaseRepository get _repository => ref.read(leaseRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = state.expiringOnly
        ? await _repository.expiring(page: page)
        : await _repository.list(
            page: page,
            searchTerm: state.searchTerm,
            estateId: filters.selectedEstateId,
            propertyId: filters.selectedPropertyId,
          );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        items: page == 0 ? paged.content : [...state.items, ...paged.content],
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
      items: const [],
      isLoading: true,
      searchTerm: term,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> showExpiringOnly(bool only) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      expiringOnly: only,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final leaseListProvider =
    NotifierProvider<LeaseListNotifier, LeaseListState>(LeaseListNotifier.new);

final leaseDetailProvider =
    FutureProvider.autoDispose.family<LeaseDetailModel?, String>((ref, id) async {
  final mine = ref.watch(readsOwnLeaseProvider);
  final response = await ref.watch(leaseRepositoryProvider).detail(id, mine: mine);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That agreement could not be opened.');
  }
  return response.data;
});
