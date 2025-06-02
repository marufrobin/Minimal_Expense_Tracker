import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../bloc/expanse_bloc/expanse_bloc.dart';

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
          itemBuilder: (context, index) {
            if (state is ExpenseLoaded) {
              return _body(
                color: color,
                id: state.expenses[index].id,
                title: state.expenses[index].name,
                trailing: state.expenses[index].amount?.toString(),
              );
            } else if (state is ExpenseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExpenseError) {
              return const Center(child: Text('Error'));
            } else if (state is ExpenseOperationSuccess) {
              return _body(
                color: color,
                id: state.expenses[index].id,
                title: state.message,
                trailing: state.expenses[index].amount?.toString(),
              );
            } else {
              return const Center(child: Text('No data'));
            }
          },
        );
      },
    );
  }

  Slidable _body({
    required ColorScheme color,
    required int id,
    required String? title,
    required String? trailing,
  }) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<ExpanseBloc>().add(DeleteExpenseEvent(id));
            },
            backgroundColor: color.onSurface.withValues(alpha: 0.1),
            foregroundColor: color.onSurface,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.delete,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: color.error,
            foregroundColor: color.onSurface,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.settings,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title ?? "No data"),
        trailing: Text(trailing ?? "No data"),
      ),
    );
  }
}
