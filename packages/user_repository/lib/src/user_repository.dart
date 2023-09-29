import 'dart:async';
import '../config/api_constants.dart';
import '../base/api_base.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  final String _getProfileEndpoint = ApiConstants.getProfileEndpoint;
  final ApiBase _apiBase = ApiBase();

  Future<User?> getUser({
    required String token,
  }) async {
    final response = await _apiBase.getProfile(_getProfileEndpoint, token);
    print(response);
    if (response['statusCode'] == 200) {
      print('sukses');
      return User(
          const Uuid().v4(),
          response['data']['email'],
          response['data']['username'],
          response['data']['name'],
          response['data']['birthday'],
          response['data']['horoscope'],
          response['data']['height'],
          response['data']['weight'], []);
    }
  }
}
