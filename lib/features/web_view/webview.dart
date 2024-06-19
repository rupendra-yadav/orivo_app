import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/constant/colors.dart';


class CustomWebView extends StatelessWidget {
  const CustomWebView(
      {super.key, required this.initialUrl, required this.title});

  final String title;
  final String initialUrl;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {

          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.darkGrey,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: TColors.primary)),
        title: Text(title,
            maxLines: 1,
            style: const TextStyle(
                color: TColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
        titleSpacing: 0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
