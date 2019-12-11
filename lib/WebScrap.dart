import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;
import 'package:car_social/VehicleUpload.dart';
import 'package:flutter/material.dart';
import 'package:car_social/Authen.dart';
import 'CarEvent.dart';
import 'HelpPage.dart';
import 'PostPage.dart';
import 'SalesPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScrapPage extends StatefulWidget{
  WebScrapPage({
    this.auth,
    this.ifLogout,
  });
  final Authentication auth;
  final VoidCallback ifLogout;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebScrapPageState();
  }
}

class _WebScrapPageState extends State<WebScrapPage>{
//  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  WebViewController _controller;
  _back() async{
    if(await _controller.canGoBack()){
      await _controller.goBack();
    }
  }
  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }
  _current() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url == "https://www.motortrend.com"
          ? "https://www.motor1.com/news/"
          : "https://www.motortrend.com",
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MotorTrend'),
        actions: <Widget>[
          IconButton(
            onPressed: _back,
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: _forward,
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _current,
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://www.motortrend.com",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}