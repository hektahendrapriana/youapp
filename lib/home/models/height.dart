import 'package:formz/formz.dart';

enum HeightValidationError { empty }

class Height extends FormzInput<String, HeightValidationError> {
  const Height.pure() : super.pure('');
  const Height.dirty([super.value = '']) : super.dirty();

  @override
  HeightValidationError? validator(String value) {
    if (value.isEmpty) return HeightValidationError.empty;
    return null;
  }
}
