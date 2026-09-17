import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/hodi_colors.dart';

/// Getting a server-rendered document onto somebody's phone.
///
/// ## Two routes, and which one is available is decided by the endpoint
///
/// **The browser**, for a document whose endpoint is public. `/api/v1/invoices/detail/**` is in
/// `SecurityConfig.PUBLIC_PATHS`, so an invoice PDF opens in Chrome or Safari like any other link
/// — and from there somebody can save, print or share it with the tools they already know. That
/// is the same route as the privacy policy and the terms.
///
/// **Download and hand to the system reader**, for everything else. A receipt is behind
/// `ROLE_PAYMENT_VIEW`, a lease agreement behind `ROLE_LEASE_DOCUMENT_VIEW`, a settlement
/// statement behind `ROLE_VACATE_VIEW`. An external browser carries no Authorization header, so it
/// would be answered with a refusal; the app fetches those through the authenticated client and
/// opens the file.
///
/// An in-app web view is not a third option. It can carry the header, but Android's WebView does
/// not render PDFs — it would show a blank page on the platform most of these handsets run.
abstract class DocumentActions {
  /// Opens a public document in the phone's own browser.
  ///
  /// `externalApplication`, so it leaves for the browser rather than opening a web view of a page
  /// that cannot draw it.
  static Future<bool> openInBrowser(String url) async {
    try {
      return await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      return false;
    }
  }

  /// Runs a download, showing it is working and saying so if it fails.
  ///
  /// The two download buttons in this app were `onPressed: () { repo.download(...); }` — not
  /// awaited and not caught. `PdfDownloader` throws on a failure, and that exception went nowhere:
  /// the button did nothing, said nothing, and looked broken. Everything goes through here now.
  static Future<void> run(
    BuildContext context,
    Future<void> Function() download, {
    required void Function(bool busy) onBusy,
  }) async {
    onBusy(true);
    try {
      await download();
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That document could not be opened.',
        ),
        backgroundColor: HodiColors.errorStart,
      ));
    } finally {
      onBusy(false);
    }
  }
}
