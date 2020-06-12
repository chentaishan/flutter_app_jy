import 'package:flutter/material.dart';
import 'package:flutterapp/ui/MainScreen.dart';
import 'package:flutterapp/ui/SplashScreen.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> list = List();
  int _currentIndext = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎页'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
//                shape: BoxShape.rectangle,
//                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                    image: AssetImage('images/jiyun.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
