import 'package:flutter/material.dart';

class ZoomButtons extends StatelessWidget {
  final VoidCallback toggleFogVisibility;

  const ZoomButtons({super.key, required this.toggleFogVisibility});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: 'zoom_in',
          onPressed: () {
            // Add zoom in functionality here
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.zoom_in),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'zoom_out',
          onPressed: () {
            // Add zoom out functionality here
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.zoom_out),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'toggle_fog',
          onPressed: toggleFogVisibility,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.opacity),
        ),
      ],
    );
  }
}
