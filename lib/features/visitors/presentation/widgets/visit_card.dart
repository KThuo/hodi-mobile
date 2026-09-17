import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/visit_model.dart';

/// One visitor, and — where they are waiting — the answer.
///
/// Approve and Refuse are on the card rather than behind a tap into a detail screen. Somebody is
/// standing at a gate while this is read, and a decision that costs a navigation first has already
/// spent the time the feature exists to save.
class VisitCard extends StatelessWidget {
  const VisitCard({
    super.key,
    required this.visit,
    required this.canDecide,
    required this.canCheckOut,
    required this.onApprove,
    required this.onRefuse,
    required this.onCheckOut,
  });

  final VisitModel visit;
  final bool canDecide;
  final bool canCheckOut;
  final VoidCallback onApprove;
  final VoidCallback onRefuse;
  final VoidCallback onCheckOut;

  @override
  Widget build(BuildContext context) {
    final waiting = visit.awaitingDecision;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
        // A waiting visitor gets an edge. Everything else on the list is history.
        border: waiting
            ? Border.all(color: HodiColors.warningStart.withValues(alpha: 0.5), width: 1.5)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: HodiColors.surfaceInset,
                    borderRadius: HodiBorderRadius.small,
                  ),
                  child: Icon(
                    visit.vehicle != null
                        ? Icons.directions_car_outlined
                        : Icons.person_outline,
                    color: HodiColors.textMedium,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        visit.visitorName,
                        style: HodiTextStyles.bodyLarge
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        [
                          if (visit.purpose != null) _purpose(visit.purpose!),
                          if (visit.partyLabel != null) visit.partyLabel!,
                          if (visit.unit.isNotEmpty) visit.unit,
                        ].join(' · '),
                        style: HodiTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                _ApprovalPill(visit: visit),
              ],
            ),

            const SizedBox(height: 12),

            if (visit.visitorPhone != null)
              _Line(icon: Icons.phone_outlined, text: visit.visitorPhone!),
            if (visit.vehicle != null)
              _Line(icon: Icons.directions_car_outlined, text: visit.vehicle!),
            // Whether identification was taken, never the number. The real one is behind
            // ROLE_VISIT_REVEAL and this app does not ask for it.
            if (visit.hasIdNumber)
              _Line(
                icon: Icons.badge_outlined,
                text: [
                  if (visit.idType != null) visit.idType!,
                  visit.idNumber ?? 'on file',
                ].join(' '),
              ),
            if (visit.purposeNotes != null && visit.purposeNotes!.isNotEmpty)
              _Line(icon: Icons.notes_outlined, text: visit.purposeNotes!),
            _Line(
              icon: Icons.login_outlined,
              text: visit.onSite
                  ? 'Arrived ${_when(visit.checkedInOn)}'
                        '${visit.onSiteFor != null ? ' · here ${visit.onSiteFor}' : ''}'
                  : 'Arrived ${_when(visit.checkedInOn)}'
                        '${visit.checkedOutOn != null ? ' · left ${_when(visit.checkedOutOn)}' : ''}',
            ),

            if (waiting && canDecide) ...[
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onRefuse,
                      icon: const Icon(Icons.close, size: 18),
                      label: const Text('Refuse'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: HodiColors.errorStart,
                        side: const BorderSide(color: HodiColors.errorStart),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onApprove,
                      icon: const Icon(Icons.check, size: 18),
                      label: const Text('Let in'),
                      style: FilledButton.styleFrom(
                        backgroundColor: HodiColors.successStart,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],

            if (!waiting && visit.onSite && canCheckOut) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: onCheckOut,
                  icon: const Icon(Icons.logout, size: 18),
                  label: const Text('Check out'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: HodiColors.primaryStart,
                    side: BorderSide(color: HodiColors.primaryStart),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static String _purpose(String code) => switch (code.toUpperCase()) {
        'DELIVERY' => 'Delivery',
        'GUEST' => 'Guest',
        'CONTRACTOR' => 'Contractor',
        'VIEWING' => 'Viewing',
        'SERVICE' => 'Service',
        _ => code[0].toUpperCase() + code.substring(1).toLowerCase(),
      };

  /// Today is the common case at a gate, and the date on it is noise.
  static String _when(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatTimeOrDate(parsed);
  }
}

class _ApprovalPill extends StatelessWidget {
  const _ApprovalPill({required this.visit});

  final VisitModel visit;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, label) = switch (visit.approvalStatus) {
      'PENDING' => (HodiColors.warningBg, HodiColors.warningEnd, 'Waiting'),
      'APPROVED' => (HodiColors.successBg, HodiColors.successEnd, 'Let in'),
      'REJECTED' => (HodiColors.dangerBg, HodiColors.errorStart, 'Refused'),
      _ => (HodiColors.surfaceInset, HodiColors.textMedium, 'No approval needed'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: HodiTextStyles.bodySmall.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: HodiColors.textLight),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textMedium),
            ),
          ),
        ],
      ),
    );
  }
}
