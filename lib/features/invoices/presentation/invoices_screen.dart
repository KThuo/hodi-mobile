import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/filters/filter_button.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/invoice_providers.dart';
import 'widgets/invoice_list_item.dart';

class InvoicesScreen extends ConsumerStatefulWidget {
  const InvoicesScreen({super.key});

  @override
  ConsumerState<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends ConsumerState<InvoicesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  final _scrollControllers = List.generate(3, (_) => ScrollController());

  static const _tabs = [
    {'label': 'Unpaid', 'status': '0'},
    {'label': 'Paid', 'status': '2'},
    {'label': 'Voided', 'status': '4'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    for (var i = 0; i < 3; i++) {
      _scrollControllers[i].addListener(() => _onScroll(i));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    for (final c in _scrollControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onScroll(int tabIndex) {
    final controller = _scrollControllers[tabIndex];
    if (controller.position.pixels >= controller.position.maxScrollExtent - 200) {
      final status = _tabs[tabIndex]['status']!;
      ref.read(invoiceListProvider(status).notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        for (final tab in _tabs) {
          ref.read(invoiceListProvider(tab['status']!).notifier).refresh();
        }
      }
    });

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Invoices', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
        bottom: TabBar(
          controller: _tabController,
          labelColor: HodiColors.primaryStart,
          unselectedLabelColor: HodiColors.textLight,
          indicatorColor: HodiColors.primaryStart,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _tabs.map((t) => Tab(text: t['label'])).toList(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search invoices...',
              onChanged: (value) {
                final status = _tabs[_tabController.index]['status']!;
                ref.read(invoiceListProvider(status).notifier).search(value);
              },
              onClear: () {
                final status = _tabs[_tabController.index]['status']!;
                ref.read(invoiceListProvider(status).notifier).search('');
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(3, (tabIndex) {
                final status = _tabs[tabIndex]['status']!;
                return _InvoiceTabView(
                  status: status,
                  scrollController: _scrollControllers[tabIndex],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _InvoiceTabView extends ConsumerWidget {
  final String status;
  final ScrollController scrollController;

  const _InvoiceTabView({required this.status, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceListProvider(status));

    if (state.isLoading && state.invoices.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.invoices.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(invoiceListProvider(status).notifier).refresh(),
      );
    }

    if (state.invoices.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No Invoices',
        subtitle: 'No invoices found for this category',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(invoiceListProvider(status).notifier).refresh(),
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: state.invoices.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.invoices.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
            );
          }
          final invoice = state.invoices[index];
          return InvoiceListItem(
            invoice: invoice,
            onTap: () {
              if (invoice.rrn != null) {
                context.push('/invoices/${invoice.rrn}');
              }
            },
          );
        },
      ),
    );
  }
}
