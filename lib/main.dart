import 'package:flutter/material.dart';
import 'package:minimal_expense_tracker/screens/home/home.screens.dart';
import 'package:minimal_expense_tracker/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreens(),
    );
  }
}
