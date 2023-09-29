import 'dart:async';
import '../config/api_constants.dart';
import '../base/api_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final String _loginEndpoint = ApiConstants.loginEndpoint;
  final String _registerEndpoint = ApiConstants.registerEndpoint;
  final ApiBase _apiBase = ApiBase();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    final response = await _apiBase.postLogin(
        _loginEndpoint, {"email": email, "username": "", "password": password});
    print(response);
    if (response['statusCode'] == 201) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("token", response['access_token']);
      await pref.setBool('isLogin', true);
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated),
      );
    }
    return response;
  }

  Future<void> Register({
    required String email,
    required String username,
    required String password,
    required String retypepassword,
  }) async {
    print('a');
    final response = await _apiBase.postRegister(_registerEndpoint,
        {"email": email, "username": username, "password": password});
    print(response);
    if (response['statusCode'] == 201) {}
    return response;
  }

  void logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('token');
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
