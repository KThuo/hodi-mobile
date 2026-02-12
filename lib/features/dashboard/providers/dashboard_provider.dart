import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../payments/domain/payment_model.dart';
import '../data/dashboard_repository.dart';
import '../domain/dashboard_summary.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return DashboardRepository(apiClient: apiClient);
});

// Month/year navigation state
class _SelectedMonthNotifier extends Notifier<int> {
  @override
  int build() => DateTime.now().month;
  void set(int value) => state = value;
}

class _SelectedYearNotifier extends Notifier<int> {
  @override
  int build() => DateTime.now().year;
  void set(int value) => state = value;
}

final selectedMonthProvider =
    NotifierProvider<_SelectedMonthNotifier, int>(_SelectedMonthNotifier.new);
final selectedYearProvider =
    NotifierProvider<_SelectedYearNotifier, int>(_SelectedYearNotifier.new);

final overallSummaryProvider =
    FutureProvider.autoDispose<DashboardSummary?>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  final response = await repo.getOverallSummary();
  if (response.isEstateOverdue) return null;
  return response.isSuccess ? response.data : null;
});

final monthlySummaryProvider =
    FutureProvider.autoDispose<DashboardSummary?>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  final month = ref.watch(selectedMonthProvider);
  final year = ref.watch(selectedYearProvider);
  final response = await repo.getMonthlySummary(
    month: month.toString(),
    year: year.toString(),
  );
  if (response.isEstateOverdue) return null;
  return response.isSuccess ? response.data : null;
});

// Payment collections for the selected month
final collectionsProvider =
    FutureProvider.autoDispose<List<PaymentModel>>((ref) async {
  final month = ref.watch(selectedMonthProvider);
  final year = ref.watch(selectedYearProvider);

  final authState = ref.read(authProvider);
  final authorities = authState.user?.authorities ?? [];
  final isTenant = authorities.contains(AppPermissions.tenantAccessView) &&
      !authorities.contains(AppPermissions.paymentsView);

  final startDate = '$year-${month.toString().padLeft(2, '0')}-01';
  final lastDay = DateTime(year, month + 1, 0).day;
  final endDate =
      '$year-${month.toString().padLeft(2, '0')}-${lastDay.toString().padLeft(2, '0')}';

  final repo = ref.watch(dashboardRepositoryProvider);
  final response = await repo.getCollections(
    startDate: startDate,
    endDate: endDate,
    isTenant: isTenant,
  );

  if (response.isEstateOverdue) return [];
  if (response.isSuccess && response.data != null) {
    return response.data!.content;
  }
  return [];
});
