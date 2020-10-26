import 'package:flutter/material.dart';
import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/app_state/questionare_state.dart';
import 'package:onsite/core/services/patient_service/patient_service.dart';
import 'package:onsite/models/patient.dart';
import 'package:onsite/modules/questionnaire/components/single_questioin_card.dart';
import 'package:onsite/modules/questionnaire/models/qustionare.dart';
import 'package:onsite/modules/report/report.dart';
import 'package:provider/provider.dart';

class Questionnaire extends StatefulWidget {
  Questionnaire({Key key, @required this.pageTitle}) : super(key: key);
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
        new MaterialPageRoute(
            builder: (context) => new Questionnaire(
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
          : Text("");

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
        context, new MaterialPageRoute(builder: (context) => new Report()));
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
                    style: TextStyle(
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
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 25,
                  width: 320,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "Next Questions",
                      style: TextStyle()
                          .copyWith(fontSize: 11.0, color: Color(0xFF66B9C4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
