import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/property_repository.dart';
import '../domain/property_model.dart';
import '../domain/property_detail_model.dart';
import '../domain/property_report_model.dart';

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

/// Which month the rent-collection card is showing.
///
/// A year and a month rather than legacy's CURRENT/PREVIOUS/NEXT strings, because the report is
/// asked for a real period and there is no such thing as a report of next month. Null means "the
/// month just ended", which is what the server opens on and what the card labels accordingly.
class ReportPeriod {
  final int? year;
  final int? month;

  const ReportPeriod({this.year, this.month});

  static const latest = ReportPeriod();

  bool get isLatest => year == null || month == null;

  @override
  bool operator ==(Object other) =>
      other is ReportPeriod && other.year == year && other.month == month;

  @override
  int get hashCode => Object.hash(year, month);
}

class _PropertyReportPeriodNotifier extends Notifier<ReportPeriod> {
  @override
  ReportPeriod build() => ReportPeriod.latest;
  void set(ReportPeriod value) => state = value;
}

final propertyReportPeriodProvider =
    NotifierProvider<_PropertyReportPeriodNotifier, ReportPeriod>(
  _PropertyReportPeriodNotifier.new,
);

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
/// Null data means the property has no row for that month — it was not invoiced and nothing
/// arrived — which the card says rather than showing a column of zeroes.
final propertyReportProvider =
    FutureProvider.autoDispose.family<PropertyReportModel?, String>((ref, id) async {
  final period = ref.watch(propertyReportPeriodProvider);
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
