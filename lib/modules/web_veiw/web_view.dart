import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViews extends StatelessWidget {

  final String url;

  WebViews(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
