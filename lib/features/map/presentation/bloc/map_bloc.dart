import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_localization/easy_localization.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapEvent>((event, emit) {});
  }

  void enableGpsPermission() async {
    final bool isLocationGranted = await Permission.location.isGranted;
    if (!isLocationGranted) {
      var permissionRequest = await Permission.location.request();
      locationPermissionHandler(permissionRequest);
    }
  }

  String? locationPermissionHandler(PermissionStatus permissionStatus) {
    String? message;
    switch (permissionStatus) {
      case PermissionStatus.denied:
        message = "location_permission_denied";
        break;
      case PermissionStatus.permanentlyDenied:
        message = "location_permission_permanently_denied";
        break;
      case PermissionStatus.limited:
        message = "location_permission_limited";
        break;
      case PermissionStatus.restricted:
        message = "location_permission_restricted";
        break;
      default:
        message = null;
    }

    return message?.tr();
  }
}
