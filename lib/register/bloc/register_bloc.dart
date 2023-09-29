import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youapp/register/register.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterRetypePasswordChanged>(_onRetypePasswordChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
            [state.password, state.retypepassword, email, state.username]),
      ),
    );
  }

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate(
            [state.password, state.retypepassword, state.email, username]),
      ),
    );
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
            [password, state.retypepassword, state.email, state.username]),
      ),
    );
  }

  void _onRetypePasswordChanged(
    RegisterRetypePasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final retypepassword = RetypePassword.dirty(event.retypepassword);
    emit(
      state.copyWith(
        retypepassword: retypepassword,
        isValid: Formz.validate(
            [state.password, retypepassword, state.email, state.username]),
      ),
    );
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.Register(
          email: state.email.value,
          username: state.username.value,
          password: state.password.value,
          retypepassword: state.retypepassword.value,
        );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
