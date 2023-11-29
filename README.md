#   APP Perdidog! 🐕

##   Pasos para levantar app

#   1.- Levantar base de datos local con docker, consultar Perdidog-Api para esto
>   Recordar que tiene que estar corriendo el backend para que funcione la app correctamente.

#   2.- Rellenar archivo .env con los parametros requeridos 
>   No se puede utilizar localhost como url en Flutter


#   3.-Tener instalada la versión 3.13.8 de Flutter y la versión 3.1.4 o superior de dart.
>   Luego de eso bajar paquetes de pubspec.yaml con un IDE o usando la linea de comandos
```
flutter pub get
```

>   Si usas fvm utiliza esto:

```
fvm flutter pub get
```
##############################################

#   4.-Correr app de flutter por medio de VS code o android studio

>   También puedes usar la linea de comandos:

```
flutter run        
```

>En caso de usar fvm 
```
fvm flutter run
```

>Si no tienes claro que dispositivo usar, escribe:

```
flutter run --help
```
##############################################