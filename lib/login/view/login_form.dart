import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/login/login.dart';
import 'package:formz/formz.dart';
import 'package:flutter/gestures.dart';
import 'package:youapp/register/register.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordInput createState() => _PasswordInput();
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 160.0, bottom: 30.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter-Bold',
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                alignment: Alignment.centerLeft,
                child: _EmailInput()),
            const Padding(padding: EdgeInsets.all(8)),
            Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                alignment: Alignment.centerLeft,
                child: const PasswordInput()),
            const Padding(padding: EdgeInsets.all(8)),
            Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(98, 205, 203, 1),
                      Color.fromRGBO(69, 153, 219, 1)
                    ]),
                    borderRadius: BorderRadius.circular(8.0)),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                alignment: Alignment.centerLeft,
                child: _LoginButton()),
            Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 50.0, bottom: 50.0),
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: 'No account? ',
                    style: const TextStyle(
                        fontSize: 13, fontFamily: 'Inter', color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register here',
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            fontFamily: 'Inter-Medium',
                            color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage())),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Inter', fontSize: 13),
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 19.0, bottom: 19.0),
            filled: true,
            fillColor: const Color.fromRGBO(255, 255, 255, 0.06),
            hintText: 'Enter Email/Username',
            hintStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                fontFamily: 'Inter',
                fontSize: 13),
            errorText: state.email.displayError != null
                ? 'Invalid Email/Username'
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends State<PasswordInput> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Inter', fontSize: 13),
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: _passwordVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 19.0, bottom: 19.0),
            filled: true,
            fillColor: const Color.fromRGBO(255, 255, 255, 0.06),
            hintText: 'Enter Password',
            hintStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                fontFamily: 'Inter',
                fontSize: 13),
            errorText:
                state.password.displayError != null ? 'Invalid password' : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            suffixIcon: IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(
                _passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ButtonStyle(
                  // padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontFamily: 'Inter-Bold',
                      fontSize: 16,
                      color: Colors.white)),
                  shadowColor: MaterialStateProperty.all(
                      const Color.fromRGBO(98, 205, 203, 1)),
                  elevation: MaterialStateProperty.all(15),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(48)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text('Login'),
              );
      },
    );
  }
}
