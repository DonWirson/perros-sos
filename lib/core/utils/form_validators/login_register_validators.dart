import 'package:email_validator/email_validator.dart';

class LoginRegisterValidators {
  //TODO: Add context to parameters, then add dictionary keyword
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'contraseña no puede estar vacia';
    }
    if (value.length < 6) {
      return 'contraseña no puede tener menos de 6 caracteres';
    }
    return null;
  }

  //TODO: Add context to parameters, then add dictionary keyword
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email no puede estar vacio';
    }
    if (!EmailValidator.validate(value)) {
      return 'Email no es valido';
    }
    return null;
  }
}
