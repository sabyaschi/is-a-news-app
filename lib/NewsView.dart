import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  String url;
  NewsView(this.url);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  void initState() {
    if(widget.url.toString().contains("http://")){
      finalUrl = widget.url.toString().replaceAll("http://", "https://");

    }
    else{
      finalUrl = widget.url;
    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MORE NEWS",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Container(
        child: 
        WebView(
          initialUrl: finalUrl ,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated:(WebViewController webViewController){
            setState(() {
              controller.complete(webViewController);
            });
          } ,
        ),
      )
    );
  }
}