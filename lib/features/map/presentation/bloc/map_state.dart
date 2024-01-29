part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class PermissionCheckInProgress extends MapState {}

class CheckedPermissionSuccessfully extends MapState {}

class CheckedPermissionFailure extends MapState {
  final String errorMessage;
  const CheckedPermissionFailure({required this.errorMessage});
  @override
  List<Object> get props => [];
}
