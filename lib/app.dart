// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tb_app/app_state/patient_state.dart';
import 'package:tb_app/app_state/questionare_state.dart';
import 'package:tb_app/modules/splashscreen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              primaryColor:const Color(0xFF66B9C4),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SafeArea(child: SplashScreen()),
        ));
  }
}
