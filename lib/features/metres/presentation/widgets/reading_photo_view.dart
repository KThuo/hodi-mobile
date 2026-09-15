import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../providers/metre_providers.dart';

/// The photograph of the dial, full screen.
///
/// ## Why this exists
///
/// It is the evidence. A reading is typed by somebody standing at a meter, and OCR only helps them
/// type it — the number is corrected by hand when recognition is wrong. The photograph is what a
/// landlord and a tenant can both look at afterwards and agree about, which is why it is stored and
/// why it is reachable from the history rather than only at the moment of capture.
///
/// ## Fetched on demand, and cached
///
/// The history row carries a flag, never a URL or bytes — twenty readings on screen must not drag
/// twenty photographs with them. This opens only when somebody asks, and
/// [CachedNetworkImage] keeps it afterwards: a photograph of a dial at a moment is the one thing
/// that can never change, so re-fetching it is pure waste.
class ReadingPhotoView extends ConsumerWidget {
  const ReadingPhotoView({super.key, required this.readingId, this.periodLabel});

  final String readingId;
  final String? periodLabel;

  /// Opens it over whatever is on screen. Black, because a photograph is easier to read against it.
  static Future<void> open(BuildContext context, String readingId, {String? periodLabel}) {
    return Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => ReadingPhotoView(readingId: readingId, periodLabel: periodLabel),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.read(metreRepositoryProvider).photoUrl(readingId);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(periodLabel == null ? 'Meter photo' : 'Meter photo · $periodLabel'),
      ),
      body: FutureBuilder<String?>(
        // The image is behind the same authority as the reading, so it needs the bearer. This is
        // why it is not simply an Image.network.
        future: ref.read(authLocalStorageProvider).getAccessToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          return InteractiveViewer(
            // Pinch to zoom: the whole point is reading digits off a dial, and a dial photographed
            // from arm's length is small in the frame.
            minScale: 1,
            maxScale: 5,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: url,
                httpHeaders: {
                  if (snapshot.data != null) 'Authorization': 'Bearer ${snapshot.data}',
                },
                fit: BoxFit.contain,
                placeholder: (_, _) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                errorWidget: (_, _, _) => Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.image_not_supported_outlined,
                          color: Colors.white54, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        'That photograph could not be loaded.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: HodiColors.white.withValues(alpha: 0.7)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
