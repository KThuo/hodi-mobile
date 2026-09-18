/// The controls the two public browse screens share.
///
/// To Let and Stays ask different questions but ask them the same way, and on the web they look
/// the same because `ToLetPage.vue` and `StaysPage.vue` are built from the same parts — a pill row
/// for bedrooms, a "More filters" disclosure, a sort, a count, and a clear. Mobile had one screen
/// with chips and another with nothing, so the two read as unrelated products.
///
/// The labels here are the web's labels, word for word. Where a person browses on a laptop and
/// then on a phone, "Any beds" has to say "Any beds" in both places or it is a different control.
library;

import 'package:flutter/material.dart';

import '../theme/hodi_border_radius.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';

/// "Any beds · 1+ · 2+ · 3+ · 4+".
///
/// A minimum, not an exact count — and the leading "Any" is what makes that legible. Without it a
/// deselected row looks like a broken one, and the only way back to everything is to work out
/// that tapping the chosen pill again clears it.
class BedroomPills extends StatelessWidget {
  const BedroomPills({
    super.key,
    required this.value,
    required this.onChanged,
    this.max = 4,
    this.anyLabel = 'Any beds',
  });

  final int? value;
  final ValueChanged<int?> onChanged;

  /// How far the row counts. The web stops at four for lettings and three for stays, because
  /// beyond that the pills outnumber the listings behind them.
  final int max;
  final String anyLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _Pill(
            label: anyLabel,
            selected: value == null,
            onTap: () => onChanged(null),
          ),
          for (var n = 1; n <= max; n++) ...[
            const SizedBox(width: 8),
            _Pill(
              label: '$n+',
              selected: value == n,
              onTap: () => onChanged(value == n ? null : n),
            ),
          ],
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.surfaceLight,
          borderRadius: HodiBorderRadius.full,
          border: Border.all(
            color: selected ? HodiColors.primaryStart : HodiColors.divider,
          ),
        ),
        child: Text(
          label,
          style: HodiTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: selected ? HodiColors.white : HodiColors.textMedium,
          ),
        ),
      ),
    );
  }
}

/// The "More filters" button and the sort beside it, as one row.
class FilterActionsRow extends StatelessWidget {
  const FilterActionsRow({
    super.key,
    required this.onMore,
    required this.sortLabel,
    required this.onSort,
    this.activeCount = 0,
  });

  final VoidCallback onMore;

  /// What the current sort is called, shown rather than hidden behind an icon: somebody reading a
  /// list of rents needs to know whether it is cheapest first without tapping to find out.
  final String sortLabel;
  final VoidCallback onSort;

  /// How many of the filters behind [onMore] are set. Shown on the button, because a disclosure
  /// that hides active filters is a list somebody cannot explain the contents of.
  final int activeCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          FilterTapButton(
            onTap: onMore,
            icon: Icons.tune,
            label: activeCount > 0 ? 'More filters · $activeCount' : 'More filters',
            emphasised: activeCount > 0,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FilterTapButton(
              onTap: onSort,
              icon: Icons.swap_vert,
              label: sortLabel,
            ),
          ),
        ],
      ),
    );
  }
}

/// A pill that opens something — a sheet, a picker.
///
/// Public because Stays puts dates and guests in the same shape at the top of its filters, where
/// the web does, rather than burying the two questions every booking starts with.
class FilterTapButton extends StatelessWidget {
  const FilterTapButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.emphasised = false,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final bool emphasised;

  @override
  Widget build(BuildContext context) {
    final tone = emphasised ? HodiColors.primaryStart : HodiColors.textMedium;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          color: HodiColors.cardBackground,
          borderRadius: HodiBorderRadius.full,
          border: Border.all(
            color: emphasised ? HodiColors.primaryStart : HodiColors.divider,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: tone),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: HodiTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: tone,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// How many matched, and the way out when none did.
///
/// The web puts this line directly under the filters on both pages, `aria-live` so it is read out
/// when it changes. It is the only thing on the screen that says a filter did something.
class ResultCountLine extends StatelessWidget {
  const ResultCountLine({
    super.key,
    required this.text,
    this.activeCount = 0,
    this.onClear,
  });

  final String text;
  final int activeCount;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.textMedium,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (activeCount > 0 && onClear != null)
            GestureDetector(
              onTap: onClear,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.close, size: 13, color: HodiColors.primaryStart),
                  const SizedBox(width: 4),
                  Text(
                    'Clear $activeCount filter${activeCount == 1 ? '' : 's'}',
                    style: HodiTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HodiColors.primaryStart,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// The shell every "More filters" sheet on these screens uses.
class FilterSheet extends StatelessWidget {
  const FilterSheet({
    super.key,
    required this.children,
    required this.onApply,
    required this.onReset,
  });

  final List<Widget> children;
  final VoidCallback onApply;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 18,
        right: 18,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 18,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: HodiColors.divider,
                  borderRadius: HodiBorderRadius.full,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text('More filters',
                    style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
                const Spacer(),
                TextButton(
                  onPressed: onReset,
                  style: TextButton.styleFrom(
                    foregroundColor: HodiColors.textMedium,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ...children,
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: onApply,
                style: FilledButton.styleFrom(
                  backgroundColor: HodiColors.primaryStart,
                  shape: RoundedRectangleBorder(
                      borderRadius: HodiBorderRadius.card),
                ),
                child: Text(
                  'Show results',
                  style: HodiTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: HodiColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A labelled field inside a [FilterSheet].
class FilterField extends StatelessWidget {
  const FilterField({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: HodiTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: HodiColors.textMedium,
            ),
          ),
          const SizedBox(height: 7),
          child,
        ],
      ),
    );
  }
}

/// A plain number box, used for rents and bathroom counts.
class FilterNumberField extends StatelessWidget {
  const FilterNumberField({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: HodiTextStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textFaint),
        isDense: true,
        filled: true,
        fillColor: HodiColors.surfaceLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        border: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: const BorderSide(color: HodiColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: const BorderSide(color: HodiColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: BorderSide(color: HodiColors.primaryStart, width: 1.6),
        ),
      ),
    );
  }
}

/// A tick, for the two boolean filters the web shows as checkboxes.
class FilterCheck extends StatelessWidget {
  const FilterCheck({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Icon(
              value ? Icons.check_box : Icons.check_box_outline_blank,
              size: 21,
              color: value ? HodiColors.primaryStart : HodiColors.textFaint,
            ),
            const SizedBox(width: 10),
            Text(label, style: HodiTextStyles.bodyMedium),
          ],
        ),
      ),
    );
  }
}

/// Picking a sort, as a sheet rather than a dropdown.
Future<T?> showSortSheet<T>({
  required BuildContext context,
  required List<({T value, String label})> options,
  required T selected,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => Container(
      decoration: const BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort by', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 6),
          for (final option in options)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(option.label, style: HodiTextStyles.bodyMedium),
              trailing: option.value == selected
                  ? Icon(Icons.check, size: 19, color: HodiColors.primaryStart)
                  : null,
              onTap: () => Navigator.of(context).pop(option.value),
            ),
        ],
      ),
    ),
  );
}
