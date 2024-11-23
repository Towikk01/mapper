import 'package:flutter/material.dart';

class FogOverlay extends StatelessWidget {
  final bool fogVisible;

  const FogOverlay({super.key, required this.fogVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: fogVisible ? 1 : 0.0, // Fade in/out effect
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/LandTexture.jpg'), // Custom fog image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
