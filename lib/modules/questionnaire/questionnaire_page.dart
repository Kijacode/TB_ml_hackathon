// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_app/app_state/patient_state.dart';
import 'package:tb_app/app_state/questionare_state.dart';
import 'package:tb_app/core/services/patient_service/patient_service.dart';
import 'package:tb_app/modules/questionnaire/components/single_questioin_card.dart';
import 'package:tb_app/modules/questionnaire/models/qustionare.dart';
import 'package:tb_app/modules/report/report.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key, required this.pageTitle}) ;
  final String pageTitle;

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<Widget> qb = [];
  String title = "";
  @override
  void initState() {
    super.initState();
    startQuestions();
  }

  void onNextQuestion(String nextPageTitle) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Questionnaire(
                  pageTitle: nextPageTitle,
                )));
  }

  void startQuestions() {
    Questionare.question().forEach((myQuestions) {
      myQuestions.category == widget.pageTitle
          ? myQuestions.questions
              .map((question) => qb.add(SingleCardQuestion(
                    questionIcon: question.icon,
                    question: question.question,
                    questionId: question.id,
                    isClicked:question.isSelected,
                    
                  )))
              .toList()
          : const Text("");

      setState(() {
        title = widget.pageTitle;
      });
    });
  }

  void onSaveQuestionareAnswers() async {
    
     await Provider.of<QuestionareState>(context, listen: false)
        .onSaveAnswerToServer();
  
        
    await PatientService.updatePatientAnalysisValue(
         Provider.of<PatientState>(context, listen: false).currentPatient, Provider.of<QuestionareState>(context, listen: false).analysisResult.toString());
    await Provider.of<PatientState>(context, listen: false).getPatient();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Report()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
          ),
        ),
        //Questionare
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: qb,
                ),
              ),
              GestureDetector(
                onTap: () => widget.pageTitle == "PERSONAL DATA"
                    ? onNextQuestion("FAMILY AND EDUCATION")
                    : widget.pageTitle == "FAMILY AND EDUCATION"
                        ? onNextQuestion("RISK FACTORS")
                        : widget.pageTitle == "RISK FACTORS"
                            ? onNextQuestion("HABITS")
                            : widget.pageTitle == "HABITS"
                                ? onNextQuestion("DISEASES")
                                : widget.pageTitle == "DISEASES"
                                    ? onNextQuestion(
                                        "MOST SCREENING TB SYMPTOMS")
                                    : widget.pageTitle ==
                                            "MOST SCREENING TB SYMPTOMS"
                                        ? onNextQuestion(
                                            "Other Common Symptoms")
                                        : widget.pageTitle ==
                                                "Other Common Symptoms"
                                            ? onSaveQuestionareAnswers()
                                            : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 25,
                  width: 320,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "Next Questions",
                      style: const TextStyle()
                          .copyWith(fontSize: 11.0, color: const Color(0xFF66B9C4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
