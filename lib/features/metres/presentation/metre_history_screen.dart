import 'package:flutter/material.dart';

import 'widgets/reading_photo_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/permissions/app_permissions.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_card.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../domain/metre_history_model.dart';
import '../providers/metre_providers.dart';
import 'widgets/update_reading_sheet.dart';

class MetreHistoryScreen extends ConsumerStatefulWidget {
  final String metreId;

  const MetreHistoryScreen({super.key, required this.metreId});

  @override
  ConsumerState<MetreHistoryScreen> createState() => _MetreHistoryScreenState();
}

class _MetreHistoryScreenState extends ConsumerState<MetreHistoryScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // No scroll listener: a year of readings is twelve rows, because a meter is read once a month.
    // The endpoint answers a whole year at a time and there is no next page to fetch.
    // Set the selected metre ID so the history notifier can fetch data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectedMetreIdProvider.notifier).set(widget.metreId);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool get _canUpdateReading {
    final authState = ref.read(authProvider);
    final authorities = authState.user?.authorities ?? [];
    return authorities.contains(AppPermissions.metreEdit);
  }

  void _showUpdateSheet() {
    final metreListState = ref.read(metreListProvider);
    final metre = metreListState.metres.where((m) => m.id == widget.metreId).firstOrNull;
    if (metre == null || !metre.isActive) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: HodiColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => UpdateReadingSheet(metre: metre),
    );
  }

  /// The years this meter actually has readings in, as the server reports them.
  ///
  /// It used to count back to a hardcoded 2025, which offers years a meter installed last month was
  /// never read in and silently stops working the year somebody backdates a reading to 2024. The
  /// server sends the real list beside the rows, for exactly this.
  ///
  /// The year on screen is always included even when the server does not list it: a year with no
  /// readings is a legitimate thing to be looking at, and it would be odd for the picker to drop
  /// the very year it is showing.
  List<int> _yearOptions(MetreHistoryState state) {
    final years = {...state.years, state.year, DateTime.now().year}.toList()
      ..sort((a, b) => b.compareTo(a));
    return years;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(metreHistoryProvider);

    // Check if metre is active and updatable for FAB
    final metreListState = ref.watch(metreListProvider);
    final metre = metreListState.metres.where((m) => m.id == widget.metreId).firstOrNull;
    final showFab = _canUpdateReading && metre != null && metre.isActive && metre.readingDue;

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Metre History'),
      floatingActionButton: showFab
          ? FloatingActionButton.extended(
              onPressed: _showUpdateSheet,
              backgroundColor: HodiColors.primaryStart,
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Update Reading',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )
          : null,
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(metreHistoryProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: HodiSearchBar(
                      controller: _searchController,
                      hintText: 'Search history...',
                      onChanged: (value) {
                        ref.read(metreHistoryProvider.notifier).search(value);
                      },
                      onClear: () {
                        ref.read(metreHistoryProvider.notifier).search('');
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  _YearDropdown(
                    selectedYear: state.year,
                    years: _yearOptions(state),
                    onChanged: (year) {
                      ref.read(metreHistoryProvider.notifier).filterByYear(year);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(MetreHistoryState state) {
    if (state.isLoading && state.histories.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.histories.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(metreHistoryProvider.notifier).refresh(),
      );
    }

    if (state.histories.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.history_outlined,
        title: 'No History Found',
        subtitle: 'Try selecting a different year',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: state.histories.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.histories.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final history = state.histories[index];
        return _HistoryListItem(
          history: history,
          onTap: () {
            if (history.invoiceRrn != null && history.invoiceRrn!.isNotEmpty) {
              context.push('/invoices/${history.invoiceRrn}');
            }
          },
          // Only where there is something to look at. Legacy's eye icon appeared on the same
          // condition, and it is the whole reason the row carries a flag rather than a URL.
          onViewPhoto: history.hasPhoto && history.id != null
              ? () => ReadingPhotoView.open(context, history.id!,
                  periodLabel: history.periodLabel)
              : null,
        );
      },
    );
  }
}

class _HistoryListItem extends StatelessWidget {
  final MetreHistoryModel history;
  final VoidCallback? onTap;

  /// Null where this reading has no photograph, which is most of them.
  final VoidCallback? onViewPhoto;

  const _HistoryListItem({required this.history, this.onTap, this.onViewPhoto});

  /// When it was read, as `2026-09-23 13:01`.
  ///
  /// The server sends a full ISO instant and this printed it raw, so the card carried
  /// `2026-09-23T13:01:22.481937Z`. Null where the timestamp is missing or unparseable, in which
  /// case the line is left off rather than showing the raw string.
  String? get _readOn {
    final parsed = DateFormatter.parseApiDate(history.readOn);
    return parsed == null ? null : DateFormatter.formatStamp(parsed.toLocal());
  }

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
                  history.periodLabel ?? '-',
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onViewPhoto != null)
                // The evidence, one tap away. Its own target rather than the row's, because the row
                // already opens the invoice and a reading can have both.
                IconButton(
                  onPressed: onViewPhoto,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  tooltip: 'View the meter photo',
                  icon: Icon(Icons.photo_camera_outlined,
                      size: 18, color: HodiColors.primaryStart),
                ),
              // Whether it has been billed, said either way.
              //
              // Only the reference showed before, so an unbilled reading and a billed one whose
              // reference had not come back looked the same — and "not yet billed" is the useful
              // state, not an omission: the next invoice picks it up.
              _BilledChip(history: history),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${history.previousReading}',
                style: HodiTextStyles.bodyMedium,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(Icons.arrow_forward, size: 14, color: Color(0xFF9CA3AF)),
              ),
              Text(
                '${history.currentReading}',
                style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                '${history.consumedUnits} units',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                'Charge: ${history.rate}/unit',
                style: HodiTextStyles.bodySmall,
              ),
              const Spacer(),
              HodiAmountText(
                amount: history.amount,
                style: HodiTextStyles.currency.copyWith(fontSize: 15),
              ),
            ],
          ),
          if (_readOn != null) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Read $_readOn',
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.textLight),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _YearDropdown extends StatelessWidget {
  final int selectedYear;
  final List<int> years;
  final ValueChanged<int> onChanged;

  const _YearDropdown({
    required this.selectedYear,
    required this.years,
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
        child: DropdownButton<int>(
          value: selectedYear,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: HodiColors.textLight),
          style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
          items: years.map((year) {
            return DropdownMenuItem<int>(
              value: year,
              child: Text('$year'),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ),
    );
  }
}


/// Whether a reading has been charged for, and on which invoice.
///
/// Said either way. Only the reference showed before, so a reading not yet billed and one whose
/// reference had not come back looked identical — and "not yet billed" is the useful state rather
/// than an omission: the reading is recorded and the next invoice picks it up.
class _BilledChip extends StatelessWidget {
  const _BilledChip({required this.history});

  final MetreHistoryModel history;

  @override
  Widget build(BuildContext context) {
    final rrn = history.invoiceRrn;
    final billed = history.billed && rrn != null && rrn.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: billed ? HodiColors.successBg : HodiColors.warningBg,
        borderRadius: HodiBorderRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            billed ? Icons.receipt_long_outlined : Icons.schedule,
            size: 11,
            color: billed ? HodiColors.successEnd : HodiColors.warningEnd,
          ),
          const SizedBox(width: 4),
          Text(
            // The reference is the useful half once there is one: it is what somebody quotes.
            billed ? rrn : 'Not yet billed',
            style: HodiTextStyles.bodySmall.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: billed ? HodiColors.successEnd : HodiColors.warningEnd,
            ),
          ),
        ],
      ),
    );
  }
}
