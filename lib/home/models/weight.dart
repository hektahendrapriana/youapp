import 'package:formz/formz.dart';

enum WeightValidationError { empty }

class Weight extends FormzInput<String, WeightValidationError> {
  const Weight.pure() : super.pure('');
  const Weight.dirty([super.value = '']) : super.dirty();

  @override
  WeightValidationError? validator(String value) {
    if (value.isEmpty) return WeightValidationError.empty;
    return null;
  }
}
