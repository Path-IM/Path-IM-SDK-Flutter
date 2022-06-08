import 'package:sqflite/sqflite.dart';

class ConfigTable {
  final String tableName = "config";

  Database? _database;

  Future<void> onCreate(Database database) async {
    _database = database;
    return await _database?.execute(
      "CREATE TABLE $tableName"
      "(k TEXT PRIMARY KEY,"
      "v INTEGER)",
    );
  }

  Future<int?> initMaxSeq() async {
    return await _database?.insert(
      tableName,
      {"maxSeq": 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> updateMaxSeq(int maxSeq) async {
    return await _database?.update(
      tableName,
      {"maxSeq": maxSeq},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> queryMaxSeq() async {
    List<Map<String, dynamic>>? list = await _database?.query(
      tableName,
      where: "k = ?",
      whereArgs: ["maxSeq"],
    );
    if (list != null && list.isNotEmpty) {
      return list.first["v"];
    }
    return null;
  }

  Future<int?> initGroupMaxSeq(String groupID) async {
    return await _database?.insert(
      tableName,
      {"groupMaxSeq-$groupID": 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> updateGroupMaxSeq(String groupID, int groupMaxSeq) async {
    return await _database?.update(
      tableName,
      {"groupMaxSeq-$groupID": groupMaxSeq},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> queryGroupMaxSeq(String groupID) async {
    List<Map<String, dynamic>>? list = await _database?.query(
      tableName,
      where: "k = ?",
      whereArgs: ["groupMaxSeq-$groupID"],
    );
    if (list != null && list.isNotEmpty) {
      return list.first["v"];
    }
    return null;
  }
}
