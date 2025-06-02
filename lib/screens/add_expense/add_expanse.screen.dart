import 'package:flutter/material.dart';

class AddExpanseScreens extends StatelessWidget {
  const AddExpanseScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      tooltip: 'Add expense',
      isExtended: true,
      label: const Text('Add expense'),
      icon: Icon(Icons.add),
    );
  }
}
