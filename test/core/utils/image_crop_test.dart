import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/core/utils/image_crop.dart';

/// The frame promises that what is inside it is what gets read. That promise is this mapping, and
/// it is the only part of the capture flow that can be wrong quietly — a bad rectangle still
/// produces a picture, still runs the recogniser, and still returns a number, just the wrong one.
void main() {
  // A photograph twice the size it is displayed at, so a mistaken scale shows up as a factor of 2
  // rather than as nothing.
  const image = Size(800, 600);
  const viewport = Size(400, 300);
  const band = Rect.fromLTWH(50, 130, 300, 40);

  group('sourceUnder', () {
    test('untouched, the band maps onto the same part of the photograph, doubled', () {
      final source = ImageCrop.sourceUnder(
        transform: Matrix4.identity(),
        band: band,
        viewport: viewport,
        image: image,
      );

      expect(source, const Rect.fromLTWH(100, 260, 600, 80));
    });

    test('dragging the photograph right reads further left in it', () {
      // The viewer has moved the photograph +40 screen pixels along x; the band therefore sits over
      // pixels 40 display-units earlier, which is 80 source pixels earlier.
      final source = ImageCrop.sourceUnder(
        transform: Matrix4.identity()..translateByDouble(40, 0, 0, 1),
        band: band,
        viewport: viewport,
        image: image,
      );

      expect(source.left, closeTo(20, 0.001));
      expect(source.width, closeTo(600, 0.001));
    });

    test('zooming in narrows what the band covers', () {
      // Twice the magnification, so the same rectangle on screen spans half as much photograph.
      final source = ImageCrop.sourceUnder(
        transform: Matrix4.identity()..scaleByDouble(2, 2, 1, 1),
        band: band,
        viewport: viewport,
        image: image,
      );

      expect(source.width, closeTo(300, 0.001));
      expect(source.height, closeTo(40, 0.001));
      expect(source.left, closeTo(50, 0.001));
    });

    test('a frame dragged off the edge returns the part that exists', () {
      final source = ImageCrop.sourceUnder(
        transform: Matrix4.identity()..translateByDouble(300, 0, 0, 1),
        band: band,
        viewport: viewport,
        image: image,
      );

      expect(source.left, 0);
      expect(source.right, greaterThan(0));
      expect(source.right, lessThanOrEqualTo(image.width));
    });
  });
}
