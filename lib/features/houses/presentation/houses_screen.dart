import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/house_providers.dart';
import 'widgets/house_list_item.dart';

class HousesScreen extends ConsumerStatefulWidget {
  const HousesScreen({super.key});

  @override
  ConsumerState<HousesScreen> createState() => _HousesScreenState();
}

class _HousesScreenState extends ConsumerState<HousesScreen> {
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
      ref.read(houseListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(houseListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Houses', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(houseListProvider.notifier).refresh(),
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search houses...',
                onChanged: (value) {
                  ref.read(houseListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(houseListProvider.notifier).search('');
                },
              ),
            ),

            // Filter chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(
                    label: 'All',
                    isSelected: state.occupiedFilter == null,
                    onTap: () => ref.read(houseListProvider.notifier).filterByOccupancy(null),
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Occupied',
                    isSelected: state.occupiedFilter == 'true',
                    onTap: () => ref.read(houseListProvider.notifier).filterByOccupancy('true'),
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Vacant',
                    isSelected: state.occupiedFilter == 'false',
                    onTap: () => ref.read(houseListProvider.notifier).filterByOccupancy('false'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // List
            Expanded(
              child: _buildList(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(HouseListState state) {
    if (state.isLoading && state.houses.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.houses.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(houseListProvider.notifier).refresh(),
      );
    }

    if (state.houses.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.home_work_outlined,
        title: 'No Houses Found',
        subtitle: 'Try adjusting your search or filters',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.houses.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.houses.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(color: HodiColors.primaryStart),
            ),
          );
        }
        final house = state.houses[index];
        return HouseListItem(
          house: house,
          onTap: () => context.push('/houses/${house.id}'),
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
