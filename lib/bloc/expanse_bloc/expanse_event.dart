part of 'expanse_bloc.dart';

sealed class ExpanseEvent extends Equatable {
  const ExpanseEvent();
  @override
  List<Object?> get props => [];
}

class LoadExpensesEvent extends ExpanseEvent {}

class CreateExpenseEvent extends ExpanseEvent {
  final Expanse expense;
  const CreateExpenseEvent(this.expense);
  @override
  List<Object?> get props => [expense];
}

class UpdateExpenseEvent extends ExpanseEvent {
  final int id;
  final Expanse expense;
  const UpdateExpenseEvent(this.id, this.expense);
  @override
  List<Object?> get props => [id, expense];
}

class DeleteExpenseEvent extends ExpanseEvent {
  final int id;
  const DeleteExpenseEvent(this.id);
  @override
  List<Object?> get props => [id];
}
