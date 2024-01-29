import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_localization/easy_localization.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    
    on<MapEvent>((event, emit) {});
    on<CheckedLocationPermission>(checkedLocationPermission);
  }

  Future<void> checkedLocationPermission(
      CheckedLocationPermission event, Emitter<MapState> emit) async {
    try {
      emit(
        PermissionCheckInProgress(),
      );
      final permissionStatus = await getCurrentPermissionStatus();
      if (!permissionStatus.isGranted) {
        emit(
          CheckedPermissionFailure(
            errorMessage: locationPermissionHandler(permissionStatus),
          ),
        );
      } else {
        emit(
          CheckedPermissionSuccessfully(),
        );
      }
    } catch (e) {
      log(
        e.toString(),
      );
      emit(
        const CheckedPermissionFailure(
            errorMessage: "location_permission_error"),
      );
    }
  }

  Future<PermissionStatus> getCurrentPermissionStatus() async {
    final bool isLocationGranted = await Permission.locationWhenInUse.isGranted;
    if (!isLocationGranted) {
      var permissionRequest = await Permission.locationWhenInUse.request();
      return permissionRequest;
    }
    return PermissionStatus.granted;
  }

  String locationPermissionHandler(PermissionStatus permissionStatus) {
    String message;
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
      case PermissionStatus.provisional:
        message = "location_permission_previsional";
        break;
      case PermissionStatus.granted:
        message = "location_permission_granted";
        break;
    }

    return message.tr();
  }
}
