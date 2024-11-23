import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapper/core/widgets/fog_overlay.dart';
import 'package:mapper/core/widgets/map_view.dart';
import 'package:mapper/core/widgets/zoom_buttons.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const googlePlex = LatLng(37.4223, -122.0849);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LocationData? currentLocation;
  bool _fogVisible = true;

  @override
  void initState() {
    super.initState();
    fetchCurrentLocation(); // Trigger fetching of location
  }

  void fetchCurrentLocation() {
    getCurrentLocation().then((locationData) {
      if (locationData != null) {
        setState(() {
          currentLocation = locationData;
        });
      }
    }).catchError((error) {
      print("Error fetching location: $error");
    });
  }

  Future<LocationData?> getCurrentLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          print("Location services are disabled.");
          return null;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          print("Location permission denied.");
          return null;
        }
      }

      return await location.getLocation();
    } catch (e) {
      print("Error while fetching location: $e");
      return null;
    }
  }

  void _toggleFogVisibility() {
    setState(() {
      _fogVisible = !_fogVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          MapView(currentLocation: currentLocation),
          FogOverlay(fogVisible: _fogVisible),
          Positioned(
            bottom: 20,
            left: 20,
            child: ZoomButtons(
              toggleFogVisibility: _toggleFogVisibility,
            ),
          ),
        ],
      ),
    );
  }
}
