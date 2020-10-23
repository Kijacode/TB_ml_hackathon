import 'package:flutter/foundation.dart';

class Questionare {
  String category;
  List<TheQuestion> questions;

  Questionare({@required this.category, @required this.questions});

  static List<Questionare> question() {
    return [
      Questionare(category: "PERSONAL DATA", questions: [
        TheQuestion(icon: "assets/images/date.svg", question: "Sex", id: 1),
        TheQuestion(icon: "assets/images/date.svg", question: "Age", id: 2),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Home Address", id: 3),
        TheQuestion(icon: "assets/images/date.svg", question: "Work", id: 4),
      ]),
      Questionare(category: "FAMILY AND EDUCATION", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "Telephony", id: 5),
        TheQuestion(icon: "assets/images/date.svg", question: "Family", id: 6),
      ]),
      Questionare(category: "RISK FACTORS", questions: [
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Previous TB History",
            id: 7),
        TheQuestion(
            icon: "assets/images/date.svg", question: "TB contact", id: 8),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Family TB History",
            id: 9)
      ]),
      Questionare(category: "HABITS", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "Smoking", id: 10),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Substance Abuse", id: 11)
      ]),
      Questionare(category: "DISEASES", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "HIV Victim", id: 12),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Diabetes", id: 13),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Anaemia", id: 14),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Diabetes", id: 15),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Anaemia", id: 16),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Malnutrition", id: 17),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Other Infection", id: 18)
      ]),
      Questionare(category: "MOST SCREENING TB SYMPTOMS", questions: [
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Cough More Than 2 Weeks",
            id: 19),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Fever for more Than 7 Days",
            id: 20),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Hymoptysis", id: 21),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Night Sweats", id: 22),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Weight Loss", id: 23)
      ]),
      Questionare(category: "Other Common Symptoms", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "Malaise", id: 24),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Difficult Breathing",
            id: 25),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Swell of Lymph Node",
            id: 26),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Reduced air Entry",
            id: 27),
        TheQuestion(
            icon: "assets/images/date.svg",
            question: "Increased Respiratory Rate",
            id: 28),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Chest Pain", id: 29)
      ]),
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
