import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/expanse.model.dart';

class ExpanseDatabase {
  static late Isar isar;
  List<Expanse> _allExpanses = [];

  /*
  * S E T U P
  * */
  /// Initializes the database
  Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpanseSchema], directory: directory.path);
  }

  /*
  * G E T T E R S
  * */
  List<Expanse> get allExpanses => _allExpanses;

  /*
  * O P E R A T I O N S
  * */
  /// Create a new [Expanse] object
  Future<void> createExpanse(Expanse expanse) async {
    // Ensure ID is null for new items
    // expanse.id = null;

    await isar.writeTxn(() async {
      await isar.expanses.put(expanse);
    });

    await readExpanse();
  }

  /// Read all [Expanse] objects
  Future<void> readExpanse() async {
    // Use simple read operation, no transaction needed
    final fetchedExpanse = await isar.expanses.where().findAll();

    _allExpanses.clear();
    _allExpanses.addAll(fetchedExpanse);
  }

  /// Update an [Expanse] object
  Future<void> updateExpanse(int id, Expanse updatedExpanse) async {
    updatedExpanse.id = id;

    await isar.writeTxn(() async {
      await isar.expanses.put(updatedExpanse);
    });

    await readExpanse();
  }

  /// Delete an [Expanse] object
  Future<void> deleteExpanse(int id) async {
    await isar.writeTxn(() async {
      await isar.expanses.delete(id);
    });

    await readExpanse();
  }

  /// Get count of all expenses (helper method)
  Future<int> getExpenseCount() async {
    return await isar.expanses.count();
  }
}
