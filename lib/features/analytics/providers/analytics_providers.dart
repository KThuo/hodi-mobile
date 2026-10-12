import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/filters/filter_provider.dart';
import '../data/analytics_repository.dart';
import '../domain/analytics_models.dart';

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(apiClient: ref.watch(apiClientProvider));
});

/// Each keyed on the dashboard's filter, so choosing an estate refreshes them with the summary.
///
/// A refused or failed read is null rather than an error: each card then shows a quiet line of its
/// own, and a slow analytics query never takes the dashboard with it.

final tenantsToChaseProvider = FutureProvider.autoDispose<TenantsToChase?>((ref) async {
  final filters = ref.watch(filterProvider);
  final response = await ref.watch(analyticsRepositoryProvider).tenantsToChase(
        estateId: filters.selectedEstateId,
        propertyId: filters.selectedPropertyId,
      );
  return response.isSuccess ? response.data : null;
});

final rentRealisedProvider = FutureProvider.autoDispose<RentRealised?>((ref) async {
  final filters = ref.watch(filterProvider);
  final response = await ref.watch(analyticsRepositoryProvider).rentRealised(
        estateId: filters.selectedEstateId,
        propertyId: filters.selectedPropertyId,
      );
  return response.isSuccess ? response.data : null;
});

final staysSummaryProvider = FutureProvider.autoDispose<StaysSummary?>((ref) async {
  final filters = ref.watch(filterProvider);
  final response = await ref.watch(analyticsRepositoryProvider).stays(
        estateId: filters.selectedEstateId,
        propertyId: filters.selectedPropertyId,
      );
  return response.isSuccess ? response.data : null;
});
