import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyAppState();
}

class _MyAppState extends State<MyHome> {
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
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
      ..loadRequest(Uri.parse('https://mindwellness-dash.netlify.app/'));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zenzone' , style: TextStyle(fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),),
          centerTitle: true, // Center the title
          backgroundColor: Colors.white, // Set background color
          elevation: 0, // Remove shadow
        ),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}