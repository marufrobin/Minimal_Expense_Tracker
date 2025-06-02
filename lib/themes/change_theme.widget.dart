import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_expense_tracker/bloc/theme_change_bloc/theme_change_cubit.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeChangeCubit, ThemeMode>(
      builder: (context, state) {
        return Switch.adaptive(
          applyCupertinoTheme: true,
          value: state == ThemeMode.dark ? true : false,
          onChanged: (value) {
            if (value) {
              context.read<ThemeChangeCubit>().changeTheme(ThemeMode.dark);
            } else {
              context.read<ThemeChangeCubit>().changeTheme(ThemeMode.light);
            }
          },
        );
      },
    );
  }
}
