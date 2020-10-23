


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtil{



    static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }
}