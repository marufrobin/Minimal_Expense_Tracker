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
  ///
  Future<void> createExpanse(Expanse expanse) async {
    await isar.writeTxn(() => isar.expanses.put(expanse));
  }

  /// Read -- Read a [Expanse] objects
  Future<void> readExpanse() async {
    final fetchedExpanse = await isar.writeTxn(
      () async => await isar.expanses.where().findAll(),
    );
    _allExpanses.clear();
    _allExpanses.addAll(fetchedExpanse);
  }

  /// Update -- Update an [Expanse] object
  ///
  Future<void> updateExpanse(int id, Expanse updatedExpanse) async {
    updatedExpanse.id = id;
    await isar.writeTxn(() async => await isar.expanses.put(updatedExpanse));
  }

  /// Delete -- Delete an [Expanse] object

  /*
   * H E L P E R S
   * */
}
