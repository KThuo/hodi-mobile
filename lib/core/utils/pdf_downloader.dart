import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../api/api_client.dart';

class PdfDownloader {
  final ApiClient _apiClient;

  PdfDownloader(this._apiClient);

  Future<void> downloadAndOpen(String url, String filename) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$filename';

    await _apiClient.downloadFile(url, filePath);

    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('That document could not be downloaded.');
    }

    /*
     * Check it is a PDF before handing it to the OS.
     *
     * A failed request still writes a file — an error envelope, an HTML error page, a tunnel's
     * interstitial — and `OpenFilex` then hands the system something it cannot open, which surfaces
     * as "no app can perform this action" and sends somebody looking for a PDF reader they already
     * have. Five bytes of header turns that into a sentence about the document.
     */
    final header = await file.openRead(0, 5).first;
    if (String.fromCharCodes(header) != '%PDF-') {
      await file.delete();
      throw Exception('That document could not be downloaded. Try again in a moment.');
    }

    await OpenFilex.open(filePath);
  }
}

final pdfDownloaderProvider = Provider<PdfDownloader>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PdfDownloader(apiClient);
});
