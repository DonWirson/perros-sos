part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class CheckedLocationPermission extends MapEvent {}

class GotUserInitialPosition extends MapEvent {}
