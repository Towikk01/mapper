import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final Location _locationController;

  LocationBloc(this._locationController) : super(LocationInitial()) {
    on<LocationFetchRequested>(_fetchCurrentLocation);
    on<LocationUpdatesRequested>(_startLocationUpdates);
  }

  Future<void> _fetchCurrentLocation(
      LocationFetchRequested event, Emitter<LocationState> emit) async {
    emit(LocationLoadingState());
    try {
      if (!await _locationController.serviceEnabled()) {
        if (!await _locationController.requestService()) {
          throw Exception('Location service is disabled.');
        }
      }

      if (await _locationController.hasPermission() ==
          PermissionStatus.denied) {
        if (await _locationController.requestPermission() !=
            PermissionStatus.granted) {
          throw Exception('Location permission not granted.');
        }
      }

      final locationData = await _locationController.getLocation();
      if (locationData.latitude == null || locationData.longitude == null) {
        throw Exception('Failed to get location.');
      }

      emit(LocationSuccess(
        visitedLocations: [],
        currentLocation:
            LatLng(locationData.latitude!, locationData.longitude!),
      ));
    } catch (e) {
      emit(LocationFailureState(e.toString()));
    }
  }

  Future<void> _startLocationUpdates(
      LocationUpdatesRequested event, Emitter<LocationState> emit) async {
    try {
      await emit.forEach<LocationData>(
        _locationController.onLocationChanged,
        onData: (locationData) {
          if (locationData.latitude != null && locationData.longitude != null) {
            final newLocation = LatLng(
              locationData.latitude!,
              locationData.longitude!,
            );

            final visitedLocations = state is LocationSuccess
                ? List<LatLng>.from((state as LocationSuccess).visitedLocations)
                : [];

            if (!visitedLocations.contains(newLocation)) {
              visitedLocations.add(newLocation);
            }

            return LocationSuccess(
              visitedLocations: visitedLocations.cast(),
              currentLocation: newLocation,
            );
          }
          return state;
        },
        onError: (error, stackTrace) {
          return LocationFailureState(error.toString());
        },
      );
    } catch (e) {
      emit(LocationFailureState(e.toString()));
    }
  }
}
