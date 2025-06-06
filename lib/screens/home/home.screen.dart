import 'package:flutter/material.dart';
import 'package:minimal_expense_tracker/screens/add_expense/add_expanse.screen.dart';
import 'package:minimal_expense_tracker/screens/expanse_chart/expanse_chart.screen.dart';
import 'package:minimal_expense_tracker/screens/expanse_list/expanse_list.widget.dart';

import '../../themes/change_theme.widget.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minimal Expense Tracker'),
        actions: [ChangeThemeWidget(), SizedBox(width: 10)],
      ),
      body: Column(
        spacing: 16,
        children: [
          ExpanseChartScreen(),
          Expanded(child: ExpanseListWidget()),
          SizedBox(height: 60),
        ],
      ),
      floatingActionButton: AddExpanseScreens(),
    );
  }
}
