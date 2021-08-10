
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';





class viewpage extends StatefulWidget {
  @override
  _viewpageState createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        toolbarHeight:70.0,
        leading:Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("https://cdn4.vectorstock.com/i/1000x1000/80/88/air-flow-icon-water-eco-logo-vector-9318088.jpg")??"",
          ),
        ),
        title: Center(child: const Text('Searchosis')),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://rocare.searchosis.com:8443/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

}



// Padding(
// padding: const EdgeInsets.only(left:8.0),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(15.0),
// child: Image.asset("assets/icon.png",
// fit: BoxFit.scaleDown,
// scale:2,
// alignment: Alignment.centerRight,),
// ),
// )