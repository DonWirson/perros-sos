import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  //Singleton de la clase
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() => _singleton;

  AppConfig._internal();

}
