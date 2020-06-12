import 'package:flutter/material.dart';
import 'package:flutterapp/ui/WelcomeScreen.dart';
import 'package:flutterapp/ui/home_page.dart';
import 'package:flutterapp/ui/knowlege_page.dart';
import 'package:flutterapp/ui/square_page.dart';
import 'package:flutterapp/ui/wx_page.dart';

main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter",
      home: WelcomeScreen(),
      theme: ThemeData(accentColor: Colors.red),
    );
  }
}

