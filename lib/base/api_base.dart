import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youapp/config/api_constants.dart';

class ApiBase {
  Future<dynamic> postLogin(String url, dynamic body) async {
    final response =
        await http.post(Uri.parse(ApiConstants.baseUrl + url), body: body);
    var responseJson = _returnResponse(response);
    print(responseJson);
    return responseJson;
  }
}

_returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson["token"];

    case 400:
      var responseError = jsonDecode(response.body.toString());
      return responseError["error"];

    default:
      return Exception('default Error ${response.statusCode.toString()}');
  }
}
