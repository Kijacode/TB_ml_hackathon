import 'package:flutter/foundation.dart';

class Questionare {
  String category;
  List<TheQuestion> questions;

  Questionare({@required this.category, @required this.questions});

  static List<Questionare> question() {
    return [
      Questionare(category: "PERSONAL DATA", questions: [
        TheQuestion(icon: "assets/images/cough.svg", question: "Sex", id: 1),
        TheQuestion(
            icon: "assets/images/tb_history.svg", question: "Age", id: 2),
        TheQuestion(
            icon: "assets/images/date.svg", question: "Home Address", id: 3),
        TheQuestion(icon: "assets/images/work.svg", question: "Work", id: 4),
      ]),
      Questionare(category: "FAMILY AND EDUCATION", questions: [
        TheQuestion(
            icon: "assets/images/date.svg", question: "Telephony", id: 5),
        TheQuestion(
            icon: "assets/images/family_tb.svg", question: "Family", id: 6),
      ]),
      Questionare(category: "RISK FACTORS", questions: [
        TheQuestion(
            icon: "assets/images/tb_history.svg",
            question: "Previous TB History",
            id: 7),
        TheQuestion(
            icon: "assets/images/hiv_virus.svg", question: "TB contact", id: 8),
        TheQuestion(
            icon: "assets/images/tb_history.svg",
            question: "Family TB History",
            id: 9)
      ]),
      Questionare(category: "HABITS", questions: [
        TheQuestion(
            icon: "assets/images/smoking.svg", question: "Smoking", id: 10),
        TheQuestion(
            icon: "assets/images/substance_abuse.svg",
            question: "Substance Abuse",
            id: 11)
      ]),
      Questionare(category: "DISEASES", questions: [
        TheQuestion(
            icon: "assets/images/contacts.svg", question: "HIV Victim", id: 12),
        TheQuestion(
            icon: "assets/images/diabetes.svg", question: "Diabetes", id: 13),
        TheQuestion(
            icon: "assets/images/other_infection.svg",
            question: "Anaemia",
            id: 14),
        TheQuestion(
            icon: "assets/images/malnutrition.svg",
            question: "Malnutrition",
            id: 15),
        TheQuestion(
            icon: "assets/images/hiv_virus.svg",
            question: "Other Infection",
            id: 16)
      ]),
      Questionare(category: "MOST SCREENING TB SYMPTOMS", questions: [
        TheQuestion(
            icon: "assets/images/cough.svg",
            question: "Cough More Than 2 Weeks",
            id: 17),
        TheQuestion(
            icon: "assets/images/fever.svg",
            question: "Fever for more Than 7 Days",
            id: 18),
        TheQuestion(
            icon: "assets/images/hiv_virus.svg",
            question: "Hymoptysis",
            id: 19),
        TheQuestion(
            icon: "assets/images/sweat.svg", question: "Night Sweats", id: 20),
        TheQuestion(
            icon: "assets/images/weight_loss.svg",
            question: "Weight Loss",
            id: 21)
      ]),
      Questionare(category: "Other Common Symptoms", questions: [
        TheQuestion(
            icon: "assets/images/malaise.svg", question: "Malaise", id: 22),
        TheQuestion(
            icon: "assets/images/difficult_breathing.svg",
            question: "Difficult Breathing",
            id: 23),
        TheQuestion(
            icon: "assets/images/substance_abuse.svg",
            question: "Swell of Lymph Node",
            id: 24),
        TheQuestion(
            icon: "assets/images/cough.svg",
            question: "Reduced air Entry",
            id: 25),
        TheQuestion(
            icon: "assets/images/increased_respiration.svg",
            question: "Increased Respiratory Rate",
            id: 26),
        TheQuestion(
            icon: "assets/images/chest_pain.svg",
            question: "Chest Pain",
            id: 27)
      ]),
    ];
  }
}

class TheQuestion {
  final String icon;
  final String question;
  final bool isSelected;
  int id;
  TheQuestion(
      {@required this.icon, @required this.question, @required this.id,this.isSelected = false});
}
