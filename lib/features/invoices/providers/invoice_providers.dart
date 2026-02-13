import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../data/invoice_repository.dart';
import '../domain/invoice_model.dart';
import '../domain/invoice_detail_model.dart';

part 'invoice_providers.g.dart';

final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final pdfDownloader = ref.watch(pdfDownloaderProvider);
  return InvoiceRepository(apiClient: apiClient, pdfDownloader: pdfDownloader);
});

// Invoice list state per tab
class InvoiceListState {
  final List<InvoiceModel> invoices;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  const InvoiceListState({
    this.invoices = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
  });

  InvoiceListState copyWith({
    List<InvoiceModel>? invoices,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
  }) {
    return InvoiceListState(
      invoices: invoices ?? this.invoices,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

@Riverpod(keepAlive: true)
class InvoiceList extends _$InvoiceList {
  @override
  InvoiceListState build(String status) {
    Future.microtask(() => _fetchPage(0));
    return const InvoiceListState(isLoading: true);
  }

  InvoiceRepository get _repository => ref.read(invoiceRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    final filters = ref.read(filterProvider);
    final response = await _repository.getInvoices(
      status: status,
      page: page,
      searchTerm: state.searchTerm,
      estateId: filters.selectedEstateId,
      propertyId: filters.selectedPropertyId,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        invoices: page == 0 ? paged.content : [...state.invoices, ...paged.content],
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
    state = InvoiceListState(isLoading: true, searchTerm: term);
    await _fetchPage(0);
  }
}

// Invoice detail
final invoiceDetailProvider =
    FutureProvider.autoDispose.family<InvoiceDetailModel?, String>((ref, rrn) async {
  final repo = ref.watch(invoiceRepositoryProvider);
  final response = await repo.getInvoiceDetail(rrn);
  if (response.isEstateOverdue) {
    return null; // Dialog handled globally via ErrorInterceptor
  }
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load invoice');
  }
  return response.data;
});
