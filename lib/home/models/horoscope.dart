import 'package:formz/formz.dart';

enum HoroscopeValidationError { empty }

class Horoscope extends FormzInput<String, HoroscopeValidationError> {
  const Horoscope.pure() : super.pure('');
  const Horoscope.dirty([super.value = '']) : super.dirty();

  @override
  HoroscopeValidationError? validator(String value) {
    if (value.isEmpty) return HoroscopeValidationError.empty;
    return null;
  }
}
