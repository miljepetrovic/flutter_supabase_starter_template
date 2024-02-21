import 'package:flutter_application/core/extensions/string_extensions.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  invalid,
}

class EmailValueObject extends FormzInput<String, EmailValidationError> {
  const EmailValueObject.pure() : super.pure('');

  const EmailValueObject.dirty([
    super.value = '',
  ]) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value.isNullOrEmpty) return EmailValidationError.invalid;

    return _emailRegExp.hasMatch(value!) ? null : EmailValidationError.invalid;
  }
}
