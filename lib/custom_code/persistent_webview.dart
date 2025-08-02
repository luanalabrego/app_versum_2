import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PersistentWebView extends StatefulWidget {
  final String initialUrl;
  const PersistentWebView({Key? key, required this.initialUrl})
      : super(key: key);

  @override
  _PersistentWebViewState createState() => _PersistentWebViewState();
}

class _PersistentWebViewState extends State<PersistentWebView>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebViewWidget(controller: _controller);
  }
}
