import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_border_radius.dart';

class HodiLoadingShimmer extends StatelessWidget {
  final int itemCount;
  final double itemHeight;

  const HodiLoadingShimmer({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: HodiColors.surfaceLight,
      highlightColor: HodiColors.white,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: itemHeight,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: HodiColors.white,
              borderRadius: HodiBorderRadius.card,
            ),
          );
        },
      ),
    );
  }
}
