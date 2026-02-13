import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/metre_providers.dart';
import 'widgets/metre_list_item.dart';

class MetresScreen extends ConsumerStatefulWidget {
  const MetresScreen({super.key});

  @override
  ConsumerState<MetresScreen> createState() => _MetresScreenState();
}

class _MetresScreenState extends ConsumerState<MetresScreen> {
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
      ref.read(metreListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(metreListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Metres', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(metreListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search metres...',
                onChanged: (value) {
                  ref.read(metreListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(metreListProvider.notifier).search('');
                },
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(
                    label: 'All',
                    isSelected: state.currentReadingFilter == null,
                    onTap: () => ref.read(metreListProvider.notifier).filterByCurrentReading(null),
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Read',
                    isSelected: state.currentReadingFilter == true,
                    onTap: () => ref.read(metreListProvider.notifier).filterByCurrentReading(true),
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Unread',
                    isSelected: state.currentReadingFilter == false,
                    onTap: () => ref.read(metreListProvider.notifier).filterByCurrentReading(false),
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

  Widget _buildList(MetreListState state) {
    if (state.isLoading && state.metres.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.metres.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(metreListProvider.notifier).refresh(),
      );
    }

    if (state.metres.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.speed_outlined,
        title: 'No Metres Found',
        subtitle: 'Try adjusting your search or filter',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.metres.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.metres.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final metre = state.metres[index];
        return MetreListItem(
          metre: metre,
          onTap: () {
            if (metre.id != null) {
              context.push('/more/metres/${metre.id}/history');
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
