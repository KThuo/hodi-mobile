import 'dart:ui';

/// Where the dials go, in one place.
///
/// ## Why the shape is the shape
///
/// A meter reads left to right along one row, so the band is wide and shallow — shaped like the
/// thing being read, which is most of what tells somebody what to put in it. A square would invite
/// the serial number and the model plate in beside the dials, and the longest run of digits on a
/// meter is very often not the reading.
///
/// ## Why it is shared
///
/// Two screens draw it: the viewfinder aims with it, and the adjust screen crops with it. If they
/// disagree, the person lines the dials up inside one rectangle and a different rectangle is what
/// gets read — a fault nobody would think to look for, because both screens look right on their
/// own. So neither owns it.
abstract class ReadingBand {
  /// The band, centred in a viewport of [size].
  ///
  /// Never taller than a fair share of a short viewport: a photograph wider than the screen leaves
  /// very little height, and a band that outgrew it would be a frame you cannot aim.
  static Rect of(Size size) {
    final width = size.width * 0.86;
    final ceiling = size.height * 0.45;
    final height = (width / 3.4).clamp(ceiling < 56 ? ceiling : 56.0, ceiling);
    return Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );
  }

  /// The same band mapped onto a captured image, given the size it was previewed at.
  ///
  /// The viewfinder needs no inverse matrix the way the adjust screen does: nothing has been
  /// dragged, so the band sits at the same fraction of the image as it did of the preview. Both
  /// are the camera's own aspect ratio, so one ratio carries both axes.
  ///
  /// Clamped to the image, so a rounding error at an edge returns pixels that exist.
  static Rect onImage({required Size preview, required Size image}) {
    final band = of(preview);
    final k = image.width / preview.width;
    return Rect.fromLTRB(
      band.left * k,
      band.top * k,
      band.right * k,
      band.bottom * k,
    ).intersect(Rect.fromLTWH(0, 0, image.width, image.height));
  }
}
