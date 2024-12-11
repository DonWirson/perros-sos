
class AppConfig {
  //Singleton de la clase
  static final AppConfig _singleton = AppConfig._internal();

  factory AppConfig() => _singleton;

  AppConfig._internal();

}
