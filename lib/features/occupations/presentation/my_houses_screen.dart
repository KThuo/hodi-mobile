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
import '../providers/occupation_providers.dart';
import 'widgets/occupation_list_item.dart';

/// My houses.
///
/// This was a dead end: a tenant saw the unit they occupy and could go no further. Each row now
/// opens the tenancy — what is owed, the invoices behind it, and the payments made against them.
///
/// It reads `/occupations`, which is a different endpoint from the Houses list beside it in the
/// menu. That one is `/units` and needs `ROLE_HOUSE_VIEW`; a tenant does not hold it, and the
/// single row that used to serve both audiences sent them to a door the server keeps shut.
class MyHousesScreen extends ConsumerStatefulWidget {
  const MyHousesScreen({super.key});

  @override
  ConsumerState<MyHousesScreen> createState() => _MyHousesScreenState();
}

class _MyHousesScreenState extends ConsumerState<MyHousesScreen> {
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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(occupationListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        ref.read(occupationListProvider.notifier).refresh();
      }
    });
    final state = ref.watch(occupationListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('My Houses', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(occupationListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search tenancies...',
                onChanged: (value) =>
                    ref.read(occupationListProvider.notifier).search(value),
                onClear: () =>
                    ref.read(occupationListProvider.notifier).search(''),
              ),
            ),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(OccupationListState state) {
    if (state.isLoading && state.occupations.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.occupations.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(occupationListProvider.notifier).refresh(),
      );
    }

    if (state.occupations.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.holiday_village_outlined,
        title: 'No Tenancies',
        subtitle: 'Nothing is occupied under this account yet',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.occupations.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.occupations.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(color: HodiColors.primaryStart),
            ),
          );
        }
        final occupation = state.occupations[index];
        return OccupationListItem(
          occupation: occupation,
          // The row travels with the tap. There is no `GET /occupations/{id}` to fetch it back
          // from, so the screen it opens works from what the list already has and falls back to
          // the balance read when it is opened cold from a link.
          onTap: () => context.push(
            '/my-houses/${occupation.id}',
            extra: occupation,
          ),
        );
      },
    );
  }
}
