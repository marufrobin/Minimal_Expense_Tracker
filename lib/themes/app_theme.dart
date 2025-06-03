import 'package:flutter/material.dart';

class AppTheme {
  /// Light theme
  static get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFAFAFA), // Almost White
    primaryColor: Color(0xFF4A90E2), // Soft Blue
    colorScheme: ColorScheme.light(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF3DDC97), // Mint Green
      error: Color(0xFFFF6B6B), // Soft Red
      background: Color(0xFFFAFAFA),
      surface: Color(0xFFF0F2F5), // Light Gray
    ),
    cardColor: Color(0xFFF0F2F5),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF2D2D2D)), // Dark Charcoal
      bodyMedium: TextStyle(color: Color(0xFF6E6E6E)), // Medium Gray
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFAFAFA),
      foregroundColor: Color(0xFF2D2D2D),
      elevation: 0,
    ),
  );

  /// Dark theme
  static get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Soft charcoal
    canvasColor: const Color(0xFF2C2C2E),
    cardColor: const Color(0xFF2C2C2E),
    dividerColor: Colors.grey.shade700,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C1C1E),
      iconTheme: IconThemeData(color: Colors.white70),
    ),
    textTheme: TextTheme(
      bodyLarge: const TextStyle(color: Colors.white70),
      bodyMedium: const TextStyle(color: Colors.white60),
      titleLarge: const TextStyle(color: Colors.white),
      titleMedium: const TextStyle(color: Colors.white70),
      labelLarge: TextStyle(color: Colors.tealAccent.shade100),
    ),
    iconTheme: const IconThemeData(color: Colors.white70),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF3DDC97), // Mint Green
      surface: const Color(0xFF2C2C2E),
      background: const Color(0xFF1C1C1E),
      onPrimary: Colors.black,
      onSurface: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF3A3A3C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.white54),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.tealAccent.shade200,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
