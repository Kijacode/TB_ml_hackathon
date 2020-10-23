import 'package:flutter/material.dart';
import 'package:onsite/modules/questionnaire/components/single_questioin_card.dart';
import 'package:onsite/modules/questionnaire/models/qustionare.dart';

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
                  )))
              .toList()
          : Text("");

      setState(() {
        title = widget.pageTitle;
      });
    });
  }

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
        //Questionare
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: qb,
              ),
            ),
            GestureDetector(
              onTap: () => onNextQuestion("FAMILY AND EDUCATION"),
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
                        .copyWith(fontSize: 11.0, color: Color(0xFFFF8C10)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
