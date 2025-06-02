import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpanseListWidget extends StatelessWidget {
  const ExpanseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
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
          child: ListTile(title: Text('Item $index'), trailing: Text("data")),
        );
      },
    );
  }
}
