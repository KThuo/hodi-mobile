import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/metres/presentation/widgets/reading_band.dart';

void main() {
  group('the reading band', () {
    test('is wide and shallow, shaped like a row of dials', () {
      final band = ReadingBand.of(const Size(400, 800));

      expect(band.width, 400 * 0.86);
      expect(band.width / band.height, greaterThan(2),
          reason: 'a squarer frame invites the serial number in beside the dials');
    });

    test('is centred, so the aim is the middle of the screen', () {
      final band = ReadingBand.of(const Size(400, 800));
      expect(band.center, const Offset(200, 400));
    });

    test('never outgrows a short viewport', () {
      // A frame taller than a fair share of the screen is one you cannot aim: there is nothing
      // left around it to see the meter by.
      final band = ReadingBand.of(const Size(900, 120));
      expect(band.height, lessThanOrEqualTo(120 * 0.45));
    });

    test('maps onto the captured image at the same fraction it had of the preview', () {
      // Nothing is dragged in the viewfinder, so one ratio carries both axes. If this drifted, the
      // dials somebody lined up would not be the pixels read.
      const preview = Size(400, 800);
      const image = Size(1200, 2400);

      final onScreen = ReadingBand.of(preview);
      final onImage = ReadingBand.onImage(preview: preview, image: image);

      expect(onImage.left, onScreen.left * 3);
      expect(onImage.width, onScreen.width * 3);
      expect(onImage.center.dx, image.width / 2);
    });

    test('is clamped to the image, so an edge returns pixels that exist', () {
      final band = ReadingBand.onImage(
        preview: const Size(400, 800),
        image: const Size(100, 50),
      );

      expect(band.left, greaterThanOrEqualTo(0));
      expect(band.top, greaterThanOrEqualTo(0));
      expect(band.right, lessThanOrEqualTo(100));
      expect(band.bottom, lessThanOrEqualTo(50));
    });
  });
}
