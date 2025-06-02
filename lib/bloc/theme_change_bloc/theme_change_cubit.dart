import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeChangeCubit extends Cubit<ThemeMode> {
  ThemeChangeCubit() : super(ThemeMode.system);

  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }
}
