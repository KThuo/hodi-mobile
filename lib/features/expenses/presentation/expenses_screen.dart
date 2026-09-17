import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/filters/filter_button.dart';
import '../../../core/filters/filter_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_card.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/expense_model.dart';
import '../providers/expense_providers.dart';
import 'widgets/record_expense_sheet.dart';

/// What a property has cost.
class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key});

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(expenseListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _record([ExpenseModel? existing]) async {
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => RecordExpenseSheet(existing: existing),
    );
    if (saved == true) {
      await ref.read(expenseListProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filterProvider, (previous, next) {
      if (previous?.selectedEstateId != next.selectedEstateId ||
          previous?.selectedPropertyId != next.selectedPropertyId) {
        ref.read(expenseListProvider.notifier).refresh();
      }
    });

    final state = ref.watch(expenseListProvider);
    final user = ref.watch(authProvider).user;
    final canAdd = user?.hasPermission(AppPermissions.expenseNew) ?? false;
    final canEdit = user?.hasPermission(AppPermissions.expenseEdit) ?? false;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Expenses', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: const [FilterButton()],
      ),
      floatingActionButton: canAdd
          ? FloatingActionButton.extended(
              onPressed: () => _record(),
              backgroundColor: HodiColors.primaryStart,
              foregroundColor: HodiColors.white,
              icon: const Icon(Icons.add),
              label: const Text('Record'),
            )
          : null,
      body: Column(
        children: [
          if (state.items.isNotEmpty) _LoadedTotal(state: state),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Search expenses...',
              onChanged: (v) => ref.read(expenseListProvider.notifier).search(v),
              onClear: () => ref.read(expenseListProvider.notifier).search(''),
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
                  selected: state.category == null,
                  onTap: () => ref
                      .read(expenseListProvider.notifier)
                      .filterByCategory(null),
                ),
                for (final c in expenseCategories) ...[
                  const SizedBox(width: 8),
                  _Chip(
                    label: c.label,
                    selected: state.category == c.code,
                    onTap: () => ref
                        .read(expenseListProvider.notifier)
                        .filterByCategory(c.code),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildList(state, canEdit)),
        ],
      ),
    );
  }

  Widget _buildList(ExpenseListState state, bool canEdit) {
    if (state.isLoading && state.items.isEmpty) {
      return const HodiLoadingShimmer(itemCount: 5, itemHeight: 88);
    }
    if (state.error != null && state.items.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(expenseListProvider.notifier).refresh(),
      );
    }
    if (state.items.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No expenses',
        subtitle: 'Nothing has been recorded for this selection',
      );
    }

    return RefreshIndicator(
      color: HodiColors.primaryStart,
      onRefresh: () => ref.read(expenseListProvider.notifier).refresh(),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final expense = state.items[index];
          return _ExpenseRow(
            expense: expense,
            // A generated line is not editable here. Correcting it changes nothing — the standing
            // charge behind it raises another next month — so the edit belongs where that is.
            onTap: canEdit && !expense.isGenerated ? () => _record(expense) : null,
          );
        },
      ),
    );
  }
}

/// What the rows on screen come to.
///
/// Labelled as the total **shown**, because that is what it is: the pages loaded so far, not the
/// whole filter. A figure captioned "total expenses" that quietly means "the first twenty" is a
/// figure somebody puts in a report.
class _LoadedTotal extends StatelessWidget {
  const _LoadedTotal({required this.state});

  final ExpenseListState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.card,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              state.hasMore
                  ? '${state.items.length} shown'
                  : '${state.items.length} expense'
                      '${state.items.length == 1 ? '' : 's'}',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textMedium),
            ),
          ),
          HodiAmountText(
            amount: state.loadedTotal,
            style: HodiTextStyles.currency.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseRow extends StatelessWidget {
  const _ExpenseRow({required this.expense, this.onTap});

  final ExpenseModel expense;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.name,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    expense.categoryLabel,
                    if (expense.propertyName != null) expense.propertyName!,
                    _date(expense.incurredOn),
                  ].where((s) => s.isNotEmpty).join(' · '),
                  style: HodiTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (expense.isGenerated) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.autorenew,
                          size: 12, color: HodiColors.textLight),
                      const SizedBox(width: 4),
                      Text(
                        'Raised automatically',
                        style: HodiTextStyles.bodySmall.copyWith(
                          fontSize: 10,
                          color: HodiColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'KES ${CurrencyFormatter.format(expense.amount)}',
            style: HodiTextStyles.currency
                .copyWith(fontSize: 15, color: HodiColors.errorStart),
          ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '' : DateFormatter.formatDate(parsed);
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
