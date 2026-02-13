import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImageHelper {
  static final _picker = ImagePicker();

  static Future<File?> captureFromCamera() async {
    final xFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 70,
    );
    if (xFile == null) return null;
    return File(xFile.path);
  }

  static Future<String> toBase64(File file) async {
    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  }
}
