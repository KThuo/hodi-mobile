import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_constants.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../domain/stay_model.dart';
import '../providers/stay_providers.dart';

/// HODI BNB's public half, on the phone.
///
/// Reachable without signing in — it is beside To Let on the sign-in screen for the same reason the
/// web puts both in the public layout: somebody looking for somewhere to stay does not have an
/// account yet, and asking them to make one before they can look is asking in the wrong order.
class StaysScreen extends ConsumerWidget {
  const StaysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staysAsync = ref.watch(staysProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Stays'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: HodiSearchBar(
              hintText: 'Where are you going?',
              onChanged: (term) => ref.read(stayQueryProvider.notifier).search(term),
            ),
          ),
          Expanded(
            child: staysAsync.when(
              data: (stays) {
                if (stays.isEmpty) {
                  return const HodiEmptyState(
                    icon: Icons.hotel_outlined,
                    title: 'Nothing available',
                    subtitle: 'No stay matches that yet. Try a different place or fewer guests.',
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(staysProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: stays.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
                    itemBuilder: (context, i) => _StayCard(stay: stays[i]),
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
  const _StayCard({required this.stay});

  final StayModel stay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      clipBehavior: Clip.antiAlias,
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
    );
  }
}
