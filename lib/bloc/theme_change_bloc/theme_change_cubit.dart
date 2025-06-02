import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_change_state.dart';

class ThemeChangeCubit extends Cubit<ThemeChangeState> {
  ThemeChangeCubit() : super(ThemeChangeInitial());
}
