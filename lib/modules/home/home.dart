// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_app/app_state/patient_state.dart';
import 'package:tb_app/components/home_card_selection.dart';
import 'package:tb_app/core/utils/app_util.dart';
import 'package:tb_app/core/utils/line_separator.dart';
import 'package:tb_app/modules/registration/consent.dart';
import 'package:tb_app/modules/report/report.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor( const Color(0xFF66B9C4));
  }

  void onQuestionaire() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Consent()));
  }

  void onMyReport() async {
    await Provider.of<PatientState>(context, listen: false).getPatient();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Report()));
  }

  void onMyAccount() async {
    print("on my Account");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
       elevation: 0,
       backgroundColor: const Color(0xFF66B9C4),
       leading: const Text(""),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Consumer<PatientState>(
        builder: (BuildContext context, patientState, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeCardSelection(
                icon: "assets/images/work.svg",
                title: "Questionnaire",
                onPage: onQuestionaire,
              ),
              const LineSeperator(
                height: 1,
                color: Colors.grey,
              ),
              patientState.isLoading
                  ? const CircularProgressIndicator()
                  : HomeCardSelection(
                      icon: "assets/images/fever.svg",
                      title: "Diagnosis Report",
                      onPage: onMyReport,
                    ),
              const LineSeperator(
                height: 1,
                color: Colors.grey,
              ),
              HomeCardSelection(
                icon: "assets/images/malaise.svg",
                title: "My Account",
                onPage: onMyAccount,
              ),
            ],
          );
        },
      ),
    );
  }
}
