import 'package:flutter/material.dart';
import 'package:mapper/core/screens/map_screen.dart';
import 'package:mapper/core/theme/app_colors.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _isRevealed = false;

  void _toggleRevealed() {
    setState(() {
      _isRevealed = !_isRevealed;
    });

    // Navigate to MapScreen and reset _isRevealed when returning
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return FadeTransition(
              opacity: curvedAnimation,
              child: child,
            );
          },
        ),
      ).then((_) {
        // Reset _isRevealed when returning to the home screen
        setState(() {
          _isRevealed = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home page', style: TextStyle(color: AppColors.gold)),
      ),
      body: Stack(
        children: [
          // Background map image
          AnimatedOpacity(
            opacity: _isRevealed ? 1.0 : 0.2,
            duration: const Duration(seconds: 1),
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/LandTexture.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Content
          AnimatedOpacity(
            opacity: _isRevealed ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 700),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Discover new locations!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.yellow,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Discover something new around you - from the most popular places to the most hidden corners of the world!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _toggleRevealed,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      backgroundColor: AppColors.buttonRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Enter the Map',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
