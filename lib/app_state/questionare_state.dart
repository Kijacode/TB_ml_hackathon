import 'package:flutter/foundation.dart';
import 'package:onsite/core/services/questionnaire_service/qestionnaire_service.dart';

class QuestionareState with ChangeNotifier {
//initialization
  double _analysisResult;
  List<Map<int, String>> _answers = [];

//selector
  List<Map<int, String>> get answers => _answers ?? [];
  double get analysisResult => _analysisResult ?? 0;

//reducer

  // ignore: missing_return
  Future onSetAnswer(int questionId, String answer) {
    try {
      print("id is: $questionId" + "  and answer is : $answer");
      _answers.add({questionId: answer});
      print(_answers);
    } catch (e) {
      print(e);
    }
  }

  Future onSaveAnswerToServer() async {
    List<String> responseAnswers = [];
    {
      for (int questionId = 1; questionId < 24; questionId++) {
        // responseAnswers.add("0");
        for (Map<int, String> singleAnswer in answers) {
          if (singleAnswer.containsValue(null)) {
            singleAnswer.putIfAbsent(1, () => "0");
          } else {
            print("invalues");
            print(singleAnswer[questionId]);
          }
        }
      }

      answers.forEach((Map<int, String> singleAnswer) {
        print(singleAnswer.values);
      });
      // for (int questionId = 1; questionId < 24; questionId++) {
      //   responseAnswers.add("0");

      // }
    }
    // for (int questionId = 1; questionId < 24; questionId++) {
    //   responseAnswers.add("0");
    //   //print(responseAnswers);
    // }

    _analysisResult = await QuestionnaireService.onSaveQuestionnaireAnswers(
        {"question": responseAnswers});
    return null;
  }
}
