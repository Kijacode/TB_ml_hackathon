import 'package:flutter/material.dart';
import 'package:onsite/components/home_card_selection.dart';
import 'package:onsite/modules/questionnaire/questionnaire_page.dart';
import 'package:onsite/modules/report/report.dart';
import 'package:onsite/utils/app_util.dart';
import 'package:onsite/utils/line_separator.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppUtil.setStatusBarColor(Color(0xFFFF8C10));
  }
   

  void onQuestionaire() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new Questionnaire(pageTitle: "PERSONAL DATA",)));
  }

  void onMyReport() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new Report()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF05600),
      body: Column(
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
          HomeCardSelection(
            icon: "assets/images/fever.svg",
            title: "My Report",
            onPage: onMyReport,
          ),
        ],
      ),
    );
  }
}
