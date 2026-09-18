import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/report_repository.dart';
import '../domain/tenant_report_model.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(apiClient: ref.watch(apiClientProvider));
});

/// Which tenancies to look at.
///
/// The controller's own note is the reasoning: *four hundred tenancies is not a decision, "who
/// owes, oldest first" is.* So the screen leads with this rather than with a list, and opens on
/// the lens somebody came for.
enum TenantLens {
  owing('OWING', 'Owing'),
  credit('CREDIT', 'In credit'),
  clear('CLEAR', 'Clear'),
  all(null, 'Everyone');

  const TenantLens(this.code, this.label);

  final String? code;
  final String label;
}

class _LensNotifier extends Notifier<TenantLens> {
  @override
  TenantLens build() => TenantLens.owing;
  void set(TenantLens lens) => state = lens;
}

final tenantLensProvider =
    NotifierProvider<_LensNotifier, TenantLens>(_LensNotifier.new);

class _SearchNotifier extends Notifier<String> {
  @override
  String build() => '';
  void set(String term) => state = term;
}

final tenantReportSearchProvider =
    NotifierProvider<_SearchNotifier, String>(_SearchNotifier.new);

/// The tenant report, for the lens and filters currently set.
///
/// ## Everything, not a page of it
///
/// The server computes `totals` from the rows it returns — `TenantReportTotals.of(rows)` sums
/// the page, not the query. Asking for fifty of eighty-nine therefore produced a correct total of
/// the wrong thing, and the screen had to apologise for it in a sentence under the figures.
///
/// So it asks for the service's own ceiling, [_reportPageSize], and gets the lot in one call.
/// Past that the totals are genuinely partial and the screen says so plainly — but at this
/// ceiling that is a report nobody is reading on a phone anyway.
///
/// Still one call rather than an endless list: this is a report, and a figure that moves as
/// somebody scrolls is a figure they cannot read.
/// `TenantReportService.MAX_PAGE`. Asking for more is clamped to this, so this is the most that
/// can be covered by one set of totals.
const int _reportPageSize = 200;

final tenantReportProvider =
    FutureProvider.autoDispose<TenantReportPageModel?>((ref) async {
  final lens = ref.watch(tenantLensProvider);
  final search = ref.watch(tenantReportSearchProvider);
  final filters = ref.watch(filterProvider);

  final response = await ref.watch(reportRepositoryProvider).tenants(
        lens: lens.code,
        searchTerm: search,
        estateId: filters.selectedEstateId,
        propertyId: filters.selectedPropertyId,
        // Biggest balance first, which is the order somebody reads an arrears list in.
        sort: 'accountBalance',
        desc: true,
        pageSize: _reportPageSize,
      );

  if (!response.isSuccess) {
    throw Exception(response.message.isNotEmpty
        ? response.message
        : 'That report could not be loaded.');
  }
  return response.data;
});
