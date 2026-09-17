import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/expense_repository.dart';
import '../domain/expense_model.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(apiClient: ref.watch(apiClientProvider));
});

/// The categories the server will accept, and nothing else.
///
/// `ExpenseRequest.category` is validated against `RECURRING|REPAIR|REFUND|UTILITY|OTHER`, so a
/// picker offering anything outside this list offers a choice that will be refused. Kept beside
/// the repository rather than typed into the form, so the form and the request agree.
const expenseCategories = <({String code, String label})>[
  (code: 'REPAIR', label: 'Repair'),
  (code: 'UTILITY', label: 'Utility'),
  (code: 'RECURRING', label: 'Recurring'),
  (code: 'REFUND', label: 'Refund'),
  (code: 'OTHER', label: 'Other'),
];

class ExpenseListState {
  final List<ExpenseModel> items;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;
  final String? category;

  const ExpenseListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
    this.category,
  });

  /// What the rows on screen come to.
  ///
  /// **Said as the total of what is shown, not of the filter.** It is the sum of the page or
  /// pages loaded so far, and a figure presented as "total expenses" that silently means "the
  /// first twenty" is a figure somebody will put in a report.
  double get loadedTotal => items.fold(0, (sum, e) => sum + e.amount);

  ExpenseListState copyWith({
    List<ExpenseModel>? items,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
    String? Function()? category,
  }) {
    return ExpenseListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
      category: category != null ? category() : this.category,
    );
  }
}

class ExpenseListNotifier extends Notifier<ExpenseListState> {
  @override
  ExpenseListState build() {
    Future.microtask(() => _fetchPage(0));
    return const ExpenseListState(isLoading: true);
  }

  ExpenseRepository get _repository => ref.read(expenseRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.list(
      page: page,
      searchTerm: state.searchTerm,
      category: state.category,
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

  Future<void> filterByCategory(String? category) async {
    state = state.copyWith(
      items: const [],
      isLoading: true,
      category: () => category,
      currentPage: 0,
    );
    await _fetchPage(0);
  }
}

final expenseListProvider =
    NotifierProvider<ExpenseListNotifier, ExpenseListState>(
  ExpenseListNotifier.new,
);

/// The standing charges behind the generated lines. Read only — see [RecurringExpenseModel].
final recurringExpensesProvider =
    FutureProvider.autoDispose<List<RecurringExpenseModel>>((ref) async {
  final filters = ref.watch(filterProvider);
  final response = await ref
      .watch(expenseRepositoryProvider)
      .recurring(propertyId: filters.selectedPropertyId, pageSize: 50);
  return response.isSuccess ? (response.data?.content ?? const []) : const [];
});
