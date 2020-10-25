import 'package:flutter/material.dart';
import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/models/patient.dart';
import 'package:onsite/modules/home/home.dart';
import 'package:onsite/modules/report/components/report_header.dart';
import 'package:onsite/modules/result/result.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final String label = 'Patients Reports';

// TrackeEntityInstance
  void onAcceptConflict(String patientName,String patientId,String analysisValue) async {
     Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new ResultPage(patientId: patientId,patientName: patientName,patientAnalysisData:analysisValue,)));
  }

  void onDiscardConflict() {
    print("accept offline data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){

            if(Navigator.canPop(context))
            {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>
    Home()) , (route) => false);
            }
          }),
          title: Text(
            "Patient Report",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<PatientState>(builder: (context, reportState, child) {
          List<String> conflictPageNames = [
            "Patient List",
          ];
          List<Patient> patientList = reportState.patientList;
                return SingleChildScrollView(
                      child: Column(
              children: conflictPageNames.map((conflictPage) {
                return ExpansionTile(
                    title: Text(
                      "$conflictPage",
                      style: TextStyle(color: Colors.black),
                    ),
                    children: [
                      ReportHeader(),
                      Column(
                        children: patientList.map((patient) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    patient.id,
                                    style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    patient.name,
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    patient.analysisData,
                                    style: TextStyle().copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => patient.analysisData.isEmpty ? onAcceptConflict(patient.name,patient.id,"0.0"): onAcceptConflict(patient.name,patient.id,patient.analysisData),
                                        child: Container(
                                          height: 25,
                                          width: 320,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Center(
                                            child: Text("View Analysis",
                                                style: TextStyle(fontSize: 11)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ]);
              }).toList(),
            ),
          );
        }));
  }
}
