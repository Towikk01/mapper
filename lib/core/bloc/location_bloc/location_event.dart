part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationFetchRequested extends LocationEvent {}

class LocationUpdatesRequested extends LocationEvent {}
