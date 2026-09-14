import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'hodi_app_bar.dart';
import '../theme/hodi_colors.dart';

class HodiWebviewPage extends StatefulWidget {
  final String title;
  final String url;

  const HodiWebviewPage({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<HodiWebviewPage> createState() => _HodiWebviewPageState();
}

class _HodiWebviewPageState extends State<HodiWebviewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (mounted) setState(() => _isLoading = true);
          },
          onPageFinished: (url) {
            if (mounted) setState(() => _isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HodiAppBar(title: widget.title),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(color: HodiColors.primaryStart),
            ),
        ],
      ),
    );
  }
}
