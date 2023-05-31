import 'package:flutter/material.dart';
import 'package:tb_app/modules/questionnaire/questionnaire_page.dart';
import '../../app_state/patient_state.dart';
import '../../core/utils/app_util.dart';
import '../../models/patient.dart';
import 'package:provider/provider.dart';

class Consent extends StatefulWidget {
 const Consent() ;

  @override
  _ConsentState createState() => _ConsentState();
}

class _ConsentState extends State<Consent> {
  String title = "CONSENT";
  String signatureAgreement = "Patient Signature";

  final _signinFormkey = GlobalKey<FormState>();
  final TextEditingController _nameTexteditingcontroller = TextEditingController();
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
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
        body: Consumer<PatientState>(
          builder: (BuildContext context, patientState, Widget? child) {
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

                  color: const Color(0x0fffffff),
                  child: Form(
                    key: _signinFormkey,
                    // autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 10, bottom: 10),
                          child: TextFormField(
                            controller: _nameTexteditingcontroller,
                            textAlign: TextAlign.start,
                            decoration:
                                const InputDecoration(hintText: 'Enter Patient Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Your username  is incorrect";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
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
                          child: DropdownButton<String>(
                            hint: Text(signatureAgreement),
                            items: <String>[
                              'Agree',
                              'NotAgree',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              if (value == "NotAgree") {
                                AppUtil.showToastMessage();
                              }
                              if (value == "Agree") {
                                setState(() {
                                  signatureAgreement = value!;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            if (_signinFormkey.currentState!.validate()) {
                              print("signature");
                              print(signatureAgreement);
                              patientState.savePatient(Patient().patientFactory(
                                  _nameTexteditingcontroller.text,
                                  "",
                                  signatureAgreement));
                              if (!patientState.isLoading &&
                                  signatureAgreement == "Agree") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Questionnaire(
                                              pageTitle: "PERSONAL DATA",
                                            )));
                              }
                            }
                          },
                          color: const Color(0xFF66B9C4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: patientState.isLoading
                              ? const CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : const Text(
                                  "Save and Continue in Analysis",
                                  style: TextStyle(color: Colors.white),
                                ),
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
