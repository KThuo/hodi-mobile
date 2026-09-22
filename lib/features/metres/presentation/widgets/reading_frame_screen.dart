import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/image_crop.dart';
import 'reading_band.dart';

/// Where the reading goes — and, because of that, what gets read.
///
/// ## Why the frame exists
///
/// The camera used to hand back a whole photograph and the recogniser was turned loose on all of
/// it, after which the longest run of digits won. On a meter the longest run of digits is very
/// often *not* the reading: it is the serial number etched beside the dials, or the number on the
/// model plate, or the certification year. That is the whole of the complaint that what is read
/// and what is being looked at are different things.
///
/// So the frame is not advice about how to hold the phone. It is the mechanism: the pixels inside
/// the rectangle are cut out and are the only pixels the recogniser is ever given, and everything
/// outside is discarded before recognition starts. Line the dials up in the band and the band is
/// what is read, exactly.
///
/// ## Why the image moves and the frame does not
///
/// A frame the person drags is a frame they have to aim twice — once with the camera and again
/// with a fingertip, on a rectangle their finger is covering. Pinching and dragging the
/// photograph under a fixed band is the same gesture as every photo viewer on the handset, and it
/// leaves the target in the one place on screen that is never under a hand.
///
/// The photograph itself is untouched and is still what gets attached to the reading. This screen
/// only decides which part of it is read.
class ReadingFrameScreen extends StatefulWidget {
  final File photo;

  const ReadingFrameScreen({super.key, required this.photo});

  @override
  State<ReadingFrameScreen> createState() => _ReadingFrameScreenState();
}

class _ReadingFrameScreenState extends State<ReadingFrameScreen> {
  final _transform = TransformationController();

  /// The band is sized from the laid-out photograph, which is only known after layout. Rather than
  /// smuggle that back into state from inside a [LayoutBuilder] — a write during layout, which is
  /// the wrong moment to be rebuilding anything — the stage carries a key and is measured at the
  /// instant the button is pressed. It is the same number either way, read at a legal time.
  final _stageKey = GlobalKey();

  ui.Image? _decoded;
  String? _failure;
  bool _cropping = false;

  @override
  void initState() {
    super.initState();
    _decode();
  }

  /// Decoded here rather than left to [Image.file] because the crop has to be taken against the
  /// same pixels that are on screen. Both go through the platform codec, so orientation and
  /// dimensions agree, and the rectangle the person framed maps onto the source without a guess.
  Future<void> _decode() async {
    try {
      final bytes = await widget.photo.readAsBytes();
      final image = await decodeImageFromList(bytes);
      if (!mounted) {
        image.dispose();
        return;
      }
      setState(() => _decoded = image);
    } catch (_) {
      if (!mounted) return;
      setState(() => _failure = 'That photograph could not be opened.');
    }
  }

  @override
  void dispose() {
    _transform.dispose();
    _decoded?.dispose();
    super.dispose();
  }

  /// The band, in the coordinates of the displayed photograph.
  ///
  /// Shared with the viewfinder rather than defined twice: if the two disagreed, somebody would
  /// line the dials up inside one rectangle on the camera and a different rectangle would be read.
  static Rect _bandIn(Size viewport) => ReadingBand.of(viewport);

  Future<void> _useFraming() async {
    final image = _decoded;
    final stage = _stageKey.currentContext?.findRenderObject() as RenderBox?;
    if (image == null || stage == null || _cropping) return;

    final viewport = stage.size;
    final band = _bandIn(viewport);
    setState(() => _cropping = true);

    try {
      final source = ImageCrop.sourceUnder(
        transform: _transform.value,
        band: band,
        viewport: viewport,
        image: Size(image.width.toDouble(), image.height.toDouble()),
      );

      if (source.width < 1 || source.height < 1) {
        throw StateError('The frame fell outside the photograph');
      }

      final crop = await ImageCrop.toPngFile(image, source);
      if (!mounted) return;
      Navigator.of(context).pop(crop);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _cropping = false;
        _failure = 'That part of the photograph could not be cut out.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HodiColors.black,
      appBar: AppBar(
        backgroundColor: HodiColors.black,
        foregroundColor: HodiColors.white,
        elevation: 0,
        title: const Text('Frame the reading'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Text(
                'Pinch and drag the photo until only the reading sits inside the frame. '
                'Nothing outside it is read.',
                textAlign: TextAlign.center,
                style: HodiTextStyles.bodyMedium.copyWith(
                  color: HodiColors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
            Expanded(child: _stage()),
            if (_failure != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  _failure!,
                  textAlign: TextAlign.center,
                  style: HodiTextStyles.bodySmall
                      .copyWith(color: HodiColors.errorStart),
                ),
              ),
            _actions(),
          ],
        ),
      ),
    );
  }

  Widget _stage() {
    final image = _decoded;
    if (image == null) {
      return Center(
        child: _failure == null
            ? const CircularProgressIndicator(color: HodiColors.white)
            : Icon(Icons.broken_image_outlined,
                size: 48, color: HodiColors.white.withValues(alpha: 0.5)),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final viewport = applyBoxFit(
          BoxFit.contain,
          Size(image.width.toDouble(), image.height.toDouble()),
          constraints.biggest,
        ).destination;
        final band = _bandIn(viewport);

        return Center(
          child: SizedBox(
            key: _stageKey,
            width: viewport.width,
            height: viewport.height,
            child: Stack(
              children: [
                InteractiveViewer(
                  transformationController: _transform,
                  minScale: 1,
                  maxScale: 8,
                  child: SizedBox(
                    width: viewport.width,
                    height: viewport.height,
                    child: RawImage(image: image, fit: BoxFit.fill),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(painter: _BandPainter(band)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _actions() {
    final ready = _decoded != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: _cropping ? null : () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: HodiColors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Skip'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: ready && !_cropping ? _useFraming : null,
              style: FilledButton.styleFrom(
                backgroundColor: HodiColors.primaryStart,
                foregroundColor: HodiColors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: _cropping
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: HodiColors.white,
                      ),
                    )
                  : const Text('Read this'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dims everything the recogniser will not see, and corners the part it will.
class _BandPainter extends CustomPainter {
  final Rect band;

  const _BandPainter(this.band);

  @override
  void paint(Canvas canvas, Size size) {
    final shade = Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(RRect.fromRectAndRadius(band, const Radius.circular(8))),
    );
    canvas.drawPath(shade, Paint()..color = HodiColors.black.withValues(alpha: 0.55));

    final edge = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = HodiColors.white.withValues(alpha: 0.9);
    canvas.drawRRect(
      RRect.fromRectAndRadius(band, const Radius.circular(8)),
      edge,
    );

    // Corner ticks, so the band still reads as a target against a busy photograph.
    final tick = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = HodiColors.primaryStart;
    final arm = (band.width * 0.12).clamp(12.0, 36.0);
    for (final corner in <(Offset, double, double)>[
      (band.topLeft, 1, 1),
      (band.topRight, -1, 1),
      (band.bottomLeft, 1, -1),
      (band.bottomRight, -1, -1),
    ]) {
      final (origin, dx, dy) = corner;
      canvas.drawLine(origin, origin.translate(arm * dx, 0), tick);
      canvas.drawLine(origin, origin.translate(0, arm * dy), tick);
    }
  }

  @override
  bool shouldRepaint(_BandPainter oldDelegate) => oldDelegate.band != band;
}
