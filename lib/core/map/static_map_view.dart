import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/hodi_border_radius.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';
import '../widgets/hodi_webview_page.dart';
import 'map_config.dart';

/// Where a listing is, as a picture.
///
/// A Maps Static API image rather than an interactive map, because the key is fetched from the
/// server at runtime and only the static endpoint can take a key that late — see [MapConfig] for
/// why the interactive plugin cannot. What is lost is pan and zoom; what a listing page needs is
/// "where is this", and tapping hands the question to the maps app the handset already has.
///
/// Renders nothing at all when there are no coordinates or no key. A grey box labelled "map
/// unavailable" is worse than no map: it reads as a fault on a page where nothing is wrong.
class StaticMapView extends ConsumerWidget {
  final double? latitude;
  final double? longitude;

  /// Shown in the title bar of the full map, and as the pin's label in the maps app.
  final String label;
  final double height;
  final int zoom;

  const StaticMapView({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.label,
    this.height = 160,
    this.zoom = 15,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lat = latitude;
    final lng = longitude;
    if (lat == null || lng == null) return const SizedBox.shrink();

    final config = ref.watch(mapConfigProvider).value;
    if (config == null || !config.enabled) return const SizedBox.shrink();

    // The device's own pixel ratio, capped at 2 — Google's `scale` parameter accepts 1 or 2 and
    // nothing else, so asking for 3 on a modern handset returns an error image rather than a map.
    final scale = math.min(
      2,
      MediaQuery.maybeDevicePixelRatioOf(context)?.round() ?? 2,
    );

    return ClipRRect(
      borderRadius: HodiBorderRadius.card,
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth.isFinite
                    ? constraints.maxWidth.round()
                    : 640;
                return CachedNetworkImage(
                  imageUrl: _staticMapUrl(
                    apiKey: config.apiKey,
                    lat: lat,
                    lng: lng,
                    width: width,
                    height: height.round(),
                    scale: scale,
                    zoom: zoom,
                  ),
                  fit: BoxFit.cover,
                  placeholder: (_, _) =>
                      Container(color: HodiColors.surfaceInset),
                  // A failed tile is still just a missing nicety. Collapse rather than shout.
                  errorWidget: (_, _, _) => const SizedBox.shrink(),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => HodiWebviewPage(
                      title: label,
                      // No key in this one: it is the ordinary public map page, which is what
                      // somebody wants for directions anyway.
                      url: 'https://www.google.com/maps/search/'
                          '?api=1&query=$lat,$lng',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: HodiColors.white.withValues(alpha: 0.92),
                borderRadius: HodiBorderRadius.full,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.open_in_new, size: 12, color: HodiColors.primaryStart),
                  const SizedBox(width: 5),
                  Text(
                    'Open map',
                    style: HodiTextStyles.bodySmall.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: HodiColors.primaryStart,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A Maps Static API request.
///
/// `size` is in CSS pixels and `scale` multiplies it, so a 2× request of 400x160 comes back as
/// 800x320 — which is why the size passed here is the layout size and not the pixel size. The
/// free tier caps `size` at 640 per side before scaling, so the width is clamped: a tablet asking
/// for 900 gets an error image instead of a wide map.
String _staticMapUrl({
  required String apiKey,
  required double lat,
  required double lng,
  required int width,
  required int height,
  required int scale,
  required int zoom,
}) {
  final w = width.clamp(1, 640);
  final h = height.clamp(1, 640);
  final centre = '$lat,$lng';
  return Uri.https('maps.googleapis.com', '/maps/api/staticmap', {
    'center': centre,
    'zoom': '$zoom',
    'size': '${w}x$h',
    'scale': '$scale',
    'maptype': 'roadmap',
    'markers': 'color:red|$centre',
    'key': apiKey,
  }).toString();
}
