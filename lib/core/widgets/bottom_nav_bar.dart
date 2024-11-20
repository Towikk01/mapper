import 'package:flutter/material.dart';
import 'package:mapper/core/theme/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final void Function(int) changeIndex;
  const BottomNavBar(
      {super.key, required this.index, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: changeIndex,
      unselectedItemColor: AppColors.secondary,
      selectedItemColor: AppColors.gold,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Legend',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
