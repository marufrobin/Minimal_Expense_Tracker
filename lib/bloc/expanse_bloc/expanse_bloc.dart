import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/expanse.model.dart';
import '../../repository/expanse.repository.dart';

part 'expanse_event.dart';
part 'expanse_state.dart';

class ExpanseBloc extends Bloc<ExpanseEvent, ExpanseState> {
  final ExpenseRepository repository;

  ExpanseBloc(this.repository) : super(ExpanseInitial()) {
    on<LoadExpensesEvent>(_lodExpenses);
    on<CreateExpenseEvent>(_createExpense);
    on<UpdateExpenseEvent>(_updateExpense);
    on<DeleteExpenseEvent>(_deleteExpense);
  }
  _lodExpenses(LoadExpensesEvent event, Emitter<ExpanseState> emit) async {
    emit(ExpenseLoading());
    try {
      final allData = await repository.getAllExpenses();
      emit(ExpenseLoaded(allData));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  _createExpense(CreateExpenseEvent event, Emitter<ExpanseState> emit) async {
    emit(ExpenseLoading());
    try {
      await repository.createExpense(event.expense);
      final expanse = await repository.getAllExpenses();
      emit(ExpenseOperationSuccess('Expense created', expanse));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  _updateExpense(UpdateExpenseEvent event, Emitter<ExpanseState> emit) async {
    emit(ExpenseLoading());
    try {
      await repository.updateExpense(event.id, event.expense);
      final expanse = await repository.getAllExpenses();

      emit(ExpenseOperationSuccess('Expense updated', expanse));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  _deleteExpense(DeleteExpenseEvent event, Emitter<ExpanseState> emit) async {
    emit(ExpenseLoading());
    try {
      await repository.deleteExpense(event.id);
      final expanse = await repository.getAllExpenses();

      emit(ExpenseOperationSuccess('Expense deleted', expanse));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
}
