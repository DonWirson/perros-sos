import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perros_sos/core/utils/loading_progress_indicator.dart';
import 'package:perros_sos/features/map/presentation/bloc/map_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class LandingMap extends StatefulWidget {
  const LandingMap({super.key});

  @override
  State<LandingMap> createState() => _LandingMapState();
}

class _LandingMapState extends State<LandingMap> {
  String? permissionMessage;
  @override
  void initState() {
    BlocProvider.of<MapBloc>(context).add(
      CheckedLocationPermission(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listener: (context, state) {
        log("Evento de mapa $state");
        if (state is CheckedPermissionFailure) {
          setState(() {
            permissionMessage = state.errorMessage;
          });
        }
        if (state is CheckedPermissionSuccessfully) {
          setState(() {
            permissionMessage = null;
          });
        }
      },
      builder: (context, state) {
        if (state is PermissionCheckInProgress) {
          const Center(
            child: LoadingProgressIndicator(),
          );
        }
        //Agregar mapa acá
        return permissionMessage == null
            ? Center()
            : Center(
                child: Text(permissionMessage!),
              );
      },
    );
  }
}
