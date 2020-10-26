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
    List<int> keyRemove = [
      3,
      4,
      5,
      6,
    ];
    for (Map<int, String> singleAnswer in answers) {
      for (int keyToremove in keyRemove) {
        if (singleAnswer.keys.contains(keyToremove)) {
          singleAnswer.clear();
        }
      }
    }

    for (int question = 1; question < 28; question++) {
      var uniqueAnswers = answers.map((o) {
        if (o.containsKey(question)) {
          if (o.containsValue(null)) {
            o.putIfAbsent(question, () => "0");
            responseAnswers.add(o[question]);
          } else {
            responseAnswers.add(o[question]);
          }
        }
      }).toSet();
    }

    // print(responseAnswers.length);
    int count = 0;
    if (responseAnswers.length > 23) {
      for (int listToRemove = 0;
          listToRemove < (responseAnswers.length - 23)+1;
          listToRemove++) {
        count++;
        responseAnswers.removeAt(count);
        print(responseAnswers.length);
      }
      print("in remove");
      print(responseAnswers.length);
      _analysisResult = await QuestionnaireService.onSaveQuestionnaireAnswers(
          {"question": responseAnswers});
      answers.clear();
    }
    if (responseAnswers.length == 23) {
      
      _analysisResult = await QuestionnaireService.onSaveQuestionnaireAnswers(
          {"question": responseAnswers});
      answers.clear();
    }
    print(responseAnswers);

    return null;
  }
}
