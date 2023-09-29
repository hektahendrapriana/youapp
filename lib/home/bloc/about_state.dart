part of 'about_bloc.dart';

enum AboutStatus {
  success,
  failure,
  loading,
}

final class AboutState extends Equatable {
  const AboutState({
    this.status = FormzSubmissionStatus.initial,
    this.name = const Name.pure(),
    this.gender = const Gender.pure(),
    this.birthday = const Birthday.pure(),
    this.horoscope = const Horoscope.pure(),
    this.zodiac = const Zodiac.pure(),
    this.height = const Height.pure(),
    this.weight = const Weight.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Name name;
  final Gender gender;
  final Birthday birthday;
  final Horoscope horoscope;
  final Zodiac zodiac;
  final Height height;
  final Weight weight;
  final bool isValid;

  AboutState copyWith({
    FormzSubmissionStatus? status,
    Name? name,
    Gender? gender,
    Birthday? birthday,
    Horoscope? horoscope,
    Zodiac? zodiac,
    Height? height,
    Weight? weight,
    bool? isValid,
  }) {
    return AboutState(
      status: status ?? this.status,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      horoscope: horoscope ?? this.horoscope,
      zodiac: zodiac ?? this.zodiac,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props =>
      [status, name, gender, birthday, horoscope, zodiac, height, weight];
}
