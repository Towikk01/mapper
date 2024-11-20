import 'package:flutter/material.dart';
import 'package:mapper/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.bgGrey,
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.secondary, fontSize: 16.0),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 14.0),
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.gold,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.secondary,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonRed,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.bgCoal,
    appBarTheme: AppBarTheme(
      color: AppColors.gold,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.white, fontSize: 16.0),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 14.0),
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonRed,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(color: AppColors.white),
  );
}
