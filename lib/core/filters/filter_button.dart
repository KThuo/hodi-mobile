import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';
import 'filter_option.dart';
import 'filter_provider.dart';

/// Shows the filter bottom sheet. Can be called from any context.
void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const FilterBottomSheet(),
  );
}

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterNotifier = ref.read(filterProvider.notifier);

    // Hide for tenants
    if (filterNotifier.isTenant) {
      return const SizedBox.shrink();
    }

    final filterState = ref.watch(filterProvider);

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.filter_list, color: HodiColors.textDark),
          onPressed: () => showFilterBottomSheet(context),
          tooltip: 'Filter',
        ),
        if (filterState.hasActiveFilter)
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
    );
  }
}

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);
    final isSuperadmin = filterNotifier.isSuperadmin;

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
          Text('Filters', style: HodiTextStyles.heading3),
          const SizedBox(height: 16),

          // Estate dropdown (superadmin only)
          if (isSuperadmin) ...[
            Text(
              'Estate',
              style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
            ),
            const SizedBox(height: 8),
            _FilterDropdown(
              value: filterState.selectedEstateId,
              allLabel: 'All Estates',
              items: filterState.estates,
              isLoading: filterState.isLoading,
              onChanged: (value) {
                filterNotifier.selectEstate(value);
              },
            ),
            const SizedBox(height: 16),
          ],

          // Property dropdown
          Text(
            'Property',
            style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
          ),
          const SizedBox(height: 8),
          _FilterDropdown(
            value: filterState.selectedPropertyId,
            allLabel: 'All Properties',
            items: filterState.properties,
            isLoading: filterState.isLoading,
            onChanged: (value) {
              filterNotifier.selectProperty(value);
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String? value;
  final String allLabel;
  final List<FilterOption> items;
  final bool isLoading;
  final ValueChanged<String?> onChanged;

  const _FilterDropdown({
    required this.value,
    required this.allLabel,
    required this.items,
    required this.isLoading,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: isLoading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: HodiColors.primaryStart,
                  ),
                )
              : const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: HodiColors.textMedium,
                ),
          hint: Text(
            allLabel,
            style: const TextStyle(
              fontSize: 14,
              color: HodiColors.textMedium,
            ),
          ),
          items: [
            DropdownMenuItem<String>(
              value: null,
              child: Text(
                allLabel,
                style: const TextStyle(fontSize: 14, color: HodiColors.textDark),
              ),
            ),
            ...items.map(
              (item) => DropdownMenuItem<String>(
                value: item.id,
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 14, color: HodiColors.textDark),
                ),
              ),
            ),
          ],
          onChanged: isLoading ? null : onChanged,
        ),
      ),
    );
  }
}
