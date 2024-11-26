part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoadingState extends LocationState {}

final class LocationSuccess extends LocationState {
  final List<LatLng> visitedLocations;
  final LatLng currentLocation;

  const LocationSuccess({
    required this.visitedLocations,
    required this.currentLocation,
  });

  @override
  List<Object> get props => [visitedLocations, currentLocation];
}

final class LocationFailureState extends LocationState {
  final String message;

  const LocationFailureState(this.message);

  @override
  List<Object> get props => [message];
}
