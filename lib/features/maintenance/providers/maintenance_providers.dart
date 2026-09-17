import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../data/maintenance_repository.dart';
import '../domain/maintenance_models.dart';

final maintenanceRepositoryProvider = Provider<MaintenanceRepository>((ref) {
  return MaintenanceRepository(apiClient: ref.watch(apiClientProvider));
});

/// Which requests this person is here to see.
///
/// Not a filter somebody chooses — it is who they are. A tenant has only their own; a caretaker is
/// interested first in what has been given to them; anyone with a wider view sees the estate's.
/// Offering all three as chips would ask people to pick the one that is already true of them.
enum MaintenanceScope {
  /// A tenant's own requests. `mine` on the wire.
  mine,

  /// What this person has been assigned. `assignedToMe`.
  assigned,

  /// Everything in scope, for somebody who manages rather than reports.
  all,
}

/// The scope to open on, decided from what the person holds.
///
/// Somebody who can resolve is looking at a worklist; somebody who can only raise is looking at
/// their own. `ROLE_MAINT_RESOLVE` is the caretaker's authority and is the cleanest test of which.
final maintenanceScopeProvider = Provider<MaintenanceScope>((ref) {
  final user = ref.watch(authProvider).user;
  if (user == null) return MaintenanceScope.mine;
  if (user.hasPermission(AppPermissions.maintResolve)) {
    return MaintenanceScope.assigned;
  }
  if (user.hasPermission(AppPermissions.tenantSelf)) return MaintenanceScope.mine;
  return MaintenanceScope.all;
});

class MaintenanceListState {
  final List<MaintenanceRequestModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final bool openOnly;
  final MaintenanceScope scope;

  const MaintenanceListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.openOnly = true,
    this.scope = MaintenanceScope.mine,
  });

  MaintenanceListState copyWith({
    List<MaintenanceRequestModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    bool? openOnly,
    MaintenanceScope? scope,
  }) {
    return MaintenanceListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      openOnly: openOnly ?? this.openOnly,
      scope: scope ?? this.scope,
    );
  }
}

class MaintenanceListNotifier extends Notifier<MaintenanceListState> {
  @override
  MaintenanceListState build() {
    final scope = ref.read(maintenanceScopeProvider);
    Future.microtask(() => _fetchPage(0));
    // Open only, to begin with. A repair list is a list of things still wrong; the ones that are
    // done are history and are one chip away.
    return MaintenanceListState(isLoading: true, scope: scope, openOnly: true);
  }

  MaintenanceRepository get _repository => ref.read(maintenanceRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.list(
      page: page,
      searchTerm: state.searchTerm,
      openOnly: state.openOnly,
      mine: state.scope == MaintenanceScope.mine,
      assignedToMe: state.scope == MaintenanceScope.assigned,
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

  Future<void> showOpenOnly(bool only) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      openOnly: only,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  Future<void> setScope(MaintenanceScope scope) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      scope: scope,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final maintenanceListProvider =
    NotifierProvider<MaintenanceListNotifier, MaintenanceListState>(
  MaintenanceListNotifier.new,
);

final maintenanceDetailProvider = FutureProvider.autoDispose
    .family<MaintenanceDetailModel?, String>((ref, id) async {
  final response = await ref.watch(maintenanceRepositoryProvider).detail(id);
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That request could not be loaded.');
  }
  return response.data;
});

/// What a request can be about. Asked once and kept — the catalogue changes when an estate edits
/// it, not while somebody is filling in a form.
final maintenanceCategoriesProvider =
    FutureProvider<List<MaintenanceCategoryModel>>((ref) async {
  final response = await ref.watch(maintenanceRepositoryProvider).categories();
  return response.isSuccess ? (response.data ?? const []) : const [];
});

/// The worklist counts. Only meaningful to somebody who manages the work, so the screen asks for
/// it only when they hold the authority.
final maintenanceWorkloadProvider =
    FutureProvider.autoDispose<MaintenanceWorkloadModel?>((ref) async {
  final response = await ref.watch(maintenanceRepositoryProvider).workload();
  return response.isSuccess ? response.data : null;
});
