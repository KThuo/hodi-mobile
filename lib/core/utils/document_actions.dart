import 'package:flutter/material.dart';

import '../theme/hodi_colors.dart';

/// Getting a server-rendered document onto somebody's phone.
///
/// Downloads it through the authenticated client and hands the file to the system reader. A
/// receipt is behind `ROLE_PAYMENT_VIEW`, a lease agreement behind `ROLE_LEASE_DOCUMENT_VIEW`, a
/// settlement statement behind `ROLE_VACATE_VIEW` — nothing outside the app carries an
/// Authorization header, so nothing outside the app can fetch them.
///
/// ## Not the only route, and not the preferred one
///
/// Where `hodi-f` draws the document itself, the app shows *that* and saves *that* — see
/// `WebDocumentPage`, which is how the invoice works. The two renderings are not the same
/// document, and the one people are already given is the web's.
///
/// This remains for the documents that cannot go that way. A receipt is one: `hodi-f` has no
/// public receipt page, so a session-less web view would be bounced to the sign-in, and the
/// server's PDF is the only thing reachable. Until that page exists, an invoice and a receipt for
/// the same tenancy look like they came from different companies.
abstract class DocumentActions {
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
