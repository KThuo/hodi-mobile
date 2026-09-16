import 'dart:io';
import 'dart:ui' as ui;

// rendering, not painting, for the one reason that it re-exports Matrix4.
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

abstract class ImageCrop {
  /// Which part of the source image is sitting under [band] right now.
  ///
  /// [transform] is an [InteractiveViewer]'s matrix, which maps the displayed photograph onto the
  /// screen. Inverted, it answers the question the other way round: given a rectangle drawn on the
  /// screen, which pixels of the photograph are beneath it. [viewport] is the size the photograph
  /// is displayed at — the fit is uniform, so the one ratio between it and [image] carries both
  /// axes — and the result is clamped to the photograph so a frame dragged past an edge returns
  /// the part that exists rather than coordinates that do not.
  static Rect sourceUnder({
    required Matrix4 transform,
    required Rect band,
    required Size viewport,
    required Size image,
  }) {
    final inverse = Matrix4.tryInvert(transform) ?? Matrix4.identity();
    final topLeft = MatrixUtils.transformPoint(inverse, band.topLeft);
    final bottomRight = MatrixUtils.transformPoint(inverse, band.bottomRight);
    final k = image.width / viewport.width;

    return Rect.fromLTRB(
      topLeft.dx * k,
      topLeft.dy * k,
      bottomRight.dx * k,
      bottomRight.dy * k,
    ).intersect(Rect.fromLTWH(0, 0, image.width, image.height));
  }

  /// Cuts [source] out of [image] and writes it as a PNG in the temp directory.
  ///
  /// The crop is drawn at [scale]× because the band of dials on a meter is a small part of a
  /// photograph, and recognition on a forty-pixel-tall strip is markedly worse than on the same
  /// strip enlarged. The enlargement invents no detail, but it gives the recogniser the glyph
  /// heights it was tuned for, and it costs a few milliseconds against a pass that would
  /// otherwise come back empty.
  ///
  /// PNG, not JPEG: the whole point of the crop is to hand the recogniser clean digit edges, and
  /// JPEG ringing around high-contrast digits is exactly the artefact that turns an 8 into a 3.
  /// The file is small — it is a strip, not a photograph — so there is nothing to save by it.
  static Future<File> toPngFile(
    ui.Image image,
    Rect source, {
    double scale = 3,
  }) async {
    final width = (source.width * scale).round().clamp(1, 4096).toInt();
    final height = (source.height * scale).round().clamp(1, 4096).toInt();

    final recorder = ui.PictureRecorder();
    Canvas(recorder).drawImageRect(
      image,
      source,
      Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      Paint()..filterQuality = FilterQuality.high,
    );
    final picture = recorder.endRecording();
    final ui.Image cropped;
    try {
      cropped = await picture.toImage(width, height);
    } finally {
      picture.dispose();
    }

    try {
      final data = await cropped.toByteData(format: ui.ImageByteFormat.png);
      if (data == null) {
        throw StateError('Could not encode the cropped reading');
      }
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/reading_crop_${DateTime.now().microsecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
      return file;
    } finally {
      cropped.dispose();
    }
  }
}
