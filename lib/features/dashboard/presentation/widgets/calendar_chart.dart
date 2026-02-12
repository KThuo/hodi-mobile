import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_gradients.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/calendar_data.dart';

class CalendarChart extends StatelessWidget {
  final CalendarData data;

  const CalendarChart({super.key, required this.data});

  static const _monthLabels = [
    'J', 'F', 'M', 'A', 'M', 'J',
    'J', 'A', 'S', 'O', 'N', 'D',
  ];

  @override
  Widget build(BuildContext context) {
    final values = data.monthlyValues;
    final maxVal = data.maxMonth;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Payments',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: HodiColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Total: KES ${CurrencyFormatter.format(data.total)}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: HodiColors.textMedium,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(12, (index) {
                final value = values[index];
                final heightFraction = maxVal > 0 ? value / maxVal : 0.0;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: FractionallySizedBox(
                            heightFactor: heightFraction.clamp(0.05, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient:
                                    value > 0 ? HodiGradients.primary : null,
                                color: value == 0
                                    ? HodiColors.surfaceLight
                                    : null,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _monthLabels[index],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: HodiColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
