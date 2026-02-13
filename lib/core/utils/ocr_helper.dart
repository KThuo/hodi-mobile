import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

abstract class OcrHelper {
  static Future<String?> recognizeText(File imageFile) async {
    final recognizer = TextRecognizer();
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final recognized = await recognizer.processImage(inputImage);
      final text = recognized.text.trim();
      return text.isEmpty ? null : text;
    } finally {
      recognizer.close();
    }
  }

  static String? extractReading(String ocrText, double previousReading) {
    final matches = RegExp(r'\d+[.,]?\d*').allMatches(ocrText);
    if (matches.isEmpty) return null;

    final candidates = <({String raw, double value})>[];
    for (final match in matches) {
      final raw = match.group(0)!;
      final normalized = raw.replaceAll(',', '.');
      final value = double.tryParse(normalized);
      if (value != null) {
        candidates.add((raw: normalized, value: value));
      }
    }

    if (candidates.isEmpty) return null;

    // Prefer numbers >= previousReading
    final valid = candidates.where((c) => c.value >= previousReading).toList();
    final pool = valid.isNotEmpty ? valid : candidates;

    // Pick longest digit string among valid candidates, fall back to largest
    pool.sort((a, b) {
      final lenDiff = b.raw.length.compareTo(a.raw.length);
      if (lenDiff != 0) return lenDiff;
      return b.value.compareTo(a.value);
    });

    return pool.first.raw;
  }
}
