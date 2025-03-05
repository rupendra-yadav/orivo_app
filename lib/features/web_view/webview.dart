import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*class CustomWebView extends StatelessWidget {
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
}*/

import 'package:url_launcher/url_launcher.dart';

import '../../utils/constant/colors.dart';


class CustomWebView extends StatefulWidget {
  const CustomWebView({
    super.key,
    required this.initialUrl,
    required this.title,
    this.colorAppBar = TColors.primary,
    this.colorIcon = TColors.secondary,
    this.sizeIcon = 30,
    this.sizeTitle = 22,
    this.colorTitle = TColors.white,
  });

  final String title;
  final String initialUrl;
  final Color colorAppBar, colorIcon, colorTitle;
  final double sizeIcon, sizeTitle;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('mailto:')) {
              _launchEmail(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  Future<void> _launchEmail(String url) async {
    final Uri emailUri = Uri.parse(url);
    try {
      if (!await launchUrl(emailUri)) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch email app.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening email app: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorAppBar,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Iconsax.arrow_left,
              color: widget.colorIcon,
              size: widget.sizeIcon,
            )),
        title: Text(widget.title,
            maxLines: 1,
            style: TextStyle(
                color: widget.colorTitle,
                fontWeight: FontWeight.w700,
                fontSize: widget.sizeTitle)),
        titleSpacing: 0,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp( // Use GetMaterialApp for GetX navigation
      home: CustomWebView(
        title: 'My Web Page',
        initialUrl: 'https://flutter.dev/',  // Replace with your URL
      ),
    ),
  );
}