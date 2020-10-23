import 'package:flutter/material.dart';

class QuestionareState with ChangeNotifier {

//initialization
  Map<int, String> _answers;

//selector
  Map<int, String> get answers => _answers ?? Map();

//reducer
  // ignore: missing_return
  Future onSetAnswer(int questionId, String answer) {
    _answers = {questionId: answer};
    notifyListeners();
  }
}
