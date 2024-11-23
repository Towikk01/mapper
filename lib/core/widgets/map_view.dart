import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatelessWidget {
  final LocationData? currentLocation;

  const MapView({super.key, required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation != null
              ? LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                )
              : LatLng(0, 0),
          zoom: 14,
        ),
        onMapCreated: (controller) {
          if (currentLocation != null) {
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                  zoom: 14,
                ),
              ),
            );
          }
        },
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        compassEnabled: true,
      ),
    );
  }
}
