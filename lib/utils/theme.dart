import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF964F66),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF2E8EB),
      iconTheme: IconThemeData(color: Color(0xFF964F66)),
      titleTextStyle: TextStyle(
        color: Color(0xFF964F66),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: AppColors.black),
      bodyMedium: const TextStyle(color: AppColors.darkGray, fontSize: 10),
      titleLarge: const TextStyle(
          color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
      labelSmall: const TextStyle(color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF964F66),
        onPrimary: AppColors.white,
        side: const BorderSide(color: AppColors.iconGray),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xFF964F66),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF2E8EB),
      iconTheme: IconThemeData(color: Color(0xFF964F66)),
      titleTextStyle: TextStyle(
        color: Color(0xFF964F66),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.darkGray, fontSize: 10),
      titleLarge: TextStyle(
          color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: AppColors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF964F66),
        onPrimary: AppColors.white,
        side: const BorderSide(color: AppColors.iconGray),
      ),
    ),
  );
}
