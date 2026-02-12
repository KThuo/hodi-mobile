import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/utils/pdf_downloader.dart';
import '../data/payment_repository.dart';
import '../domain/payment_model.dart';
import '../domain/payment_detail_model.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final pdfDownloader = ref.watch(pdfDownloaderProvider);
  return PaymentRepository(apiClient: apiClient, pdfDownloader: pdfDownloader);
});

// Payment list state
class PaymentListState {
  final List<PaymentModel> payments;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  const PaymentListState({
    this.payments = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
  });

  PaymentListState copyWith({
    List<PaymentModel>? payments,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
  }) {
    return PaymentListState(
      payments: payments ?? this.payments,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class PaymentListNotifier extends Notifier<PaymentListState> {
  @override
  PaymentListState build() {
    Future.microtask(() => _fetchPage(0));
    return const PaymentListState(isLoading: true);
  }

  PaymentRepository get _repository => ref.read(paymentRepositoryProvider);

  bool get _isTenant {
    final authState = ref.read(authProvider);
    final authorities = authState.user?.authorities ?? [];
    return authorities.contains(AppPermissions.tenantAccessView) &&
        !authorities.contains(AppPermissions.paymentsView);
  }

  Future<void> _fetchPage(int page) async {
    final response = await _repository.getPayments(
      page: page,
      searchTerm: state.searchTerm,
      isTenant: _isTenant,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        payments: page == 0 ? paged.content : [...state.payments, ...paged.content],
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
    state = PaymentListState(isLoading: true, searchTerm: term);
    await _fetchPage(0);
  }
}

final paymentListProvider = NotifierProvider<PaymentListNotifier, PaymentListState>(
  PaymentListNotifier.new,
);

// Payment detail
final paymentDetailProvider =
    FutureProvider.autoDispose.family<PaymentDetailModel?, String>((ref, rrn) async {
  final repo = ref.watch(paymentRepositoryProvider);
  final response = await repo.getPaymentDetail(rrn);
  if (response.isEstateOverdue) {
    return null; // Dialog handled globally via ErrorInterceptor
  }
  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty ? response.message : 'Failed to load payment');
  }
  return response.data;
});
