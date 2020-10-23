import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<http.Response> httpGet(String url) async {
    http.Response response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> httpPost(
      String url, Map<String, List<String>> postData) async {
    http.Response response =
        await http.post(url, headers: headers, body: json.encode(postData));

    return response;
  }
}
