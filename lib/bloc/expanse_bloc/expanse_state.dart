part of 'expanse_bloc.dart';

sealed class ExpanseState extends Equatable {
  const ExpanseState();
  @override
  List<Object?> get props => [];
}

final class ExpanseInitial extends ExpanseState {}

class ExpenseLoading extends ExpanseState {}

class ExpenseLoaded extends ExpanseState {
  final List<Expanse> expenses;
  const ExpenseLoaded(this.expenses);
  @override
  List<Object?> get props => [expenses];
}

class ExpenseError extends ExpanseState {
  final String message;
  const ExpenseError(this.message);
  @override
  List<Object?> get props => [message];
}

class ExpenseOperationSuccess extends ExpanseState {
  final String message;
  final List<Expanse> expenses;
  const ExpenseOperationSuccess(this.message, this.expenses);
  @override
  List<Object?> get props => [message, expenses];
}
