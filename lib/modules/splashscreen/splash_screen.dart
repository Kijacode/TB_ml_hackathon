import 'package:flutter/material.dart';
import 'dart:async';

import 'package:onsite/modules/home/home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 12);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Home()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: _width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height / 4,
            ),
            Container(              
              child: Image.asset("assets/logo/logo.PNG"),
            ),
            SizedBox(height: _height * 0.58),
            Text("Onsite")
          ],
        ),
      ),
    ));
  }
}
