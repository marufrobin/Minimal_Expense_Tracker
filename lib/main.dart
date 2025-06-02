import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_expense_tracker/repository/expanse.repository.dart';
import 'package:minimal_expense_tracker/screens/home/home.screen.dart';
import 'package:minimal_expense_tracker/themes/app_theme.dart';
import 'package:bloc/bloc.dart';

import 'bloc/expanse_bloc/expanse_bloc.dart';
import 'bloc/theme_change_bloc/theme_change_cubit.dart';
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
    return RepositoryProvider(
      create: (context) => ExpenseRepository(ExpanseDatabase()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeChangeCubit()),
          BlocProvider(
            create: (context) => ExpanseBloc(context.read<ExpenseRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Minimal Expense Tracker',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: HomeScreens(),
        ),
      ),
    );
  }
}
