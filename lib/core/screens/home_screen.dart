import 'package:flutter/material.dart';
import 'package:mapper/core/screens/home_content.dart';
import 'package:mapper/core/screens/map_screen.dart';
import 'package:mapper/core/screens/profile_screen.dart';
import 'package:mapper/core/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _screens = [
    const HomeContent(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        index: _selectedIndex,
        changeIndex: _changeIndex,
      ),
    );
  }
}
