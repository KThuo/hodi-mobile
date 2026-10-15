import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../domain/pass_model.dart';

/// Whether a pass is good, in one banner — the first thing the gate and the host read.
///
/// Green is the only colour that means "let them in". Waiting for the day is amber; already
/// inside is the brand colour; everything else is red.
class PassStateBanner extends StatelessWidget {
  final PassModel pass;
  final bool large;

  const PassStateBanner({super.key, required this.pass, this.large = false});

  @override
  Widget build(BuildContext context) {
    final (icon, colour) = switch (pass.state) {
      'VALID' => (Icons.verified, HodiColors.successEnd),
      'NOT_YET' => (Icons.schedule, HodiColors.warningEnd),
      'ON_SITE' => (Icons.login, HodiColors.primaryStart),
      _ => (Icons.block, HodiColors.errorEnd),
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: large ? 16 : 10),
      decoration: BoxDecoration(
        color: colour.withValues(alpha: 0.12),
        borderRadius: HodiBorderRadius.card,
      ),
      child: Row(
        children: [
          Icon(icon, color: colour, size: large ? 30 : 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              pass.stateLabel,
              style: (large ? HodiTextStyles.heading3 : HodiTextStyles.bodyMedium)
                  .copyWith(color: colour, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

/// A label and its value, one line each, for the pass's details.
class PassFact extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PassFact({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: HodiColors.textLight),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight)),
                const SizedBox(height: 2),
                Text(value, style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// `Sat 18 Oct`, or `Sat 18 – Mon 20 Oct` for a pass covering several days.
String passDays(PassModel pass) {
  final from = DateTime.tryParse(pass.validFrom);
  final until = DateTime.tryParse(pass.validUntil);
  if (from == null || until == null) return pass.validFrom;
  final day = DateFormat('EEE d MMM');
  if (from == until) return day.format(from);
  return '${day.format(from)} – ${day.format(until)}';
}

/// "Visiting", "Delivery" — the reasons as people say them.
String purposeLabel(String code) => switch (code) {
      'SOCIAL' => 'Visiting',
      'DELIVERY' => 'Delivery',
      'SERVICE' => 'Service or repair',
      'VIEWING' => 'Viewing',
      'OFFICIAL' => 'Official',
      'STAFF' => 'Staff',
      _ => 'Other',
    };
