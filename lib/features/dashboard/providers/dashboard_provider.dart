import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../data/dashboard_repository.dart';
import '../domain/dashboard_summary.dart';
import '../domain/calendar_data.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return DashboardRepository(apiClient: apiClient);
});

final overallSummaryProvider = FutureProvider.autoDispose<DashboardSummary?>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  final response = await repo.getOverallSummary();
  return response.isSuccess ? response.data : null;
});

final monthlySummaryProvider = FutureProvider.autoDispose<DashboardSummary?>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  final now = DateTime.now();
  final response = await repo.getMonthlySummary(
    month: now.month.toString(),
    year: now.year.toString(),
  );
  return response.isSuccess ? response.data : null;
});

final calendarDataProvider = FutureProvider.autoDispose<CalendarData?>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  final response = await repo.getCalendarData(
    year: DateTime.now().year.toString(),
  );
  return response.isSuccess ? response.data : null;
});
