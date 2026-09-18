import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/api/api_constants.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_webview_page.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/browse_filters.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/stay_model.dart';
import '../providers/stay_providers.dart';

/// HODI BNB's public half, on the phone.
///
/// Reachable without signing in — it is beside To Let on the sign-in screen for the same reason the
/// web puts both in the public layout: somebody looking for somewhere to stay does not have an
/// account yet, and asking them to make one before they can look is asking in the wrong order.
class StaysScreen extends ConsumerStatefulWidget {
  const StaysScreen({super.key});

  @override
  ConsumerState<StaysScreen> createState() => _StaysScreenState();
}

class _StaysScreenState extends ConsumerState<StaysScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// "3 – 7 Oct", or the invitation when nothing is picked.
  String _datesLabel(StayQuery q) {
    final from = q.checkIn;
    final to = q.checkOut;
    if (from == null || to == null) return 'Any dates';
    return '${DateFormatter.formatShortDate(from)} \u2013 '
        '${DateFormatter.formatShortDate(to)}';
  }

  Future<void> _pickDates(StayQuery q) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final picked = await showDateRangePicker(
      context: context,
      // Nobody stays last week. The picker refuses it rather than the search coming back empty.
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
      initialDateRange: q.checkIn != null && q.checkOut != null
          ? DateTimeRange(start: q.checkIn!, end: q.checkOut!)
          : null,
      helpText: 'Check in and out',
      saveText: 'Done',
    );
    if (picked == null || !mounted) return;
    ref.read(stayQueryProvider.notifier).setDates(picked.start, picked.end);
  }

  Future<void> _pickSort(StaySort current) async {
    final picked = await showSortSheet<StaySort>(
      context: context,
      options: [
        for (final s in StaySort.values) (value: s, label: s.label),
      ],
      selected: current,
    );
    if (picked == null || !mounted) return;
    ref.read(stayQueryProvider.notifier).sortBy(picked);
  }

  void _openMore(StayQuery q) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _MoreFilters(query: q),
    );
  }

  /// What the count line says, matching the web's three cases exactly.
  String _countText(AsyncValue<List<StayModel>> stays, StayQuery q) {
    if (stays.isLoading) return 'Looking\u2026';
    final list = stays.value ?? const <StayModel>[];
    if (list.isEmpty) {
      return q.nights != null
          ? 'Nothing free for those dates'
          : 'Nothing matches those filters';
    }
    final nights = q.nights;
    final places = '${list.length} place${list.length == 1 ? '' : 's'}';
    return nights == null
        ? places
        : '$places free for $nights night${nights == 1 ? '' : 's'}';
  }

  @override
  Widget build(BuildContext context) {
    final staysAsync = ref.watch(staysProvider);
    final query = ref.watch(stayQueryProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Stays'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: HodiSearchBar(
              controller: _searchController,
              hintText: 'Where are you going',
              onChanged: (term) =>
                  ref.read(stayQueryProvider.notifier).search(term),
              onClear: () => ref.read(stayQueryProvider.notifier).search(''),
            ),
          ),

          // When and how many, where the web keeps them: at the top, because they are the two
          // questions every booking starts with and a stay filtered without dates is a list of
          // places that may already be taken.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: FilterTapButton(
                    onTap: () => _pickDates(query),
                    icon: Icons.calendar_today_outlined,
                    label: _datesLabel(query),
                    emphasised: query.nights != null,
                  ),
                ),
                const SizedBox(width: 8),
                FilterTapButton(
                  onTap: () => _openMore(query),
                  icon: Icons.person_outline,
                  label: query.guests == null
                      ? 'Guests'
                      : '${query.guests} guest${query.guests == 1 ? '' : 's'}',
                  emphasised: query.guests != null,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          // Three, not four: every BNB unit in this portfolio is small, and the web stops here
          // for the same reason.
          BedroomPills(
            value: query.minBedrooms,
            max: 3,
            onChanged: (n) =>
                ref.read(stayQueryProvider.notifier).setBedrooms(n),
          ),

          FilterActionsRow(
            activeCount: [
              query.minBathrooms,
              query.maxNightly,
            ].whereType<Object>().length,
            onMore: () => _openMore(query),
            sortLabel: query.sort.label,
            onSort: () => _pickSort(query.sort),
          ),

          ResultCountLine(
            text: _countText(staysAsync, query),
            activeCount: query.activeCount,
            onClear: () {
              _searchController.clear();
              ref.read(stayQueryProvider.notifier).clear();
            },
          ),
          Expanded(
            child: staysAsync.when(
              data: (stays) {
                if (stays.isEmpty) {
                  return HodiEmptyState(
                    icon: Icons.hotel_outlined,
                    title: query.nights != null
                        ? 'Nothing free for those dates'
                        : 'Nothing matches those filters',
                    subtitle: query.activeCount > 0
                        ? 'Try other dates, or clear the filters above.'
                        : 'No stay is listed yet. Check back soon.',
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(staysProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 2, 16, 24),
                    itemCount: stays.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
                    itemBuilder: (context, i) => _StayCard(
                    stay: stays[i],
                    onTap: () => context.push('/stays/${stays[i].id}'),
                  ),
                  ),
                );
              },
              loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 220),
              error: (e, _) => HodiErrorState(
                message: e is Exception
                    ? e.toString().replaceFirst('Exception: ', '')
                    : 'Stays could not be loaded',
                onRetry: () => ref.invalidate(staysProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StayCard extends StatelessWidget {
  const _StayCard({required this.stay, this.onTap});

  final StayModel stay;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: stay.coverImage == null
                ? Container(
                    color: HodiColors.surfaceInset,
                    child: const Center(
                      child: Icon(Icons.photo_outlined, size: 32, color: HodiColors.textFaint),
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: '${ApiConstants.baseUrl}${stay.coverImage}',
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Container(color: HodiColors.surfaceInset),
                    errorWidget: (_, _, _) => Container(
                      color: HodiColors.surfaceInset,
                      child: const Center(
                        child: Icon(Icons.broken_image_outlined,
                            size: 28, color: HodiColors.textFaint),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stay.title.isEmpty ? (stay.propertyName ?? 'Stay') : stay.title,
                  style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (stay.area != null) ...[
                  const SizedBox(height: 2),
                  Text(stay.area!, style: HodiTextStyles.bodySmall),
                ],
                // A link rather than a rendered map.
                //
                // Every static map is a billed request, and this is a list — twenty cards would
                // be twenty of them, drawn at thumbnail size beside a photograph that is already
                // doing the work of showing the place. The listing page for a vacant unit gets a
                // real map because it is one listing, opened deliberately.
                if (stay.latitude != null && stay.longitude != null) ...[
                  const SizedBox(height: 6),
                  _MapLink(
                    latitude: stay.latitude!,
                    longitude: stay.longitude!,
                    label: stay.title.isEmpty
                        ? (stay.propertyName ?? 'Stay')
                        : stay.title,
                  ),
                ],
                if (stay.summary.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    stay.summary,
                    style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                  ),
                ],
                const SizedBox(height: 10),
                // The rate only where the server gave one. A listing with no price shows none
                // rather than "KES 0", which reads as free.
                if (stay.nightlyRate != null)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'KES ${CurrencyFormatter.format(stay.nightlyRate!)}',
                          style: HodiTextStyles.currency.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: HodiColors.textDark,
                          ),
                        ),
                        TextSpan(
                          text: ' / night',
                          style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}


/// "Where is this", answered by the maps app the handset already has.
class _MapLink extends StatelessWidget {
  const _MapLink({
    required this.latitude,
    required this.longitude,
    required this.label,
  });

  final double latitude;
  final double longitude;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => HodiWebviewPage(
            title: label,
            url: 'https://www.google.com/maps/search/'
                '?api=1&query=$latitude,$longitude',
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.place_outlined, size: 14, color: HodiColors.primaryStart),
            const SizedBox(width: 4),
            Text(
              'View on map',
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.primaryStart,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Guests, bathrooms and a ceiling on the nightly rate.
///
/// The same three the web keeps here, plus guests — which the web has room for in its top row and
/// a phone does not.
class _MoreFilters extends ConsumerStatefulWidget {
  const _MoreFilters({required this.query});

  final StayQuery query;

  @override
  ConsumerState<_MoreFilters> createState() => _MoreFiltersState();
}

class _MoreFiltersState extends ConsumerState<_MoreFilters> {
  late final TextEditingController _maxNightly;
  late final TextEditingController _minBaths;
  late int? _guests;

  @override
  void initState() {
    super.initState();
    final q = widget.query;
    _maxNightly = TextEditingController(
      text: q.maxNightly == null ? '' : q.maxNightly!.toInt().toString(),
    );
    _minBaths = TextEditingController(text: q.minBathrooms?.toString() ?? '');
    _guests = q.guests;
  }

  @override
  void dispose() {
    _maxNightly.dispose();
    _minBaths.dispose();
    super.dispose();
  }

  void _reset() => setState(() {
        _maxNightly.clear();
        _minBaths.clear();
        _guests = null;
      });

  void _apply() {
    Navigator.of(context).pop();
    ref.read(stayQueryProvider.notifier).applyMore(
          guests: _guests,
          minBathrooms: int.tryParse(_minBaths.text.trim()),
          maxNightly: double.tryParse(_maxNightly.text.trim()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FilterSheet(
      onApply: _apply,
      onReset: _reset,
      children: [
        FilterField(
          label: 'Guests',
          child: Row(
            children: [
              _Stepper(
                onTap: () => setState(
                  () => _guests = (_guests ?? 1) <= 1 ? null : _guests! - 1,
                ),
                icon: Icons.remove,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _guests == null ? 'Any' : '$_guests',
                    style: HodiTextStyles.bodyLarge
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              _Stepper(
                onTap: () => setState(() => _guests = (_guests ?? 0) + 1),
                icon: Icons.add,
              ),
            ],
          ),
        ),
        FilterField(
          label: 'Bathrooms',
          child: FilterNumberField(
              controller: _minBaths, hint: 'Minimum bathrooms'),
        ),
        FilterField(
          label: 'Nightly rate',
          child: FilterNumberField(
              controller: _maxNightly, hint: 'Maximum per night'),
        ),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({required this.onTap, required this.icon});

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HodiColors.surfaceLight,
          shape: BoxShape.circle,
          border: Border.all(color: HodiColors.divider),
        ),
        child: Icon(icon, size: 18, color: HodiColors.textMedium),
      ),
    );
  }
}
