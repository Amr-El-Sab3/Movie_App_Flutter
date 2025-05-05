// app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0xFF222831), // Main color
      hintColor: const Color(0xFF76ABAE),  // Accent color
      scaffoldBackgroundColor: const Color(0xFF222831), // Background same as primary color
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFEEEEEE)), // Text color
        bodyMedium: TextStyle(color: Color(0xFFEEEEEE)),
        displayLarge: TextStyle(color: Color(0xFF222831)),
        displayMedium: TextStyle(color: Color(0xFFEEEEEE)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF76ABAE), // Primary color for app bar
        titleTextStyle: TextStyle(color: Color(0xFFEEEEEE), fontSize: 20), // Text in app bar
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF76ABAE), // Button background color
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF76ABAE), // Accent color for FAB
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFEEEEEE), // Text color for icons
      ),
    );
  }
}
