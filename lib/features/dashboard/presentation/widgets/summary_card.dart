import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/utils/currency_formatter.dart';

/// One headline figure.
///
/// ## Why this stopped being a coloured slab
///
/// It was a saturated gradient rectangle with white text on it, and there were thirty-four such
/// fills across fifteen files. Four of them sit together on the dashboard, so the first thing
/// somebody saw on opening the app was four competing blocks of colour with the actual figures
/// written faintly over them. Correcting the brand made it worse rather than better: HODI's blue
/// into magenta is more vivid than the indigo-into-purple it replaced.
///
/// Two references agree on the answer, which is what makes it the answer rather than a preference:
///
/// - **`hodi-f`'s `KpiTile`** — HODI's own design language for this exact component — is a white
///   surface with a four-pixel coloured left edge, a small muted label, and the figure itself in the
///   tone colour. The colour says *which* figure this is; it does not fill the card.
/// - **`axis-m`** has exactly one gradient in the whole application, on its home header, and it is
///   built from the ink rather than the brand. Everywhere else is a flat surface with muted labels,
///   and colour appears as a low-alpha wash.
///
/// So the tone moves to the edge and the icon, and the figure becomes the loudest thing on the card,
/// which is what a card showing a figure is for.
class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.label,
    required this.amount,
    required this.icon,
    required this.tone,
    this.note,
  });

  final String label;
  final double amount;
  final IconData icon;

  /// Which figure this is, in colour — the left edge, the icon, and the figure itself.
  final Color tone;

  /// What the figure is of, or what it is made of. Optional; the card reads fine without it.
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        border: Border(
          // The solid edge that says which figure this is, as the web's tile has.
          left: BorderSide(color: tone, width: 4),
          top: const BorderSide(color: HodiColors.divider),
          right: const BorderSide(color: HodiColors.divider),
          bottom: const BorderSide(color: HodiColors.divider),
        ),
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: tone, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: HodiColors.textLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'KES ${CurrencyFormatter.format(amount)}',
                // Tabular figures, so a column of amounts lines up digit under digit. The web asks
                // for the same thing for the same reason.
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: tone,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (note != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    note!,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: HodiColors.textLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
