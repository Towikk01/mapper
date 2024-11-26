import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FogOverlay extends StatelessWidget {
  final double radius;
  final LatLng userLocation;
  final List<LatLng> visitedLocations;
  final Future<GoogleMapController> mapController;

  const FogOverlay({
    super.key,
    required this.radius,
    required this.userLocation,
    required this.visitedLocations,
    required this.mapController,
  });

  Future<List<Offset>> _calculateOffsets() async {
    final offsets = <Offset>[];
    for (final location in visitedLocations) {
      try {
        final controller = await mapController;
        final screenCoordinate = await controller.getScreenCoordinate(location);
        offsets.add(Offset(
            screenCoordinate.x.toDouble(), screenCoordinate.y.toDouble()));
      } catch (_) {}
    }
    return offsets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offset>>(
      future: _calculateOffsets(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/LandTexture.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: _FogPainter(
                  snapshot.data!,
                  radius,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FogPainter extends CustomPainter {
  final List<Offset> locations; // Готовые Offset
  final double radius;

  _FogPainter(this.locations, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.srcOut;

    for (final offset in locations) {
      canvas.drawCircle(offset, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
