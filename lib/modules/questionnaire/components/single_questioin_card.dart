import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onsite/modules/questionnaire/components/Tick_X_mark.dart';

class SingleCardQuestion extends StatelessWidget {
  SingleCardQuestion(
      {Key key,
      @required this.questionIcon,
      @required this.question,
      @required this.questionId})
      : super(key: key);
  final String questionIcon;
  final String question;
  final int questionId;

  Map<int, String> answers = Map();

  void onYes() {
    answers.addAll({questionId: "1"});
    print(answers);
  }

  void onNo() {
    answers.addAll({questionId: "0"});
    print(answers);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        type: MaterialType.card,
        elevation: 9,
        child: Container(
            height: MediaQuery.of(context).size.height / 5,
            // // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

            color: Color(0xFFFFFFF),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          question,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TickXMark(
                        onNO: onNo,
                        onYes: onYes,
                      )
                    ],
                  ),
                  SvgPicture.asset(questionIcon),
                ])),
      ),
    );
  }
}
