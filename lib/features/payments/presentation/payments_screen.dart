import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/payment_providers.dart';
import 'widgets/payment_list_item.dart';

class PaymentsScreen extends ConsumerStatefulWidget {
  const PaymentsScreen({super.key});

  @override
  ConsumerState<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends ConsumerState<PaymentsScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(paymentListProvider.notifier).loadMore();
    }
  }

  Future<void> _pickDateRange() async {
    final state = ref.read(paymentListProvider);
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: state.startDate,
        end: state.endDate,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );
    if (picked != null) {
      ref.read(paymentListProvider.notifier).setDateRange(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Payments', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(paymentListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search payments...',
                onChanged: (value) {
                  ref.read(paymentListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(paymentListProvider.notifier).search('');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _DateRangeChip(
                    startDate: state.startDate,
                    endDate: state.endDate,
                    onTap: _pickDateRange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(
                    label: 'Processed',
                    isSelected: state.statusFilter == '0',
                    onTap: () => ref.read(paymentListProvider.notifier).filterByStatus('0'),
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Voided',
                    isSelected: state.statusFilter == '2',
                    onTap: () => ref.read(paymentListProvider.notifier).filterByStatus('2'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(PaymentListState state) {
    if (state.isLoading && state.payments.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.payments.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(paymentListProvider.notifier).refresh(),
      );
    }

    if (state.payments.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.payments_outlined,
        title: 'No Payments Found',
        subtitle: 'Try adjusting your search or date range',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.payments.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.payments.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final payment = state.payments[index];
        return PaymentListItem(
          payment: payment,
          onTap: () {
            if (payment.paymentRrn != null) {
              context.push('/payments/${payment.paymentRrn}');
            }
          },
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}

class _DateRangeChip extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback onTap;

  const _DateRangeChip({
    required this.startDate,
    required this.endDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: HodiColors.primaryStart,
            ),
            const SizedBox(width: 8),
            Text(
              '${DateFormatter.formatDate(startDate)} – ${DateFormatter.formatDate(endDate)}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: HodiColors.textMedium,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: HodiColors.textLight,
            ),
          ],
        ),
      ),
    );
  }
}
