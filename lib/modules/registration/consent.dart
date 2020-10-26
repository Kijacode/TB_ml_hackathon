import 'package:flutter/material.dart';
import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/core/utils/app_util.dart';
import 'package:onsite/models/patient.dart';
import 'package:onsite/modules/questionnaire/questionnaire_page.dart';
import 'package:provider/provider.dart';

class Consent extends StatefulWidget {
  Consent({Key key}) : super(key: key);

  @override
  _ConsentState createState() => _ConsentState();
}

class _ConsentState extends State<Consent> {
  String title = "CONSENT";
  String signatureAgreemnt = "Patient Signature";

  final _signinFormkey = GlobalKey<FormState>();
  TextEditingController _nameTexteditingcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void onSaveAndContinue(BuildContext context, PatientState patientState) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        body: Consumer<PatientState>(
          builder: (BuildContext context, patientState, Widget child) {
            return SingleChildScrollView(
                          child: Container(
                  //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Material(
                type: MaterialType.card,
                elevation: 0,
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                  color: Color(0xFFFFFFF),
                  child: Form(
                    key: _signinFormkey,
                    autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: _nameTexteditingcontroller,
                            textAlign: TextAlign.start,
                            decoration:
                                InputDecoration(hintText: 'Enter Patient Name'),
                            validator: (value) {
                              if (value.isEmpty)
                                return "Your username  is incorrect";
                              else
                                return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 10, bottom: 10),
                          child: Expanded(
                              child: Text(
                            "I have received information regarding the objective ,advantages and risks of the TB Programme,I give amy consent to share my personal and clinical data",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 10, bottom: 0),
                          child: new DropdownButton<String>(
                            hint: Text(signatureAgreemnt),
                            items: <String>[
                              'Agree',
                              'NotAgree',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              if (value == "NotAgree") {
                                AppUtil.showToastMessage();
                              }
                              if (value == "Agree") {
                                setState(() {
                                  signatureAgreemnt = value;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (_signinFormkey.currentState.validate()) {
                              print("singature");
                              print(signatureAgreemnt);
                              patientState.savePatient(Patient().patientFactory(
                                  _nameTexteditingcontroller.text,
                                  "",
                                  signatureAgreemnt));
                              if (!patientState.isLoading &&
                                  signatureAgreemnt == "Agree") {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new Questionnaire(
                                              pageTitle: "PERSONAL DATA",
                                            )));
                              }
                            }
                          },
                          child: patientState.isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : Text(
                                  "Save and Continue in Analysis",
                                  style: TextStyle(color: Colors.white),
                                ),
                          color: Color(0xFF66B9C4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            );
          },
        ));
  }
}
