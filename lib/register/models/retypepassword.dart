import 'package:formz/formz.dart';

enum RetypePasswordValidationError { empty }

class RetypePassword extends FormzInput<String, RetypePasswordValidationError> {
  const RetypePassword.pure() : super.pure('');
  const RetypePassword.dirty([super.value = '']) : super.dirty();

  @override
  RetypePasswordValidationError? validator(String value) {
    if (value.isEmpty) return RetypePasswordValidationError.empty;
    return null;
  }
}
