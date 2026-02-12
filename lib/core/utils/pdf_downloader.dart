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
    if (await file.exists()) {
      await OpenFilex.open(filePath);
    }
  }
}

final pdfDownloaderProvider = Provider<PdfDownloader>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PdfDownloader(apiClient);
});
