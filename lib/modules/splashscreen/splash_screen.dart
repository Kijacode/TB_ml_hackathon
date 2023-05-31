import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tb_app/modules/registration/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 12);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 4,
                ),
                Container(
                  child: Image.asset("assets/logo/logo.PNG"),
                ),
                SizedBox(height: height * 0.58),
                const Text("Onsite")
              ],
            ),
          ),
        ));
  }
}
