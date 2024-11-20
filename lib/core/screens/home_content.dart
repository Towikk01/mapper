import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _isRevealed = true; // Text and icon should be visible initially

  void _revealArea() {
    setState(() {
      _isRevealed = !_isRevealed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Ensure Stack is the direct parent of Positioned
      children: [
        // Background layer
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              opacity: 0.3,
              image: AssetImage(
                  'assets/map-2.webp'), // Make sure this path is correct
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              "Map Background Loaded",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),

        // Overlay text like "Found Treasuries" or "Hidden Temples"
        Positioned(
          top: 100,
          left: 50,
          child: AnimatedOpacity(
            opacity: _isRevealed ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: const Text(
              'Found Treasuries!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                shadows: [Shadow(blurRadius: 10, color: Colors.black)],
              ),
            ),
          ),
        ),

        // Interactive area
        GestureDetector(
          onTap: _revealArea, // This will toggle the reveal effect
          child: AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _isRevealed ? 100.0 : 0.0, // Change position when revealed
            top: _isRevealed ? 200.0 : 100.0, // Change position when revealed
            child: _isRevealed
                ? FloatingActionButton(
                    onPressed: _revealArea,
                    backgroundColor: Colors.yellow,
                    child: const Icon(Icons.visibility),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
