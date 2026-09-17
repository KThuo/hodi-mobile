import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/penalty_repository.dart';
import '../domain/penalty_models.dart';

final penaltyRepositoryProvider = Provider<PenaltyRepository>((ref) {
  return PenaltyRepository(apiClient: ref.watch(apiClientProvider));
});

/// Which charges the screen is showing.
///
/// Opens on what is waiting for somebody, because that is the only state with anything to do in
/// it. The rest is a record.
enum PenaltyFilter {
  pending('PENDING', 'Awaiting'),
  applied('APPLIED', 'On invoices'),
  waived('WAIVED', 'Waived'),
  all(null, 'All');

  const PenaltyFilter(this.code, this.label);

  final String? code;
  final String label;
}

class PenaltyListState {
  final List<PenaltyChargeModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final PenaltyFilter filter;

  const PenaltyListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.filter = PenaltyFilter.pending,
  });

  PenaltyListState copyWith({
    List<PenaltyChargeModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    PenaltyFilter? filter,
  }) {
    return PenaltyListState(
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

class PenaltyListNotifier extends Notifier<PenaltyListState> {
  @override
  PenaltyListState build() {
    Future.microtask(() => _fetchPage(0));
    return const PenaltyListState(isLoading: true);
  }

  PenaltyRepository get _repository => ref.read(penaltyRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.charges(
      page: page,
      searchTerm: state.searchTerm,
      status: state.filter.code,
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

  Future<void> setFilter(PenaltyFilter filter) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      filter: filter,
      currentPage: 0,
    );
    await _fetchPage(0);
  }

  /// Apply, waive or reverse, with the row updated from the answer.
  ///
  /// A decided charge leaves the Awaiting list rather than sitting in it answered, exactly as a
  /// decided visit does — same reasoning, and the two screens should not behave differently.
  Future<({bool ok, String message})> decide({
    required PenaltyChargeModel charge,
    required PenaltyDecision decision,
    String? reason,
  }) async {
    final response = switch (decision) {
      PenaltyDecision.apply => await _repository.apply(charge.id),
      PenaltyDecision.waive =>
        await _repository.waive(id: charge.id, reason: reason ?? ''),
      PenaltyDecision.reverse =>
        await _repository.reverse(id: charge.id, reason: reason ?? ''),
    };

    if (response.isSuccess && response.data != null) {
      final updated = response.data!;
      final leaving = state.filter == PenaltyFilter.pending;
      state = state.copyWith(
        items: leaving
            ? [
                for (final c in state.items)
                  if (c.id != charge.id) c,
              ]
            : [
                for (final c in state.items)
                  if (c.id == charge.id) updated else c,
              ],
      );
    }

    return (
      ok: response.isSuccess,
      message: response.message.isNotEmpty
          ? response.message
          : response.isSuccess
              ? 'Done.'
              : 'That decision did not go through.',
    );
  }
}

enum PenaltyDecision { apply, waive, reverse }

final penaltyListProvider =
    NotifierProvider<PenaltyListNotifier, PenaltyListState>(
  PenaltyListNotifier.new,
);

/// Every charge raised against one invoice, for the invoice page.
final invoicePenaltiesProvider = FutureProvider.autoDispose
    .family<List<PenaltyChargeModel>, String>((ref, invoiceId) async {
  final response =
      await ref.watch(penaltyRepositoryProvider).forInvoice(invoiceId);
  // A penalties module the caller cannot read should not fail an invoice page. `hodi-f` swallows
  // this same call for the same reason.
  return response.isSuccess ? (response.data ?? const []) : const [];
});
