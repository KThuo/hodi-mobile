import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../../../core/widgets/hodi_amount_text.dart';
import '../../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../../core/widgets/hodi_empty_state.dart';
import '../../../../core/widgets/hodi_error_state.dart';
import '../../../invoices/domain/invoice_model.dart';
import '../../providers/tenant_providers.dart';

class TenantInvoicesTab extends ConsumerStatefulWidget {
  final String userId;

  const TenantInvoicesTab({super.key, required this.userId});

  @override
  ConsumerState<TenantInvoicesTab> createState() => _TenantInvoicesTabState();
}

class _TenantInvoicesTabState extends ConsumerState<TenantInvoicesTab> {
  final _scrollController = ScrollController();
  List<InvoiceModel> _invoices = [];
  bool _isLoading = true;
  bool _hasMore = true;
  int _currentPage = 0;
  String? _error;
  String _statusFilter = '10';

  @override
  void initState() {
    super.initState();
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
    final response = await repo.getTenantInvoices(
      page: page,
      userId: widget.userId,
      status: _statusFilter,
    );

    if (!mounted) return;

    if (response.isSuccess && response.data != null) {
      final paged = response.data!;
      setState(() {
        _invoices = page == 0 ? paged.content : [..._invoices, ...paged.content];
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

  Future<void> _filterByStatus(String status) async {
    setState(() {
      _statusFilter = status;
      _invoices = [];
      _isLoading = true;
      _error = null;
    });
    await _fetchPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _FilterChip(
                label: 'All',
                isSelected: _statusFilter == '10',
                onTap: () => _filterByStatus('10'),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Unpaid',
                isSelected: _statusFilter == '0',
                onTap: () => _filterByStatus('0'),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Paid',
                isSelected: _statusFilter == '2',
                onTap: () => _filterByStatus('2'),
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
    if (_isLoading && _invoices.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (_error != null && _invoices.isEmpty) {
      return HodiErrorState(
        message: _error!,
        onRetry: () => _filterByStatus(_statusFilter),
      );
    }

    if (_invoices.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No Invoices Found',
        subtitle: 'No invoices match the selected filter',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: _invoices.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _invoices.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final invoice = _invoices[index];
        return _InvoiceItem(
          invoice: invoice,
          onTap: () {
            if (invoice.rrn != null) {
              context.push('/invoices/${invoice.rrn}');
            }
          },
        );
      },
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onTap;

  const _InvoiceItem({required this.invoice, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            invoice.rrn ?? '-',
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
                invoice.unitLabel.isEmpty ? '-' : invoice.unitLabel,
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              if (invoice.dueDate != null)
                Text(invoice.dueDate!, style: HodiTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 8),
          if (invoice.isPaid)
            HodiAmountText(
              amount: invoice.paidAmount,
              style: HodiTextStyles.currency.copyWith(
                fontSize: 15,
                color: HodiColors.successStart,
              ),
            )
          else if (!invoice.isVoided)
            Text(
              'Bal: ${invoice.balance >= 0 ? "" : "-"}KES ${invoice.balance.abs().toStringAsFixed(0)}',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.errorStart,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
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
