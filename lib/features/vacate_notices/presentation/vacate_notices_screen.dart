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
import '../providers/vacate_notice_providers.dart';
import 'widgets/vacate_notice_list_item.dart';

class VacateNoticesScreen extends ConsumerStatefulWidget {
  const VacateNoticesScreen({super.key});

  @override
  ConsumerState<VacateNoticesScreen> createState() => _VacateNoticesScreenState();
}

class _VacateNoticesScreenState extends ConsumerState<VacateNoticesScreen> {
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
      ref.read(vacateNoticeListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        ref.read(vacateNoticeListProvider.notifier).refresh();
      }
    });
    final state = ref.watch(vacateNoticeListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Vacate Notices', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(vacateNoticeListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search by RRN, tenant, house...',
                onChanged: (value) {
                  ref.read(vacateNoticeListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(vacateNoticeListProvider.notifier).search('');
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(VacateNoticeListState state) {
    if (state.isLoading && state.notices.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.notices.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(vacateNoticeListProvider.notifier).refresh(),
      );
    }

    if (state.notices.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.description_outlined,
        title: 'No Vacate Notices',
        subtitle: 'Try adjusting your search or filters',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.notices.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.notices.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final notice = state.notices[index];
        return VacateNoticeListItem(
          notice: notice,
          onTap: () {
            if (notice.id != null) {
              context.push('/more/vacate-notices/${notice.id}');
            }
          },
        );
      },
    );
  }
}

