import '../database/expanse_database.dart';
import '../models/expanse.model.dart';

class ExpenseRepository {
  final ExpanseDatabase expanseDatabase;

  ExpenseRepository(this.expanseDatabase);

  Future<void> createExpense(Expanse expanse) async {
    await expanseDatabase.createExpanse(expanse);
  }

  Future<void> readExpense() async {
    await expanseDatabase.readExpanse();
  }

  Future<void> updateExpense(int id, Expanse updatedExpanse) async {
    await expanseDatabase.updateExpanse(id, updatedExpanse);
  }

  Future<void> deleteExpense(int id) async {
    await expanseDatabase.deleteExpanse(id);
  }
}
