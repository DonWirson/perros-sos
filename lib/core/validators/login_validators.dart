import 'package:email_validator/email_validator.dart';

class LoginValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email no puede estar vacio';
    }
    if (!EmailValidator.validate(value)) {
      return 'Email no es valido';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contraseña no puede estar vacia';
    }
    if (value.length < 6) {
      return 'Contraseña no puede tener menos de 6 caracteres';
    }
    return null;
  }
}
