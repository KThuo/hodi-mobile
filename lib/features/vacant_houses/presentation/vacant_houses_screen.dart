import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../data/vacant_house_repository.dart';
import '../providers/vacant_house_providers.dart';
import 'widgets/vacant_house_list_item.dart';

class VacantHousesScreen extends ConsumerStatefulWidget {
  const VacantHousesScreen({super.key});

  @override
  ConsumerState<VacantHousesScreen> createState() => _VacantHousesScreenState();
}

class _VacantHousesScreenState extends ConsumerState<VacantHousesScreen> {
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
      ref.read(vacantHouseListProvider.notifier).loadMore();
    }
  }

  void _showFilterSheet() {
    final categoriesAsync = ref.read(vacantHouseCategoriesProvider);
    final typesAsync = ref.read(vacantHouseTypesProvider);
    final state = ref.read(vacantHouseListProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _FilterSheet(
        categories: categoriesAsync.value ?? [],
        houseTypes: typesAsync.value ?? [],
        selectedCategoryId: state.categoryId,
        selectedHouseTypeId: state.houseTypeId,
        onCategoryChanged: (id) {
          ref.read(vacantHouseListProvider.notifier).filterByCategory(id);
          Navigator.pop(context);
        },
        onHouseTypeChanged: (id) {
          ref.read(vacantHouseListProvider.notifier).filterByHouseType(id);
          Navigator.pop(context);
        },
        onClearFilters: () {
          ref.read(vacantHouseListProvider.notifier).filterByCategory(null);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(vacantHouseListProvider);
    final hasFilters = state.categoryId != null || state.houseTypeId != null;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Vacant Houses', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.tune_outlined, color: HodiColors.textDark),
                onPressed: _showFilterSheet,
                tooltip: 'Filters',
              ),
              if (hasFilters)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: HodiColors.primaryStart,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(vacantHouseListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search by name, location...',
                onChanged: (value) {
                  ref.read(vacantHouseListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(vacantHouseListProvider.notifier).search('');
                },
              ),
            ),
            // Active filter chips
            if (hasFilters)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _ActiveFilters(
                  state: state,
                  onClearCategory: () =>
                      ref.read(vacantHouseListProvider.notifier).filterByCategory(null),
                  onClearType: () =>
                      ref.read(vacantHouseListProvider.notifier).filterByHouseType(null),
                ),
              ),
            const SizedBox(height: 8),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(VacantHouseListState state) {
    if (state.isLoading && state.houses.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 3, itemHeight: 260);
    }

    if (state.error != null && state.houses.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(vacantHouseListProvider.notifier).refresh(),
      );
    }

    if (state.houses.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.home_work_outlined,
        title: 'No Vacant Houses',
        subtitle: 'Try adjusting your search or filters',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.houses.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.houses.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final house = state.houses[index];
        return VacantHouseListItem(
          house: house,
          onTap: () {
            if (house.id != null) {
              context.push('/vacant-houses/${house.id}');
            }
          },
        );
      },
    );
  }
}

// --- Active filter chips ---

class _ActiveFilters extends ConsumerWidget {
  final VacantHouseListState state;
  final VoidCallback onClearCategory;
  final VoidCallback onClearType;

  const _ActiveFilters({
    required this.state,
    required this.onClearCategory,
    required this.onClearType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(vacantHouseCategoriesProvider);
    final typesAsync = ref.watch(vacantHouseTypesProvider);

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: [
        if (state.categoryId != null)
          _ActiveChip(
            label: _findName(categoriesAsync.value, state.categoryId) ?? 'Category',
            onRemove: onClearCategory,
          ),
        if (state.houseTypeId != null)
          _ActiveChip(
            label: _findName(typesAsync.value, state.houseTypeId) ?? 'Type',
            onRemove: onClearType,
          ),
      ],
    );
  }

  String? _findName(List<FilterItem>? items, String? id) {
    if (items == null || id == null) return null;
    final match = items.where((i) => i.id == id);
    return match.isNotEmpty ? match.first.name : null;
  }
}

class _ActiveChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _ActiveChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 4, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: HodiColors.primaryStart.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HodiColors.primaryStart.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.primaryStart,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, size: 16, color: HodiColors.primaryStart),
          ),
        ],
      ),
    );
  }
}

// --- Filter bottom sheet ---

class _FilterSheet extends StatelessWidget {
  final List<FilterItem> categories;
  final List<FilterItem> houseTypes;
  final String? selectedCategoryId;
  final String? selectedHouseTypeId;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onHouseTypeChanged;
  final VoidCallback onClearFilters;

  const _FilterSheet({
    required this.categories,
    required this.houseTypes,
    required this.selectedCategoryId,
    required this.selectedHouseTypeId,
    required this.onCategoryChanged,
    required this.onHouseTypeChanged,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: HodiColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filters', style: HodiTextStyles.heading3),
              if (selectedCategoryId != null || selectedHouseTypeId != null)
                GestureDetector(
                  onTap: onClearFilters,
                  child: Text(
                    'Clear all',
                    style: HodiTextStyles.bodySmall.copyWith(
                      color: HodiColors.primaryStart,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),

          // Category
          Text(
            'Category',
            style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FilterOptionChip(
                label: 'All',
                isSelected: selectedCategoryId == null,
                onTap: () => onCategoryChanged(null),
              ),
              ...categories.map((c) => _FilterOptionChip(
                    label: c.name,
                    isSelected: selectedCategoryId == c.id,
                    onTap: () => onCategoryChanged(c.id),
                  )),
            ],
          ),
          const SizedBox(height: 20),

          // House type
          Text(
            'House Type',
            style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FilterOptionChip(
                label: 'All',
                isSelected: selectedHouseTypeId == null,
                onTap: () => onHouseTypeChanged(null),
              ),
              ...houseTypes.map((t) => _FilterOptionChip(
                    label: t.name,
                    isSelected: selectedHouseTypeId == t.id,
                    onTap: () => onHouseTypeChanged(t.id),
                  )),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _FilterOptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOptionChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

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
