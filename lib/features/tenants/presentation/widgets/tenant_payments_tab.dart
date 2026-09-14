import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../../core/widgets/hodi_empty_state.dart';
import '../../../../core/widgets/hodi_error_state.dart';
import '../../../payments/domain/payment_model.dart';
import '../../providers/tenant_providers.dart';

class TenantPaymentsTab extends ConsumerStatefulWidget {
  final String userId;

  const TenantPaymentsTab({super.key, required this.userId});

  @override
  ConsumerState<TenantPaymentsTab> createState() => _TenantPaymentsTabState();
}

class _TenantPaymentsTabState extends ConsumerState<TenantPaymentsTab> {
  final _scrollController = ScrollController();
  List<PaymentModel> _payments = [];
  bool _isLoading = true;
  bool _hasMore = true;
  int _currentPage = 0;
  String? _error;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now().subtract(const Duration(days: 90));
    _endDate = DateTime.now();
    _scrollController.addListener(_onScroll);
    _fetchPage(0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _fetchPage(int page) async {
    final repo = ref.read(tenantRepositoryProvider);
    final response = await repo.getTenantPayments(
      page: page,
      userId: widget.userId,
      startDate: DateFormatter.formatForApi(_startDate),
      endDate: DateFormatter.formatForApi(_endDate),
    );

    if (!mounted) return;

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      setState(() {
        _payments = page == 0 ? paged.content : [..._payments, ...paged.content];
        _isLoading = false;
        _hasMore = paged.hasMore;
        _currentPage = page;
        _error = null;
      });
    } else {
      setState(() {
        _isLoading = false;
        _error = response.message;
      });
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);
    await _fetchPage(_currentPage + 1);
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      builder: (context, child) {
        return Theme(data: Theme.of(context), child: child!);
      },
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _payments = [];
        _isLoading = true;
        _error = null;
      });
      await _fetchPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _DateRangeChip(
                startDate: _startDate,
                endDate: _endDate,
                onTap: _pickDateRange,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    if (_isLoading && _payments.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (_error != null && _payments.isEmpty) {
      return HodiErrorState(
        message: _error!,
        onRetry: () {
          setState(() {
            _payments = [];
            _isLoading = true;
            _error = null;
          });
          _fetchPage(0);
        },
      );
    }

    if (_payments.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.payments_outlined,
        title: 'No Payments Found',
        subtitle: 'Try adjusting the date range',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: _payments.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _payments.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final payment = _payments[index];
        return _PaymentItem(
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

class _PaymentItem extends StatelessWidget {
  final PaymentModel payment;
  final VoidCallback? onTap;

  const _PaymentItem({required this.payment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            payment.paymentRrn ?? '-',
            style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.home_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(
                payment.houseName ?? payment.houseCode ?? '-',
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              Text(payment.paidOn ?? '-', style: HodiTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HodiAmountText(
                amount: payment.rentPaid,
                style: HodiTextStyles.currency.copyWith(fontSize: 15),
              ),
              if (payment.paidBy != null)
                Text(
                  'by ${payment.paidBy}',
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
        ],
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
            Icon(
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
