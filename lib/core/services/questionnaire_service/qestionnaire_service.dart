import 'dart:convert';
import 'package:http/http.dart';
import 'package:onsite/core/services/http_service/http_service.dart';

class QuestionnaireService {
  static Future<double> onSaveQuestionnaireAnswers(
      Map<String, List<String>> answers) async {
    double responseAnswer = 0;
      Response response = await HttpService()
        .httpPost("https://tb-model-2.herokuapp.com", answers);
    if (response.statusCode == 200) {
      responseAnswer = double.parse(json.decode(response.body).toString());
      print(json.decode(response.body));

    } else {
      print(response.statusCode);
    }

    return responseAnswer;
  }
}
