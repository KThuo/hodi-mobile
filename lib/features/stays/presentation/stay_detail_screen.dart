import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_constants.dart';
import '../../../core/map/static_map_view.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/contact_actions.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/stay_detail_model.dart';
import '../providers/stay_detail_providers.dart';

/// One stay: what it is, what the dates cost, and how to reach whoever lets it.
///
/// **There is no Book button, and that is the platform's position rather than an omission.**
/// Creating a booking is `POST /bnb/bookings` behind `ROLE_BOOKING_NEW` — an operator authority, so
/// a guest cannot raise one. `hodi-f`'s own stay page says the same in its header: *the booking
/// itself is the next slice; the WhatsApp route stays regardless, because it is how a great deal of
/// this market actually books.* This screen does what the browser does.
///
/// What it does add over the browse list is the **quote**: real dates, real nights, real total,
/// answered by the server — which is the question somebody has before they call anybody.
class StayDetailScreen extends ConsumerWidget {
  const StayDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(stayDetailProvider(id));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Stay'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 140),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That stay is no longer available.',
          onRetry: () => ref.invalidate(stayDetailProvider(id)),
        ),
        data: (stay) {
          if (stay == null) {
            return const HodiErrorState(
                message: 'That stay is no longer available.');
          }

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              if (stay.images.isNotEmpty) _Gallery(images: stay.images),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stay.title, style: HodiTextStyles.heading2),
                    const SizedBox(height: 4),
                    Text(
                      [
                        if (stay.propertyName != null) stay.propertyName!,
                        if (stay.area != null) stay.area!,
                      ].join(' · '),
                      style: HodiTextStyles.bodyMedium
                          .copyWith(color: HodiColors.textMedium),
                    ),
                    if (stay.sleepsLine.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(stay.sleepsLine, style: HodiTextStyles.bodySmall),
                    ],
                    if (stay.nightlyRate != null) ...[
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'KES ${CurrencyFormatter.format(stay.nightlyRate!)}',
                              style: HodiTextStyles.currency.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: HodiColors.textDark,
                              ),
                            ),
                            TextSpan(
                              text: ' / night',
                              style: HodiTextStyles.bodySmall
                                  .copyWith(color: HodiColors.textLight),
                            ),
                          ],
                        ),
                      ),
                    ],
                    // Said before dates are picked, not after. Finding out about a minimum stay
                    // once you have chosen is finding out too late.
                    if (stay.minNights > 1) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Minimum ${stay.minNights} nights',
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.textLight),
                      ),
                    ],

                    const SizedBox(height: 20),
                    _QuoteCard(stay: stay),

                    if (stay.description != null &&
                        stay.description!.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Text('About', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(stay.description!, style: HodiTextStyles.bodyMedium),
                    ],

                    if (stay.amenities.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Text('What is here',
                          style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final a in stay.amenities)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 7),
                              decoration: BoxDecoration(
                                color: HodiColors.surfaceInset,
                                borderRadius: HodiBorderRadius.full,
                              ),
                              child: Text(a.name,
                                  style: HodiTextStyles.bodySmall),
                            ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 20),
                    StaticMapView(
                      latitude: stay.latitude,
                      longitude: stay.longitude,
                      label: stay.title,
                    ),

                    if (stay.hasContact) ...[
                      const SizedBox(height: 20),
                      _ContactCard(stay: stay),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, i) => CachedNetworkImage(
          imageUrl: images[i].startsWith('http')
              ? images[i]
              : '${ApiConstants.baseUrl}${images[i]}',
          fit: BoxFit.cover,
          placeholder: (_, _) => Container(color: HodiColors.surfaceInset),
          errorWidget: (_, _, _) => Container(
            color: HodiColors.surfaceInset,
            child: const Center(
              child: Icon(Icons.broken_image_outlined,
                  size: 32, color: HodiColors.textFaint),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dates in, price out.
class _QuoteCard extends ConsumerWidget {
  const _QuoteCard({required this.stay});

  final StayDetailModel stay;

  Future<void> _pickDates(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
      helpText: 'Which nights',
      saveText: 'Price it',
    );
    if (picked != null) {
      ref.read(stayEnquiryProvider.notifier).setDates(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enquiry = ref.watch(stayEnquiryProvider);
    final quoteAsync = ref.watch(stayQuoteProvider(stay.id));

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => _pickDates(context, ref),
            borderRadius: HodiBorderRadius.small,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Your nights',
                border: OutlineInputBorder(),
              ),
              child: Row(
                children: [
                  Text(
                    enquiry.complete
                        ? '${DateFormatter.formatDate(enquiry.checkIn!)} → '
                            '${DateFormatter.formatDate(enquiry.checkOut!)}'
                        : 'Choose dates',
                    style: HodiTextStyles.bodyMedium.copyWith(
                      color: enquiry.complete
                          ? HodiColors.textDark
                          : HodiColors.textLight,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.date_range_outlined, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('Guests', style: HodiTextStyles.bodyMedium),
              const Spacer(),
              IconButton(
                onPressed: enquiry.guests > 1
                    ? () => ref
                        .read(stayEnquiryProvider.notifier)
                        .setGuests(enquiry.guests - 1)
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('${enquiry.guests}',
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600)),
              IconButton(
                // Capped at what the place sleeps, where the server said. Asking to price eight
                // guests into a place that sleeps four is a question with a known answer.
                onPressed: (stay.sleeps == null || enquiry.guests < stay.sleeps!)
                    ? () => ref
                        .read(stayEnquiryProvider.notifier)
                        .setGuests(enquiry.guests + 1)
                    : null,
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),

          if (enquiry.complete) ...[
            const Divider(height: 24, color: HodiColors.divider),
            quoteAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text(
                e is Exception
                    ? e.toString().replaceFirst('Exception: ', '')
                    : 'That price could not be worked out.',
                style: HodiTextStyles.bodySmall
                    .copyWith(color: HodiColors.errorStart),
              ),
              data: (quote) {
                if (quote == null) return const SizedBox.shrink();

                // Unavailable is a successful answer with reasons in it, not a failure — the
                // controller is explicit that "those nights are taken" is what was asked about.
                if (!quote.available) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.event_busy_outlined,
                              size: 18, color: HodiColors.warningEnd),
                          const SizedBox(width: 8),
                          Text(
                            'Not available',
                            style: HodiTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: HodiColors.warningEnd,
                            ),
                          ),
                        ],
                      ),
                      for (final reason in quote.reasons)
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 26),
                          child: Text(reason,
                              style: HodiTextStyles.bodySmall
                                  .copyWith(color: HodiColors.textMedium)),
                        ),
                    ],
                  );
                }

                return Column(
                  children: [
                    _Line(
                      label: '${quote.nights} night${quote.nights == 1 ? '' : 's'}',
                      amount: quote.nightsTotal,
                      currency: quote.currency,
                    ),
                    if (quote.cleaningFee > 0)
                      _Line(
                        label: 'Cleaning',
                        amount: quote.cleaningFee,
                        currency: quote.currency,
                      ),
                    const Divider(height: 18, color: HodiColors.divider),
                    _Line(
                      label: 'Total',
                      amount: quote.total,
                      currency: quote.currency,
                      bold: true,
                    ),
                  ],
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
    required this.label,
    required this.amount,
    required this.currency,
    this.bold = false,
  });

  final String label;
  final double amount;
  final String currency;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: HodiTextStyles.bodyMedium.copyWith(
                fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
          Text(
            '$currency ${CurrencyFormatter.format(amount)}',
            style: HodiTextStyles.currency.copyWith(
              fontSize: bold ? 17 : 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// How to reach whoever lets it.
///
/// The enquiry carries the dates where they have been chosen, so the first message already says
/// what is being asked about instead of starting a conversation that has to establish it.
class _ContactCard extends ConsumerWidget {
  const _ContactCard({required this.stay});

  final StayDetailModel stay;

  String _message(WidgetRef ref) {
    final enquiry = ref.read(stayEnquiryProvider);
    final dates = enquiry.complete
        ? ' for ${DateFormatter.formatDate(enquiry.checkIn!)} to '
            '${DateFormatter.formatDate(enquiry.checkOut!)}'
            '${enquiry.guests > 1 ? ', ${enquiry.guests} guests' : ''}'
        : '';
    return 'Hello, I saw ${stay.title}'
        '${stay.propertyName != null ? ' at ${stay.propertyName}' : ''}'
        ' on HODI and would like to book it$dates.';
  }

  Future<void> _run(
    BuildContext context,
    Future<bool> Function() action,
    String whenMissing,
  ) async {
    final ok = await action();
    if (!context.mounted || ok) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(whenMissing)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Book it', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            // Said plainly rather than implied by a missing button.
            'Bookings are taken directly. Get in touch and they will hold the dates.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
          if (stay.contactName != null) ...[
            const SizedBox(height: 10),
            Text(stay.contactName!,
                style: HodiTextStyles.bodyMedium
                    .copyWith(fontWeight: FontWeight.w600)),
          ],
          const SizedBox(height: 14),
          if (stay.contactPhone != null) ...[
            FilledButton.icon(
              onPressed: () => _run(
                context,
                () => ContactActions.whatsApp(stay.contactPhone, _message(ref)),
                'No WhatsApp on this phone.',
              ),
              icon: const Icon(Icons.chat_bubble_outline, size: 18),
              label: const Text('Message on WhatsApp'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => _run(
                context,
                () => ContactActions.call(stay.contactPhone),
                'No dialler on this phone.',
              ),
              icon: const Icon(Icons.phone_outlined, size: 18),
              label: Text(stay.contactPhone!),
              style: OutlinedButton.styleFrom(
                foregroundColor: HodiColors.primaryStart,
                side: BorderSide(color: HodiColors.primaryStart),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
          if (stay.contactEmail != null) ...[
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => _run(
                context,
                () => ContactActions.email(
                  stay.contactEmail,
                  subject: stay.title,
                  body: _message(ref),
                ),
                'No mail app on this phone.',
              ),
              icon: const Icon(Icons.mail_outline, size: 18),
              label: const Text('Email'),
              style: OutlinedButton.styleFrom(
                foregroundColor: HodiColors.textMedium,
                side: const BorderSide(color: HodiColors.dividerStrong),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
