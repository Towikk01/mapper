import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapper/core/bloc/location_bloc/location_bloc.dart';
import 'package:mapper/core/widgets/fog_overlay.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LocationFetchRequested());
    context.read<LocationBloc>().add(LocationUpdatesRequested());
  }

  Future<void> _moveCameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _controller.future;
    final cameraPosition = CameraPosition(target: pos, zoom: 16);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapper'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationSuccess) {
                _moveCameraToPosition(state.currentLocation);
              }
              if (state is LocationFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is LocationSuccess) {
              return Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                      }
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('_currentLocation'),
                        position: state.currentLocation,
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: state.currentLocation,
                      zoom: 16,
                    ),
                    myLocationEnabled: true,
                  ),
                  FogOverlay(
                    radius: 75,
                    userLocation: state.currentLocation,
                    visitedLocations: state.visitedLocations,
                    mapController: _controller.future,
                  ),
                ],
              );
            }

            if (state is LocationFailureState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
