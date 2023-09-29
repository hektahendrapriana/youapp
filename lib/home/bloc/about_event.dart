part of 'about_bloc.dart';

sealed class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

final class AboutNameChanged extends AboutEvent {
  const AboutNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

final class AboutGenderChanged extends AboutEvent {
  const AboutGenderChanged(this.gender);

  final String gender;

  @override
  List<Object> get props => [gender];
}

final class AboutBirthdayChanged extends AboutEvent {
  const AboutBirthdayChanged(this.birthday);

  final String birthday;

  @override
  List<Object> get props => [birthday];
}

final class AboutHoroscopeChanged extends AboutEvent {
  const AboutHoroscopeChanged(this.horoscope);

  final String horoscope;

  @override
  List<Object> get props => [horoscope];
}

final class AboutZodiacChanged extends AboutEvent {
  const AboutZodiacChanged(this.zodiac);

  final String zodiac;

  @override
  List<Object> get props => [zodiac];
}

final class AboutHeightChanged extends AboutEvent {
  const AboutHeightChanged(this.height);

  final String height;

  @override
  List<Object> get props => [height];
}

final class AboutWeightChanged extends AboutEvent {
  const AboutWeightChanged(this.weight);

  final String weight;

  @override
  List<Object> get props => [weight];
}

final class AboutSubmitted extends AboutEvent {
  const AboutSubmitted();
}
