import 'package:formz/formz.dart';

enum GenderValidationError { empty }

class Gender extends FormzInput<String, GenderValidationError> {
  const Gender.pure() : super.pure('');
  const Gender.dirty([super.value = '']) : super.dirty();

  @override
  GenderValidationError? validator(String value) {
    if (value.isEmpty) return GenderValidationError.empty;
    return null;
  }
}
