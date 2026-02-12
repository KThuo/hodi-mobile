import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
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
        subtitle: 'Try adjusting your search',
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
