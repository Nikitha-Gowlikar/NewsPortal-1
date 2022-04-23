import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => new _CovidState();
}

class _CovidState extends State<Covid> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Covid Update"),
        backgroundColor: Colors.green[600],
      ),
      body: WebView(
        initialUrl: "https://www.worldometers.info/coronavirus/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
