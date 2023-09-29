import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/register/register.dart';
import 'package:youapp/login/login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leadingWidth: 20,
        // leading: InkWell(
        //   onTap: () => Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const LoginPage())),
        //   child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        // ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage())),
        ),
        title: const Text("Back"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Inter-Bold'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 0.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocProvider(
          create: (context) {
            return RegisterBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
