import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../theme/hodi_border_radius.dart';
import '../theme/hodi_colors.dart';

/// A photo fetched through the app's own signed-in client — never a public link — shown as a
/// thumbnail that opens full size, pinch to zoom.
class PrivatePhoto extends StatefulWidget {
  const PrivatePhoto({super.key, required this.load, this.size = 64});

  /// Fetches the image bytes, with the bearer token.
  final Future<Uint8List> Function() load;
  final double size;

  @override
  State<PrivatePhoto> createState() => _PrivatePhotoState();
}

class _PrivatePhotoState extends State<PrivatePhoto> {
  late final Future<Uint8List> _bytes = widget.load();

  void _open(Uint8List bytes) {
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.all(12),
        backgroundColor: Colors.black,
        child: GestureDetector(
          onTap: () => Navigator.pop(ctx),
          child: InteractiveViewer(child: Image.memory(bytes, fit: BoxFit.contain)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _bytes,
      builder: (context, snap) {
        final bytes = snap.data;
        return GestureDetector(
          onTap: bytes == null || bytes.isEmpty ? null : () => _open(bytes),
          child: ClipRRect(
            borderRadius: HodiBorderRadius.small,
            child: Container(
              width: widget.size,
              height: widget.size,
              color: HodiColors.surfaceLight,
              child: bytes == null
                  ? (snap.hasError
                      ? const Icon(Icons.broken_image_outlined, color: HodiColors.textLight)
                      : const Center(
                          child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))))
                  : Image.memory(bytes, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
