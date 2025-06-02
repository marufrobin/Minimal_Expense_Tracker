import 'package:flutter/material.dart';
import 'package:minimal_expense_tracker/screens/home/home.screen.dart';
import 'package:minimal_expense_tracker/themes/app_theme.dart';

import 'database/expanse_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ExpanseDatabase().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Expense Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreens(),
    );
  }
}
