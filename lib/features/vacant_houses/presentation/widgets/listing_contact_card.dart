import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/contact_actions.dart';
import '../../domain/vacant_house_detail_model.dart';

/// How to enquire about a vacant unit.
///
/// The three the web's `ListingPage` offers — WhatsApp, call, email — and nothing more. There is no
/// apply-online or reserve flow on this platform, and inventing one on the phone would promise
/// something the server cannot complete.
class ListingContactCard extends StatelessWidget {
  const ListingContactCard({super.key, required this.detail});

  final VacantHouseDetailModel detail;

  String get _message {
    final what = detail.title.isEmpty ? 'a unit' : detail.title;
    final where =
        detail.propertyName != null ? ' at ${detail.propertyName}' : '';
    return 'Hello, I saw $what$where on HODI and would like to enquire about it.';
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Enquire', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          if (detail.contactName != null) ...[
            const SizedBox(height: 6),
            Text(detail.contactName!,
                style: HodiTextStyles.bodyMedium
                    .copyWith(fontWeight: FontWeight.w600)),
          ],
          const SizedBox(height: 14),
          if (detail.contactPhone != null) ...[
            FilledButton.icon(
              onPressed: () => _run(
                context,
                () => ContactActions.whatsApp(detail.contactPhone, _message),
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
                () => ContactActions.call(detail.contactPhone),
                'No dialler on this phone.',
              ),
              icon: const Icon(Icons.phone_outlined, size: 18),
              label: Text(detail.contactPhone!),
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
          if (detail.contactEmail != null) ...[
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => _run(
                context,
                () => ContactActions.email(
                  detail.contactEmail,
                  subject: detail.title.isEmpty ? 'Enquiry' : detail.title,
                  body: _message,
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
