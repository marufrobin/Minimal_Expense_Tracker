import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'expanse.model.g.dart';

@Collection()
class Expanse {
  Id id = Isar.autoIncrement;
  String? name;
  int? amount;
  DateTime? createdAt;
  String? dayName;

  Expanse({this.name, this.amount, this.dayName});
}
