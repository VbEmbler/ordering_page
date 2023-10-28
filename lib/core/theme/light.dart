import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF172027),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFF172027),
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFF172027),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF172027),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xFF172027),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF172027),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF172027),
    brightness: Brightness.light,
    primary: const Color(0xFF172027),
    secondary: Colors.white,
    //tertiary: Colors.grey,
    error: Colors.red,
  ),
);
