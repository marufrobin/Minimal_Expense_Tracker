part of 'theme_change_cubit.dart';

sealed class ThemeChangeState extends Equatable {
  const ThemeChangeState();
}

final class ThemeChangeInitial extends ThemeChangeState {
  @override
  List<Object> get props => [];
}
