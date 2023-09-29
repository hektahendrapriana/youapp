import 'dart:convert';

import 'package:http/http.dart' as http;
import '../config/api_constants.dart';

class ApiBase {
  Future<dynamic> postLogin(String url, dynamic body) async {
    final response =
        await http.post(Uri.parse(ApiConstants.baseUrl + url), body: body);
    var responseJson = _returnResponse(response);
    // print(responseJson);
    return responseJson;
  }

  Future<dynamic> postRegister(String url, dynamic body) async {
    final response =
        await http.post(Uri.parse(ApiConstants.baseUrl + url), body: body);
    var responseJson = _returnResponse(response);
    // print(responseJson);
    return responseJson;
  }
}

_returnResponse(http.Response response) {
  // print(response);
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      responseJson['statusCode'] = response.statusCode;
      // return responseJson["access_token"];
      return responseJson;

    case 201:
      var responseJson = jsonDecode(response.body.toString());
      responseJson['statusCode'] = response.statusCode;
      // return responseJson["access_token"];
      return responseJson;

    case 400:
      var responseError = jsonDecode(response.body.toString());
      responseError['statusCode'] = response.statusCode;
      return responseError;

    case 500:
      var responseError = jsonDecode(response.body.toString());
      responseError['statusCode'] = response.statusCode;
      return responseError;

    default:
      return Exception('default Error ${response.statusCode.toString()}');
  }
}
