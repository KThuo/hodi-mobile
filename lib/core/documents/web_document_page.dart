import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';
import '../widgets/hodi_app_bar.dart';

/// A document the web renders, shown inside the app and saved without leaving it.
///
/// ## Why the web's document and not the server's
///
/// Both exist. `hodi-b` renders an invoice PDF from a Thymeleaf template, and `hodi-f` renders one
/// in the browser from `InvoiceDocument.vue`. They are not the same document, and the one people
/// are given today is the web's — so a mobile download that produced the other would mean a tenant
/// and the person at the desk comparing two different-looking papers for the same invoice.
///
/// ## Why a web view and not a link out
///
/// This screen used to be [DocumentActions.openInBrowser], which handed the reader to Chrome. That
/// worked and it was the wrong shape twice over: it left the app, and it left them to find the
/// page's own Download button and then the browser's Save as PDF behind it — a journey to reach a
/// document they had already asked for.
///
/// So the page loads here, in the app's own chrome, and [_save] does in Dart what the page's
/// button does in JavaScript.
///
/// ## How saving works
///
/// [PRINT_CSS] and [_extractScript] together are a transcription of `hodi-f/src/utils/
/// printDocument.ts`. That function clones the rendered card, staples the page's stylesheets to
/// it, overrides the handful of rules that differ on paper, and prints. This does the same: the
/// script runs in the loaded page and hands back that same HTML string, and the printing
/// package's HTML converter takes the browser's place at the end of it.
///
/// **It is a transcription, so it can drift.** If the web changes what the print sheet hides, this
/// has to change with it. The alternative was to reach the document by a different route
/// altogether, and a different route is a different document — which is the thing being avoided.
class WebDocumentPage extends StatefulWidget {
  const WebDocumentPage({
    super.key,
    required this.title,
    required this.url,
    required this.elementId,
    required this.fileName,
  });

  /// What the app bar calls it — "Invoice", "Receipt".
  final String title;

  /// The public page that renders it. Signed out, `InvoiceDetailPage.vue` renders the bare
  /// document with no admin chrome around it, which is exactly what is wanted here: a web view
  /// carries none of the app's session, so that is the branch this always gets.
  final String url;

  /// The id of the card within that page — `invoice-document`, `receipt-document`. The same id
  /// `printDocument` is called with on the web.
  final String elementId;

  /// What the saved file is called, without the extension.
  final String fileName;

  @override
  State<WebDocumentPage> createState() => _WebDocumentPageState();
}

class _WebDocumentPageState extends State<WebDocumentPage> {
  late final WebViewController _controller;
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(HodiColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) setState(() => _loading = true);
          },
          onPageFinished: (_) {
            if (mounted) setState(() => _loading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  /// The page's own Download button, run from here.
  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final raw = await _controller.runJavaScriptReturningResult(
        _extractScript(widget.elementId, widget.title),
      );

      // Android hands a JavaScript string back JSON-encoded; iOS hands it back plain. Decoding
      // what is already decoded throws, so this tries and keeps what it had.
      var html = raw.toString();
      if (html.startsWith('"')) {
        try {
          html = jsonDecode(html) as String;
        } catch (_) {
          // Not JSON after all. Leave it.
        }
      }

      // The script answers with nothing when the card is not on the page — the document failed to
      // load, or the reference names no invoice. There is nothing to save and nothing useful to
      // say that the page itself is not already saying.
      if (html.length < 40) {
        throw Exception('That document has not finished loading yet.');
      }

      // Not every platform can turn HTML into a PDF, and the package says so rather than
      // failing halfway. Asked before the work, so the answer is a sentence rather than a
      // half-finished save.
      if (!(await Printing.info()).canConvertHtml) {
        throw Exception('This handset cannot save the document. '
            'Use the share button in your browser instead.');
      }

      final origin = Uri.parse(widget.url).replace(path: '', query: '').toString();
      // Deprecated in favour of building the PDF with the `pdf` package — which means drawing
      // the document again in Dart. That is a second rendering of the same invoice, and a second
      // rendering is a second document; keeping the web's is the entire point of this screen.
      // There is no replacement that converts HTML, so this stays until one exists.
      // ignore: deprecated_member_use
      final pdf = await Printing.convertHtml(html: html, baseUrl: origin);

      await Printing.sharePdf(bytes: pdf, filename: '${widget.fileName}.pdf');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That document could not be saved.',
        ),
        backgroundColor: HodiColors.errorStart,
      ));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: HodiAppBar(
        title: widget.title,
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            IconButton(
              // Disabled until the page has painted: the script reads the rendered card, and
              // there is nothing to read before then.
              onPressed: _loading ? null : _save,
              icon: const Icon(Icons.download_rounded),
              tooltip: 'Save as PDF',
            ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_loading)
            ColoredBox(
              color: HodiColors.background,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: HodiColors.primaryStart),
                    const SizedBox(height: 14),
                    Text('Fetching the document…',
                        style: HodiTextStyles.bodySmall
                            .copyWith(color: HodiColors.textLight)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// What changes between the screen and the page.
///
/// Every rule is `!important` for the reason the web's copy gives: these documents use Vue's
/// scoped styles, which compile to a class plus an attribute and outrank a plain class however
/// late it appears. Kept byte-for-byte with `printDocument.ts` so a difference between the two is
/// visible as a difference rather than hidden in a rewording.
const String _printCss =
    'body{background:var(--paper)!important;margin:0!important;padding:0!important}'
    '.doc,.rcpt{border:0!important;box-shadow:none!important;max-width:none!important}'
    '.doc__bar,.rcpt__bar{display:none!important}'
    '.doc__payWrap,.rcpt__payWrap{display:none!important}'
    '#invoice-document button,#receipt-document button,#estate-invoice-doc button,'
    '#estate-payment-doc button,#stay-statement button{display:none!important}'
    'tr,li{break-inside:avoid!important}'
    'table{break-inside:auto!important}'
    '*{-webkit-print-color-adjust:exact;print-color-adjust:exact}'
    '@page{margin:12mm}';

/// The clone, in the page's own runtime.
///
/// Returns the empty string rather than throwing when the card is absent, so a document that has
/// not loaded is a message rather than a JavaScript error surfaced as a platform exception.
String _extractScript(String elementId, String title) {
  final id = jsonEncode(elementId);
  final safeTitle = jsonEncode(
    title.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;'),
  );
  final css = jsonEncode(_printCss);

  return '''
(function () {
  var card = document.getElementById($id);
  if (!card) return '';
  var styles = Array.prototype.slice
    .call(document.querySelectorAll('style, link[rel=stylesheet]'))
    .map(function (n) { return n.outerHTML; })
    .join('\\n');
  return '<!doctype html><html><head><meta charset="utf-8"><title>' + $safeTitle + '</title>'
    + styles + '<style>' + $css + '</style></head><body>' + card.outerHTML + '</body></html>';
})();
''';
}
