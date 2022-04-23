import 'package:flutter/material.dart';
import 'package:newsportal1/Home.dart';
import 'package:flutter/services.dart';//it is for the Status bar class.


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blueGrey,
  )); //this statusbar changes the color of the status where we can see the time and other items

  runApp(new MaterialApp(
    home: new Home(),
    debugShowCheckedModeBanner: false,
  ));
}
