import 'package:formz/formz.dart';

enum ZodiacValidationError { empty }

class Zodiac extends FormzInput<String, ZodiacValidationError> {
  const Zodiac.pure() : super.pure('');
  const Zodiac.dirty([super.value = '']) : super.dirty();

  @override
  ZodiacValidationError? validator(String value) {
    if (value.isEmpty) return ZodiacValidationError.empty;
    return null;
  }
}
