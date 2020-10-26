import 'package:flutter/material.dart';
import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/components/home_card_selection.dart';
import 'package:onsite/core/utils/app_util.dart';
import 'package:onsite/core/utils/line_separator.dart';
import 'package:onsite/modules/registration/consent.dart';
import 'package:onsite/modules/report/report.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor( Color(0xFF66B9C4));
  }

  void onQuestionaire() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Consent()));
  }

  void onMyReport() async {
    await Provider.of<PatientState>(context, listen: false).getPatient();
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Report()));
  }

  void onMyAccount() async {
    print("on my Account");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Consumer<PatientState>(
        builder: (BuildContext context, patientState, Widget child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeCardSelection(
                icon: "assets/images/fever.svg",
                title: "Questionnaire",
                onPage: onQuestionaire,
              ),
              LineSeperator(
                height: 1,
                color: Colors.grey,
              ),
              patientState.isLoading
                  ? CircularProgressIndicator()
                  : HomeCardSelection(
                      icon: "assets/images/fever.svg",
                      title: "Diagnosis Report",
                      onPage: onMyReport,
                    ),
              LineSeperator(
                height: 1,
                color: Colors.grey,
              ),
              HomeCardSelection(
                icon: "assets/images/fever.svg",
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
