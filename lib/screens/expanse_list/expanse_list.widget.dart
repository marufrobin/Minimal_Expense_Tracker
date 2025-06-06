import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../bloc/expanse_bloc/expanse_bloc.dart';
import '../../models/expanse.model.dart';
import '../add_expense/add_expanse.screen.dart';

class ExpanseListWidget extends StatelessWidget {
  const ExpanseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return BlocBuilder<ExpanseBloc, ExpanseState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state is ExpenseLoaded ? state.expenses.length : 1,
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) {
            if (state is ExpenseLoaded) {
              final expenses = state.expenses;
              return _body(
                parentContext: context,
                color: color,
                id: expenses[index].id,
                title: expenses[index].name,
                amount: expenses[index].amount,
                subtitle: expenses[index].dayName,
                theme: theme,
              );
            } else if (state is ExpenseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExpenseError) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        );
      },
    );
  }

  Slidable _body({
    required BuildContext parentContext,
    required ColorScheme color,
    required int id,
    required String? title,
    required String? subtitle,
    required double? amount,
    required ThemeData theme,
  }) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<ExpanseBloc>().add(DeleteExpenseEvent(id));
            },
            backgroundColor: color.error,
            foregroundColor: color.onSurface,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.delete,
            spacing: 16,
          ),
          SlidableAction(
            onPressed: (context) {
              showExpenseModal(
                parentContext,
                initialAmount: amount,
                initialTitle: title,
                initialDay: subtitle,
                onSave: (title, amount, day) {
                  // You can integrate with your BLoC here:
                  parentContext.read<ExpanseBloc>().add(
                    UpdateExpenseEvent(
                      id,
                      Expanse(name: title, amount: amount, dayName: day),
                    ),
                  );

                  ScaffoldMessenger.of(parentContext).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Updated: $title - \$${amount.toStringAsFixed(2)} on $day',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              );
            },
            backgroundColor: color.onSurface.withValues(alpha: 0.1),
            foregroundColor: color.onSurface,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.settings,
            spacing: 16,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.primary,
          child: Text(
            id.toString(),
            style: TextStyle(color: color.onPrimary, fontSize: 20),
          ),
        ),
        title: Text(title ?? "No data", style: theme.textTheme.titleMedium),
        subtitle: Text(subtitle ?? "No data", style: theme.textTheme.bodySmall),
        trailing: Text(
          "\$${amount?.toStringAsFixed(1) ?? "No data"}",
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
