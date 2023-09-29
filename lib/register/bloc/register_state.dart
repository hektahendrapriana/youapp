part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.retypepassword = const RetypePassword.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Username username;
  final Password password;
  final RetypePassword retypepassword;
  final bool isValid;

  RegisterState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Username? username,
    Password? password,
    RetypePassword? retypepassword,
    bool? isValid,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      retypepassword: retypepassword ?? this.retypepassword,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, email, username, password, retypepassword];
}
