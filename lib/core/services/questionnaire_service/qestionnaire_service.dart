import 'dart:convert';
import 'package:http/http.dart';
import 'package:onsite/core/services/http_service/http_service.dart';

class QuestionnaireService {
  static Future<double> onSaveQuestionnaireAnswers(
      Map<String, List<String>> answers) async {
          double responseAnswer = 0;
    print(answers);
    Response response =
        await HttpService().httpPost("https://tb-model.herokuapp.com", answers);
    if (response.statusCode == 200) {
      // responseAnswer = json.decode(response.body);
    } else {
      print(response.statusCode);
    }

    return 0.0;
  }
}
