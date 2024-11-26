import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mapper/core/bloc/achievement_bloc/achievement_bloc.dart';

import 'package:mapper/core/bloc/location_bloc/location_bloc.dart';
import 'package:mapper/core/screens/home_screen.dart';
import 'package:mapper/core/screens/map_screen.dart';
import 'package:mapper/core/screens/profile_screen.dart';
import 'package:mapper/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(Location()),
        ),
        BlocProvider(
          create: (context) => AchievementBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Mapper',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/map': (context) => const MapScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
