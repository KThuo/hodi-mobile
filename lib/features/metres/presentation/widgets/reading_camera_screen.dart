import 'dart:io';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/image_crop.dart';
import 'reading_band.dart';

/// What comes back from the viewfinder: the photograph kept, and the strip that gets read.
class ReadingShot {
  const ReadingShot({required this.photo, required this.crop});

  /// The whole frame, which is what is attached to the reading as evidence.
  final File photo;

  /// Just the band. Deleted by the caller once the recogniser has had it.
  final File crop;
}

/// Aiming at the dials, with the frame on the camera rather than after it.
///
/// ## Why this exists
///
/// Capture used to be the system camera, and the framing came afterwards: take a photograph, then
/// pinch and drag it beneath a fixed band. That asks somebody to aim twice, and the second aim
/// cannot rescue a photograph that never contained a usable shot of the dials — by then the meter
/// is behind you.
///
/// `axis-m` does the opposite for barcodes: `ScanScreen` puts a window over the live preview, so
/// the aiming happens once, with the camera, where the thing being aimed at still is. This is that,
/// for a row of dials.
///
/// ## The band is the mechanism, not advice
///
/// The pixels inside it are the only pixels the recogniser is given. That was already true of the
/// adjust screen and the reason for it holds here: the longest run of digits on a meter is very
/// often the serial number etched beside the dials, not the reading. Line the dials up in the band
/// and the band is what is read.
///
/// ## The torch
///
/// Meters live in stairwells, car parks and cupboards. Of everything on this screen it is the
/// control most likely to decide whether a reading is recognised at all.
class ReadingCameraScreen extends StatefulWidget {
  const ReadingCameraScreen({super.key});

  @override
  State<ReadingCameraScreen> createState() => _ReadingCameraScreenState();
}

class _ReadingCameraScreenState extends State<ReadingCameraScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  bool _starting = true;
  bool _shooting = false;
  bool _torch = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _start();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  /// The camera is a shared device, and the OS takes it back.
  ///
  /// Without this the preview returns as a frozen frame after a call or a lock screen, which looks
  /// like the app has hung on the one screen where somebody is holding the phone up to a wall.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
      _controller = null;
      if (mounted) setState(() {});
    } else if (state == AppLifecycleState.resumed) {
      _start();
    }
  }

  Future<void> _start() async {
    setState(() {
      _starting = true;
      _error = null;
    });
    try {
      final cameras = await availableCameras();
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      // High, not max: the band is enlarged 3x before recognition anyway, and max resolution on a
      // mid-range handset is a slow shutter on a screen somebody is holding steady against a wall.
      final controller = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _controller = controller;
        _starting = false;
        _torch = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _starting = false;
        _error = 'The camera could not be opened. You can type the reading instead.';
      });
    }
  }

  Future<void> _toggleTorch() async {
    final controller = _controller;
    if (controller == null) return;
    try {
      final next = !_torch;
      await controller.setFlashMode(next ? FlashMode.torch : FlashMode.off);
      if (mounted) setState(() => _torch = next);
    } catch (_) {
      // Not every handset has one, and a meter cupboard is no place for an error dialogue.
    }
  }

  Future<void> _shoot() async {
    final controller = _controller;
    if (controller == null || _shooting) return;

    setState(() => _shooting = true);
    try {
      final shot = await controller.takePicture();
      final photo = File(shot.path);

      final bytes = await photo.readAsBytes();
      final decoded = await ui.instantiateImageCodec(bytes);
      final frame = await decoded.getNextFrame();
      final image = frame.image;

      // The preview and the capture are the same aspect ratio, so the band sits at the same
      // fraction of both and nothing has been dragged in between.
      final previewSize = _previewSize();
      final band = ReadingBand.onImage(
        preview: previewSize,
        image: Size(image.width.toDouble(), image.height.toDouble()),
      );
      final crop = await ImageCrop.toPngFile(image, band);
      image.dispose();

      if (!mounted) return;
      Navigator.of(context).pop(ReadingShot(photo: photo, crop: crop));
    } catch (_) {
      if (!mounted) return;
      setState(() => _shooting = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('That shot could not be taken. Try again.'),
      ));
    }
  }

  /// The size the preview is laid out at, which is what the band was drawn against.
  Size _previewSize() {
    final box = _previewKey.currentContext?.findRenderObject() as RenderBox?;
    return box?.size ?? MediaQuery.of(context).size;
  }

  final _previewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final ready = controller != null && controller.value.isInitialized;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text('Photograph the dials',
            style: HodiTextStyles.heading3.copyWith(
                fontSize: 16, color: Colors.white)),
        actions: [
          if (ready)
            IconButton(
              onPressed: _toggleTorch,
              icon: Icon(_torch ? Icons.flashlight_on : Icons.flashlight_off),
              tooltip: _torch ? 'Light off' : 'Light on',
            ),
        ],
      ),
      body: _error != null
          ? _Message(text: _error!)
          : !ready
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      key: _previewKey,
                      child: CameraPreview(controller),
                    ),
                    const _Band(),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Fill the frame with the row of numbers',
                                style: HodiTextStyles.bodySmall
                                    .copyWith(color: Colors.white70),
                              ),
                              const SizedBox(height: 16),
                              _Shutter(busy: _shooting, onTap: _shoot),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_starting)
                      const ColoredBox(
                        color: Colors.black54,
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                  ],
                ),
    );
  }
}

/// The window in the dark, so it is obvious where to point the phone.
class _Band extends StatelessWidget {
  const _Band();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final band = ReadingBand.of(constraints.biggest);
          return Stack(
            children: [
              // Everything outside the band, dimmed. The dimming is the instruction: it is obvious
              // at a glance which part of what the camera sees is going to count.
              ColoredBox(
                color: Colors.black.withValues(alpha: 0.45),
                child: const SizedBox.expand(),
              ),
              Positioned.fromRect(
                rect: band,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Shutter extends StatelessWidget {
  const _Shutter({required this.busy, required this.onTap});

  final bool busy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: busy ? 0.4 : 1),
          border: Border.all(color: Colors.white54, width: 4),
        ),
        child: busy
            ? const Padding(
                padding: EdgeInsets.all(22),
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : const Icon(Icons.camera_alt, color: HodiColors.textDark, size: 28),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: HodiTextStyles.bodyMedium.copyWith(color: Colors.white70),
          ),
        ),
      );
}
