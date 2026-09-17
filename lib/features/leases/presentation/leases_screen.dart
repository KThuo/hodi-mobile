import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/filters/filter_button.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_card.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/lease_models.dart';
import '../providers/lease_providers.dart';

/// Tenancy agreements.
class LeasesScreen extends ConsumerStatefulWidget {
  const LeasesScreen({super.key});

  @override
  ConsumerState<LeasesScreen> createState() => _LeasesScreenState();
}

class _LeasesScreenState extends ConsumerState<LeasesScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(leaseListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        ref.read(leaseListProvider.notifier).refresh();
      }
    });

    final state = ref.watch(leaseListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Agreements', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search agreements...',
              onChanged: (v) => ref.read(leaseListProvider.notifier).search(v),
              onClear: () => ref.read(leaseListProvider.notifier).search(''),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _Chip(
                  label: 'All',
                  selected: !state.expiringOnly,
                  onTap: () =>
                      ref.read(leaseListProvider.notifier).showExpiringOnly(false),
                ),
                const SizedBox(width: 8),
                // Its own endpoint, not a filter. The server's note: what needs renewing is a
                // question somebody asks, not a filter they have to remember to set.
                _Chip(
                  label: 'Expiring soon',
                  selected: state.expiringOnly,
                  onTap: () =>
                      ref.read(leaseListProvider.notifier).showExpiringOnly(true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildList(state)),
        ],
      ),
    );
  }

  Widget _buildList(LeaseListState state) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 4, itemHeight: 104);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(leaseListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return HodiEmptyState(
        icon: Icons.description_outlined,
        title: state.expiringOnly ? 'Nothing expiring' : 'No agreements',
        subtitle: state.expiringOnly
            ? 'Nothing is due for renewal in the next 60 days'
            : 'Nothing matches this selection',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(leaseListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final lease = state.items[index];
          return _LeaseRow(
            lease: lease,
            onTap: () => context.push('/more/agreements/${lease.id}'),
          );
        },
      ),
    );
  }
}

class _LeaseRow extends StatelessWidget {
  const _LeaseRow({required this.lease, this.onTap});

  final LeaseModel lease;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  lease.tenantName,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (lease.documents > 0)
                Row(
                  children: [
                    const Icon(Icons.attach_file,
                        size: 13, color: HodiColors.textLight),
                    Text(
                      '${lease.documents}',
                      style: HodiTextStyles.bodySmall
                          .copyWith(fontSize: 11, color: HodiColors.textLight),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            [
              if (lease.unit.isNotEmpty) lease.unit,
              if (lease.propertyName != null) lease.propertyName!,
            ].join(' · '),
            style: HodiTextStyles.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'KES ${CurrencyFormatter.format(lease.rent)}',
                style: HodiTextStyles.currency.copyWith(fontSize: 14),
              ),
              const Spacer(),
              _TermBadge(lease: lease),
            ],
          ),
        ],
      ),
    );
  }
}

/// Where the term stands.
///
/// A lapsed term is normal for a periodic tenancy that ran past its first — said in neutral words
/// rather than in red, because it is not a fault. What is worth a colour is one about to end.
class _TermBadge extends StatelessWidget {
  const _TermBadge({required this.lease});

  final LeaseModel lease;

  @override
  Widget build(BuildContext context) {
    if (lease.expiresOn == null) {
      return Text(
        'No end date',
        style: HodiTextStyles.bodySmall
            .copyWith(fontSize: 11, color: HodiColors.textLight),
      );
    }

    final soon = lease.expiringWithin(60);
    final colour = soon ? HodiColors.warningEnd : HodiColors.textLight;
    final when = DateFormatter.parseApiDate(lease.expiresOn);

    return Row(
      children: [
        Icon(Icons.event_outlined, size: 13, color: colour),
        const SizedBox(width: 4),
        Text(
          lease.lapsed
              ? 'Ran past ${when == null ? 'its term' : DateFormatter.formatDate(when)}'
              : soon
                  ? 'Ends in ${lease.daysToExpiry} days'
                  : when == null
                      ? ''
                      : 'Ends ${DateFormatter.formatDate(when)}',
          style: HodiTextStyles.bodySmall.copyWith(
            fontSize: 11,
            color: colour,
            fontWeight: soon ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}
