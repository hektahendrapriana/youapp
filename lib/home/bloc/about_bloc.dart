import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youapp/home/home.dart';
import 'package:formz/formz.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AboutState()) {
    on<AboutNameChanged>(_onNameChanged);
    on<AboutGenderChanged>(_onGenderChanged);
    on<AboutBirthdayChanged>(_onBirthdayChanged);
    on<AboutHoroscopeChanged>(_onHoroscopeChanged);
    on<AboutZodiacChanged>(_onZodiacChanged);
    on<AboutHeightChanged>(_onHeightChanged);
    on<AboutWeightChanged>(_onWeightChanged);
    on<AboutSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onNameChanged(
    AboutNameChanged event,
    Emitter<AboutState> emit,
  ) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name]),
      ),
    );
  }

  void _onGenderChanged(
    AboutGenderChanged event,
    Emitter<AboutState> emit,
  ) {
    final gender = Gender.dirty(event.gender);
    emit(
      state.copyWith(
        gender: gender,
        isValid: Formz.validate([gender]),
      ),
    );
  }

  void _onBirthdayChanged(
    AboutBirthdayChanged event,
    Emitter<AboutState> emit,
  ) {
    final birthday = Birthday.dirty(event.birthday);
    emit(
      state.copyWith(
        birthday: birthday,
        isValid: Formz.validate([birthday]),
      ),
    );
  }

  void _onHoroscopeChanged(
    AboutHoroscopeChanged event,
    Emitter<AboutState> emit,
  ) {
    final horoscope = Horoscope.dirty(event.horoscope);
    emit(
      state.copyWith(
        horoscope: horoscope,
        isValid: Formz.validate([horoscope]),
      ),
    );
  }

  void _onZodiacChanged(
    AboutZodiacChanged event,
    Emitter<AboutState> emit,
  ) {
    final zodiac = Zodiac.dirty(event.zodiac);
    emit(
      state.copyWith(
        zodiac: zodiac,
        isValid: Formz.validate([zodiac]),
      ),
    );
  }

  void _onHeightChanged(
    AboutHeightChanged event,
    Emitter<AboutState> emit,
  ) {
    final height = Height.dirty(event.height);
    emit(
      state.copyWith(
        height: height,
        isValid: Formz.validate([height]),
      ),
    );
  }

  void _onWeightChanged(
    AboutWeightChanged event,
    Emitter<AboutState> emit,
  ) {
    final weight = Weight.dirty(event.weight);
    emit(
      state.copyWith(
        weight: weight,
        isValid: Formz.validate([weight]),
      ),
    );
  }

  Future<void> _onSubmitted(
    AboutSubmitted event,
    Emitter<AboutState> emit,
  ) async {
    print('submit about');
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        // await _authenticationRepository.About(
        //   email: state.email.value,
        //   password: state.password.value,
        // );
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
