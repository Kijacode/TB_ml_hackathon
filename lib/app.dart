import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onsite/modules/splashscreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
          title: "OnSite",
          theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor: Colors.orange,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SafeArea(child: SplashScreen()),


    );
  }
}