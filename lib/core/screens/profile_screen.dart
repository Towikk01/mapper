import 'package:flutter/material.dart';
import 'package:mapper/core/theme/app_colors.dart';
import 'package:mapper/core/widgets/achievement_section.dart';
import 'package:mapper/core/widgets/profile_header.dart';
import 'package:mapper/core/widgets/recent_location.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: AppColors.gold)),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20),
            AchievementSection(),
            SizedBox(height: 20),
            RecentLocationsSection(),
          ],
        ),
      ),
    );
  }
}
