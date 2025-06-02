part of 'expanse_bloc.dart';

sealed class ExpanseState extends Equatable {
  const ExpanseState();
}

final class ExpanseInitial extends ExpanseState {
  @override
  List<Object> get props => [];
}
