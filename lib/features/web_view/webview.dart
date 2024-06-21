import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/constant/colors.dart';

class CustomWebView extends StatelessWidget {
  const CustomWebView({
    super.key,
    required this.initialUrl,
    required this.title,
    this.colorAppBar = TColors.primary,
    this.colorIcon = TColors.secondary,
    this.sizeIcon = 30,
    this.sizeTitle = 22,
    this.colorTitle = TColors.white ,
  });

  final String title;
  final String initialUrl;
  final Color colorAppBar, colorIcon, colorTitle;
  final double sizeIcon, sizeTitle;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
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
        backgroundColor: colorAppBar,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Iconsax.arrow_left,
              color: colorIcon,
              size: sizeIcon,
            )),
        title: Text(title,
            maxLines: 1,
            style: TextStyle(
                color: colorTitle,
                fontWeight: FontWeight.w700,
                fontSize: sizeTitle)),
        titleSpacing: 0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
