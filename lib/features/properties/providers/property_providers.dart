import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/property_repository.dart';
import '../domain/property_model.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';
import '../../invoices/domain/billing_period.dart';
import '../../invoices/providers/invoice_providers.dart';

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
    final filters = ref.read(filterProvider);
    final response = await _repository.getProperties(
      page: page,
      searchTerm: state.searchTerm,
      estateId: filters.selectedEstateId,
      propertyId: filters.selectedPropertyId,
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

/// The three months the card offers: previous, billing, next.
///
/// Centred on the **billing** month from the server, not the calendar month from the handset. A
/// billing month can be opened late or held open, and past the invoice day the server is already
/// raising into the month ahead — so a client that decided for itself would offer a different
/// month from the one invoices are going into.
final propertyReportWindowProvider = FutureProvider<List<BillingPeriod>>((ref) async {
  final now = await ref.watch(currentBillingPeriodProvider.future);
  return now.window;
});

/// Which of the three is showing. Null until the window resolves, then the middle one.
class _ChosenPeriodNotifier extends Notifier<BillingPeriod?> {
  @override
  BillingPeriod? build() => null;
  void set(BillingPeriod value) => state = value;
}

final propertyReportPeriodProvider =
    NotifierProvider<_ChosenPeriodNotifier, BillingPeriod?>(
  _ChosenPeriodNotifier.new,
);

/// The month actually on screen: whatever was picked, or the billing month until something is.
final effectiveReportPeriodProvider = Provider<BillingPeriod?>((ref) {
  final chosen = ref.watch(propertyReportPeriodProvider);
  if (chosen != null) return chosen;
  final window = ref.watch(propertyReportWindowProvider).value;
  return window == null || window.length < 2 ? null : window[1];
});

// Property detail. The id is the hash the list row carried, passed through unchanged.
final propertyDetailProvider = FutureProvider.autoDispose
    .family<PropertyDetailModel?, String>((ref, id) async {
  final repo = ref.watch(propertyRepositoryProvider);
  final response = await repo.getPropertyDetail(id);
  if (!response.isSuccess) {
    throw Exception(
      response.message.isNotEmpty ? response.message : 'Failed to load property',
    );
  }
  return response.data;
});

/// The money, which is a separate read behind a separate authority.
///
/// Returns the whole page so the card can tell "nothing was billed that month" from "the figures
/// are nought" — the first has no rows at all, and drawing it as a collection rate of zero would
/// put a red mark against a month nobody has been asked to pay for.
///
/// A month that fails to load is a month with no figures, not a card that refuses to render: the
/// three months load independently and one of them 403-ing should not blank the other two.
final propertyReportProvider = FutureProvider.autoDispose
    .family<PropertyReportPageModel?, String>((ref, id) async {
  final period = ref.watch(effectiveReportPeriodProvider);
  if (period == null) return null;

  final repo = ref.watch(propertyRepositoryProvider);
  final response = await repo.getPropertyReport(
    propertyId: id,
    year: period.year,
    month: period.month,
  );
  if (!response.isSuccess) {
    throw Exception(
      response.message.isNotEmpty ? response.message : 'Could not read the month',
    );
  }
  return response.data;
});
