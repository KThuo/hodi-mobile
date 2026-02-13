import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/tenant_repository.dart';
import '../domain/tenant_model.dart';
import '../domain/tenant_detail_model.dart';

final tenantRepositoryProvider = Provider<TenantRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TenantRepository(apiClient: apiClient);
});

// --- Tenant List ---

class TenantListState {
  final List<TenantModel> tenants;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  TenantListState({
    this.tenants = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
  });

  TenantListState copyWith({
    List<TenantModel>? tenants,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
  }) {
    return TenantListState(
      tenants: tenants ?? this.tenants,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class TenantListNotifier extends Notifier<TenantListState> {
  @override
  TenantListState build() {
    Future.microtask(() => _fetchPage(0));
    return TenantListState(isLoading: true);
  }

  TenantRepository get _repository => ref.read(tenantRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.getTenants(
      page: page,
      searchTerm: state.searchTerm,
      estateId: filters.selectedEstateId,
      propertyId: filters.selectedPropertyId,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        tenants: page == 0 ? paged.content : [...state.tenants, ...paged.content],
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
    state = TenantListState(
      isLoading: true,
      searchTerm: term,
    );
    await _fetchPage(0);
  }
}

final tenantListProvider = NotifierProvider<TenantListNotifier, TenantListState>(
  TenantListNotifier.new,
);

// --- Tenant Detail ---

final tenantDetailProvider =
    FutureProvider.autoDispose.family<TenantDetailModel?, String>((ref, userId) async {
  final repo = ref.watch(tenantRepositoryProvider);
  final response = await repo.getTenantDetail(userId);
  if (response.isEstateOverdue) return null;
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load tenant details');
  }
  return response.data;
});

// --- Tenant Units (reuses TenantModel, fetches occupations for a specific userId) ---

final tenantUnitsProvider =
    FutureProvider.autoDispose.family<List<TenantModel>, String>((ref, userId) async {
  final repo = ref.watch(tenantRepositoryProvider);
  final response = await repo.getTenants(userId: userId, pageSize: 100);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load units');
  }
  return response.data?.content ?? [];
});
