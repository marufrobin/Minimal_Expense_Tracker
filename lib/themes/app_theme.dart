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
    scaffoldBackgroundColor: Color(0xFF121212), // Deep Charcoal
    primaryColor: Color(0xFF4A90E2), // Soft Blue
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF3DDC97), // Mint Green
      error: Color(0xFFFF6B6B), // Soft Red
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E), // Dark Gray
    ),
    cardColor: Color(0xFF1E1E1E),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)), // Light Gray
      bodyMedium: TextStyle(color: Color(0xFFA0A0A0)), // Medium Gray
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF121212),
      foregroundColor: Color(0xFFE0E0E0),
      elevation: 0,
    ),
  );
}
