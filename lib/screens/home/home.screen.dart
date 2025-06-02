import 'package:flutter/material.dart';
import 'package:minimal_expense_tracker/screens/add_expense/add_expanse.screen.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minimal Expense Tracker')),
      body: const Center(child: Text('Hello World!')),
      floatingActionButton: AddExpanseScreens(),
    );
  }
}
