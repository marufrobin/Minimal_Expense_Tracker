import 'package:flutter/material.dart';
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
      home: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minimal Expense Tracker')),
      body: const Center(child: Text('Hello World!')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        tooltip: 'Add expense',
        isExtended: true,
        label: const Text('Add expense'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
