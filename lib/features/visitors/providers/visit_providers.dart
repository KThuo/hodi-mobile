import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../data/visit_repository.dart';
import '../domain/visit_model.dart';

final visitRepositoryProvider = Provider<VisitRepository>((ref) {
  return VisitRepository(apiClient: ref.watch(apiClientProvider));
});

/// Whose visits these are.
///
/// A tenant sees their own unit's, which the server scopes from the session; a gate sees the
/// estate's. As with repairs, this is who somebody is rather than a filter they choose.
final visitsAreMineProvider = Provider<bool>((ref) {
  final user = ref.watch(authProvider).user;
  if (user == null) return true;
  // Somebody who checks people in is working a gate, not reading their own doorbell.
  if (user.hasPermission(AppPermissions.visitNew)) return false;
  return user.hasPermission(AppPermissions.tenantSelf);
});

/// How many people are on site, and how many are waiting on an answer.
final onSiteProvider = FutureProvider.autoDispose<OnSiteSummaryModel?>((ref) async {
  final response = await ref.watch(visitRepositoryProvider).onSite();
  return response.isSuccess ? response.data : null;
});

/// Which visits the screen is showing.
enum VisitFilter {
  /// Waiting on a yes or no. The reason the screen exists, so it opens here.
  awaiting,

  /// Still on site, whatever was decided.
  onSite,

  /// Everything, newest first.
  all,
}

class VisitListState {
  final List<VisitModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final VisitFilter filter;

  const VisitListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.filter = VisitFilter.awaiting,
  });

  VisitListState copyWith({
    List<VisitModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    VisitFilter? filter,
  }) {
    return VisitListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      filter: filter ?? this.filter,
    );
  }
}

class VisitListNotifier extends Notifier<VisitListState> {
  @override
  VisitListState build() {
    Future.microtask(() => _fetchPage(0));
    return const VisitListState(isLoading: true);
  }

  VisitRepository get _repository => ref.read(visitRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final response = await _repository.list(
      page: page,
      searchTerm: state.searchTerm,
      approvalStatus: state.filter == VisitFilter.awaiting ? 'PENDING' : null,
      openOnly: state.filter == VisitFilter.onSite,
      mine: ref.read(visitsAreMineProvider),
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
    ref.invalidate(onSiteProvider);
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

  Future<void> setFilter(VisitFilter filter) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      filter: filter,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  /// Yes or no, and the row updates in place.
  ///
  /// The answer carries the updated visit, so the row is replaced from it rather than the whole
  /// list being refetched — somebody answering three people at a gate should not watch the list
  /// rebuild under their thumb between each one.
  ///
  /// Returns the server's sentence, which names the visitor and says what the gate was told.
  Future<({bool ok, String message})> decide({
    required VisitModel visit,
    required bool approve,
    String? notes,
  }) async {
    final response = await _repository.decide(
      id: visit.id,
      approve: approve,
      notes: notes,
    );

    if (response.isSuccess && response.data != null) {
      final updated = response.data!;
      // On the "awaiting" list a decided visit has stopped belonging there, so it goes; on any
      // other list it stays and shows its new answer.
      //
      // Written out rather than as a collection-if with an else: nested inside a `for`, the else
      // binds to the inner `if` and the analyser accepts it, which makes it exactly the kind of
      // wrong that compiles.
      final leaving = state.filter == VisitFilter.awaiting;
      state = state.copyWith(
        items: leaving
            ? [
                for (final v in state.items)
                  if (v.id != visit.id) v,
              ]
            : [
                for (final v in state.items)
                  if (v.id == visit.id) updated else v,
              ],
      );
      ref.invalidate(onSiteProvider);
    }

    return (
      ok: response.isSuccess,
      message: response.message.isNotEmpty
          ? response.message
          : response.isSuccess
              ? 'The gate has been told.'
              : 'That answer did not get through.',
    );
  }

  Future<({bool ok, String message})> checkOut(VisitModel visit) async {
    final response = await _repository.checkOut(visit.id);
    if (response.isSuccess) await refresh();
    return (
      ok: response.isSuccess,
      message: response.message.isNotEmpty
          ? response.message
          : response.isSuccess
              ? 'Checked out.'
              : 'That did not work.',
    );
  }
}

final visitListProvider =
    NotifierProvider<VisitListNotifier, VisitListState>(VisitListNotifier.new);
