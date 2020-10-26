import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onsite/app_state/questionare_state.dart';
import 'package:onsite/modules/questionnaire/components/Tick_X_mark.dart';
import 'package:provider/provider.dart';

class SingleCardQuestion extends StatefulWidget {
  SingleCardQuestion(
      {Key key,
      @required this.questionIcon,
      @required this.question,
      @required this.questionId,
       this.isClicked})
      : super(key: key);
  final String questionIcon;
  final String question;
  final int questionId;
  bool isClicked;

  @override
  _SingleCardQuestionState createState() => _SingleCardQuestionState();
}

class _SingleCardQuestionState extends State<SingleCardQuestion> {


    bool isSelected = false;
  void onYes(BuildContext context) async {
    await Provider.of<QuestionareState>(context, listen: false)
        .onSetAnswer(widget.questionId, "1");
    setState(() {
      isSelected = true;
    });
  }

  void onNo(BuildContext context) async {
    await Provider.of<QuestionareState>(context, listen: false)
        .onSetAnswer(widget.questionId, "0");
          setState(() {
      isSelected = true;
    });
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget.question,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TickXMark(
                        onNO: () => onNo(context),
                        onYes: () => onYes(context),
                        isClicked: isSelected,
                      )
                    ],
                  ),
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.transparent,
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(widget.questionIcon),
                    ),
                  ),
                ])),
      ),
    );
  }
}
