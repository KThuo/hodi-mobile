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
/// This now follows `axis-m`'s figure card, which solves it with a **wash rather than a rule**: the
/// tone is blended into the surface at 6% and bordered at 22%, so the whole card is faintly that
/// colour. Its own note says what the colour is for — *"the colour identifies which figure it is at
/// a glance — the point of a dashboard is being read from arm's length — and it carries no claim
/// about the number being good or bad."*
///
/// Two details of that are worth copying exactly:
///
/// - **The wash is blended, not laid over.** `Color.alphaBlend` against the surface gives an opaque
///   colour; a translucent fill would pick up whatever sits behind the card and shift between
///   screens.
/// - **The label carries the tone; the figure is ink.** Colouring the number too made the card read
///   as a status rather than a measurement. One coloured element per card is enough to identify it.
///
/// A four-pixel left rule was the previous attempt, borrowed from `hodi-f`'s `KpiTile`. It works on
/// a wide web tile beside eleven others; on a phone, four of them stacked two-by-two read as stripes
/// down the page rather than as a set of cards.
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
    // Blended against the surface rather than laid over it — see the note above.
    final wash = Color.alphaBlend(
      tone.withValues(alpha: 0.06),
      HodiColors.cardBackground,
    );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: wash,
        borderRadius: HodiBorderRadius.card,
        border: Border.all(color: tone.withValues(alpha: 0.22)),
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: tone, size: 22),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: tone,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          // Shrinks rather than clipping: a figure in the millions must stay readable, and an
          // ellipsis in the middle of an amount is worse than a slightly smaller one.
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              'KES ${CurrencyFormatter.format(amount)}',
              // Tabular figures, so a column of amounts lines up digit under digit.
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
                color: HodiColors.textDark,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
              maxLines: 1,
            ),
          ),
          if (note != null)
            Text(
              note!,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: HodiColors.textMedium,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
