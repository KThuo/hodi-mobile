import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../domain/dashboard_summary.dart';

class PropertyPerformance extends StatelessWidget {
  final DashboardSummary summary;

  const PropertyPerformance({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final rate = summary.occupancyRate;
    final occupied = summary.occupiedUnits ?? 0;
    final total = summary.totalUnits ?? 0;
    final vacant = total - occupied;
    final badge = _performanceBadge(rate);

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
          Row(
            children: [
              const Icon(Icons.apartment, size: 20, color: HodiColors.primaryStart),
              const SizedBox(width: 8),
              Text('Property Performance', style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),

          // Occupancy rate + badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${rate.toStringAsFixed(1)}%',
                style: GoogleFonts.robotoMono(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: HodiColors.textDark,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badge.color.withValues(alpha: 0.12),
                  borderRadius: HodiBorderRadius.badge,
                ),
                child: Text(
                  badge.label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: badge.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Occupancy Rate', style: HodiTextStyles.bodySmall),

          const SizedBox(height: 16),

          // Units breakdown row
          Row(
            children: [
              _UnitDot(color: HodiColors.successStart, label: 'Occupied', count: occupied),
              const SizedBox(width: 16),
              _UnitDot(color: HodiColors.errorStart, label: 'Vacant', count: vacant),
              const SizedBox(width: 16),
              _UnitDot(color: HodiColors.primaryStart, label: 'Total', count: total),
            ],
          ),

          const SizedBox(height: 16),

          // Progress bar
          ClipRRect(
            borderRadius: HodiBorderRadius.full,
            child: LinearProgressIndicator(
              value: rate / 100,
              minHeight: 8,
              backgroundColor: HodiColors.surfaceLight,
              valueColor: AlwaysStoppedAnimation<Color>(badge.color),
            ),
          ),
        ],
      ),
    );
  }

  _PerformanceBadge _performanceBadge(double rate) {
    if (rate >= 95) return const _PerformanceBadge('Excellent', HodiColors.successStart);
    if (rate >= 80) return const _PerformanceBadge('Good', HodiColors.primaryStart);
    if (rate >= 60) return const _PerformanceBadge('Fair', HodiColors.warningStart);
    return const _PerformanceBadge('Needs Attention', HodiColors.errorStart);
  }
}

class _PerformanceBadge {
  final String label;
  final Color color;
  const _PerformanceBadge(this.label, this.color);
}

class _UnitDot extends StatelessWidget {
  final Color color;
  final String label;
  final int count;

  const _UnitDot({required this.color, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          '$label: $count',
          style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
        ),
      ],
    );
  }
}
