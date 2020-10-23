import 'package:flutter/foundation.dart';

class Questionare {
  String category;
  List<TheQuestion> questions;

  Questionare({@required this.category, @required this.questions});

  static List<Questionare> question() {
    return [
      Questionare(category: "PERSONAL DATA", questions: [
        TheQuestion(icon: "assets/images/date.svg", question: "Sex", id: 1),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Date of Birth", id: 2),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Address (HOme)", id: 3),
        TheQuestion(icon: "assets/images/date.svg", question: "Work", id: 4),
      ]),
      Questionare(category: "FAMILY AND EDUCATION", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "Telephony", id: 5),
        TheQuestion(icon: "assets/images/date.svg", question: "Family", id: 6),
      ])
    ];
  }
}

class TheQuestion {
  final String icon;
  final String question;
  int id;
  TheQuestion(
      {@required this.icon, @required this.question, @required this.id});
}
