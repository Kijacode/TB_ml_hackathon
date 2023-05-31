import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<http.Response> httpGet(String url) async {
    dynamic httpUrl = Uri.parse(url);

    http.Response response = await http.get(httpUrl, headers: headers);
    return response;
  }

  Future<http.Response> httpPost(
      String url, Map<String, List<String>> postData) async {
    dynamic httpUrl = Uri.parse(url);

    http.Response response =
        await http.post(httpUrl, headers: headers, body: json.encode(postData));
    return response;
  }
}
