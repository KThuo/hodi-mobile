import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/hodi_border_radius.dart';
import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';

/// Photos to send with something — a repair request, a note on one, a message to the estate.
///
/// Camera or gallery, up to [max], each previewed and removable. Taken at a size the server accepts
/// (it refuses anything over 4 MB): the long edge capped at 1600 pixels and JPEG quality at 75, which
/// keeps a phone photo of a leak sharp and well under the limit.
class PhotoPickerRow extends StatelessWidget {
  const PhotoPickerRow({
    super.key,
    required this.photos,
    required this.onChanged,
    this.max = 5,
  });

  final List<XFile> photos;
  final ValueChanged<List<XFile>> onChanged;
  final int max;

  static final _picker = ImagePicker();

  Future<void> _add(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take a photo'),
              onTap: () => Navigator.pop(ctx, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () => Navigator.pop(ctx, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;
    final room = max - photos.length;
    if (room <= 0) return;
    if (source == ImageSource.camera) {
      final shot = await _picker.pickImage(
          source: ImageSource.camera, maxWidth: 1600, maxHeight: 1600, imageQuality: 75);
      if (shot != null) onChanged([...photos, shot]);
    } else {
      final chosen = await _picker.pickMultiImage(
          maxWidth: 1600, maxHeight: 1600, imageQuality: 75, limit: room > 1 ? room : null);
      if (chosen.isNotEmpty) onChanged([...photos, ...chosen].take(max).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < photos.length; i++)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: HodiBorderRadius.small,
                    child: Image.file(File(photos[i].path), width: 64, height: 64, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: GestureDetector(
                      onTap: () => onChanged([...photos]..removeAt(i)),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.close, size: 14, semanticLabel: 'Remove photo'),
                      ),
                    ),
                  ),
                ],
              ),
            if (photos.length < max)
              InkWell(
                onTap: () => _add(context),
                borderRadius: HodiBorderRadius.small,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: HodiColors.surfaceLight,
                    borderRadius: HodiBorderRadius.small,
                    border: Border.all(color: HodiColors.divider),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_a_photo_outlined, size: 20, color: HodiColors.textMedium),
                      const SizedBox(height: 2),
                      Text('Photo', style: HodiTextStyles.bodySmall.copyWith(fontSize: 10)),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text('Up to $max photos.', style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight)),
      ],
    );
  }
}
