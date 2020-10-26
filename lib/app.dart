import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/app_state/questionare_state.dart';
import 'package:onsite/modules/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => QuestionareState()),
       ChangeNotifierProvider(create: (_) => PatientState()),    
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "OnSight",
          theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor:  Color(0xFF66B9C4),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SafeArea(child: SplashScreen()),
        ));
  }
}
