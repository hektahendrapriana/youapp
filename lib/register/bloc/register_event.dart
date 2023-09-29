part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterRetypePasswordChanged extends RegisterEvent {
  const RegisterRetypePasswordChanged(this.retypepassword);

  final String retypepassword;

  @override
  List<Object> get props => [retypepassword];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
