import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../invoices/domain/invoice_model.dart';
import '../../invoices/providers/invoice_providers.dart';
import '../../payments/domain/payment_model.dart';
import '../../payments/providers/payment_providers.dart';
import '../data/occupation_repository.dart';
import '../domain/occupation_model.dart';
import '../domain/tenancy_balance_model.dart';

final occupationRepositoryProvider = Provider<OccupationRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return OccupationRepository(apiClient: apiClient);
});

/// Who occupies a unit right now. Null data is a vacant unit, not a failure.
final occupationOfHouseProvider =
    FutureProvider.autoDispose.family<OccupationModel?, String>((ref, houseId) async {
  final repo = ref.watch(occupationRepositoryProvider);
  final response = await repo.occupationOfHouse(houseId);
  // A caretaker looking at a unit should still see the unit when the tenancy read fails, so this
  // returns null rather than throwing: the screen renders "no current tenant" either way, and the
  // alternative is a whole page of error because of a card on it.
  if (!response.isSuccess) return null;
  return response.data;
});

final tenancyBalanceProvider =
    FutureProvider.autoDispose.family<TenancyBalanceModel?, String>((ref, occupationId) async {
  final repo = ref.watch(occupationRepositoryProvider);
  final response = await repo.balance(occupationId);
  if (!response.isSuccess) {
    throw Exception(
        response.message.isNotEmpty ? response.message : 'Could not read the balance');
  }
  return response.data;
});

class OccupationListState {
  final List<OccupationModel> occupations;
  final bool isLoading;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchTerm;

  const OccupationListState({
    this.occupations = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchTerm,
  });

  OccupationListState copyWith({
    List<OccupationModel>? occupations,
    bool? isLoading,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchTerm,
  }) {
    return OccupationListState(
      occupations: occupations ?? this.occupations,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

/// "My houses" — the caller's own tenancies, and nobody else's.
///
/// `mine: true` on every request, unconditionally. It used to be sent only for somebody who holds
/// no `ROLE_TENANT_VIEW`, on the reasoning that staff could reuse the list; that made a screen
/// titled "My Houses" show the whole estate to anybody who is both a landlord and a tenant, and
/// everything to a superadmin. The title is the specification here.
///
/// Whose rows `mine` means is read from the session and never from a parameter, so this narrows
/// the answer and cannot be made to widen it.
class OccupationListNotifier extends Notifier<OccupationListState> {
  @override
  OccupationListState build() {
    Future.microtask(() => _fetchPage(0));
    return const OccupationListState(isLoading: true);
  }

  OccupationRepository get _repository => ref.read(occupationRepositoryProvider);

  Future<void> _fetchPage(int page) async {
    // No estate or property filter. They narrow within a scope this list has already narrowed to
    // one person, so the only thing they can do here is hide one of somebody's own houses.
    final response = await _repository.getOccupations(
      page: page,
      mine: true,
      searchTerm: state.searchTerm,
    );

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      state = state.copyWith(
        occupations:
            page == 0 ? paged.content : [...state.occupations, ...paged.content],
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
    state = OccupationListState(isLoading: true, searchTerm: term);
    await _fetchPage(0);
  }
}

final occupationListProvider =
    NotifierProvider<OccupationListNotifier, OccupationListState>(
  OccupationListNotifier.new,
);

// ── One tenancy's invoices and payments ─────────────────────────────────────
//
// Both are filtered by `occupationId`, which narrows within the caller's scope and cannot widen
// it: the tenancy scope answers a tenant with their own rows whatever the query string says, and
// ids are salted per user, so another tenant's hash does not decode to their tenancy.
//
// "Load more" grows the page size rather than appending a page. A tenancy has tens of rows, not
// thousands, and re-asking for a slightly longer list keeps the two tabs stateless — an appending
// notifier per tab is three times the code to save a request somebody makes once.

const _tenancyPageStep = 20;

class _TenancyPageSizeNotifier extends Notifier<int> {
  @override
  int build() => _tenancyPageStep;
  void more() => state = state + _tenancyPageStep;
  void reset() => state = _tenancyPageStep;
}

final tenancyInvoicePageSizeProvider =
    NotifierProvider<_TenancyPageSizeNotifier, int>(_TenancyPageSizeNotifier.new);

final tenancyPaymentPageSizeProvider =
    NotifierProvider<_TenancyPageSizeNotifier, int>(_TenancyPageSizeNotifier.new);

/// A page of rows and whether the server has more of them.
class TenancyRows<T> {
  final List<T> rows;
  final bool hasMore;

  const TenancyRows({required this.rows, required this.hasMore});
}

/// This tenancy's invoices, newest first, every status.
///
/// No status tab here. On the estate-wide list a caretaker is chasing what is owed and filters to
/// it; inside one tenancy the question is "what have I been billed", and hiding the settled ones
/// would leave somebody unable to find the invoice a receipt refers to.
final tenancyInvoicesProvider = FutureProvider.autoDispose
    .family<TenancyRows<InvoiceModel>, String>((ref, occupationId) async {
  final pageSize = ref.watch(tenancyInvoicePageSizeProvider);
  final repo = ref.watch(invoiceRepositoryProvider);
  final response = await repo.getInvoices(
    // The list's own "all statuses" value. '0' would mean the outstanding tab.
    status: '',
    page: 0,
    pageSize: pageSize,
    occupationId: occupationId,
  );
  if (!response.isSuccess) {
    throw Exception(
        response.message.isNotEmpty ? response.message : 'Could not load invoices');
  }
  final paged = response.data;
  return TenancyRows(
    rows: paged?.content ?? const [],
    hasMore: paged?.hasMore ?? false,
  );
});

/// This tenancy's payments, newest first.
final tenancyPaymentsProvider = FutureProvider.autoDispose
    .family<TenancyRows<PaymentModel>, String>((ref, occupationId) async {
  final pageSize = ref.watch(tenancyPaymentPageSizeProvider);
  final repo = ref.watch(paymentRepositoryProvider);
  final response = await repo.getPayments(
    status: '',
    page: 0,
    pageSize: pageSize,
    occupationId: occupationId,
  );
  if (!response.isSuccess) {
    throw Exception(
        response.message.isNotEmpty ? response.message : 'Could not load payments');
  }
  final paged = response.data;
  return TenancyRows(
    rows: paged?.content ?? const [],
    hasMore: paged?.hasMore ?? false,
  );
});
