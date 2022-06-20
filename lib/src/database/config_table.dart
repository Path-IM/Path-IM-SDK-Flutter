import 'package:sqflite_common/sqlite_api.dart';

class ConfigTable {
  final String tableName = "config";

  Database? _database;

  void configure(Database database) {
    _database = database;
  }

  Future<void> create() async {
    return await _database?.execute(
      "CREATE TABLE $tableName"
      "(k TEXT PRIMARY KEY,"
      "v INTEGER)",
    );
  }

  Future<int?> initMaxSeq() async {
    return await _database?.insert(
      tableName,
      {"k": "maxSeq", "v": 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> updateMaxSeq(
    int maxSeq, {
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.update(
      tableName,
      {"v": maxSeq},
      where: "k = ?",
      whereArgs: ["maxSeq"],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> queryMaxSeq({
    Transaction? txn,
  }) async {
    List<Map<String, dynamic>>? list = await (txn ?? _database)?.query(
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
      {"k": "groupMaxSeq_$groupID", "v": 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> updateGroupMaxSeq(
    String groupID,
    int groupMaxSeq, {
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.update(
      tableName,
      {"v": groupMaxSeq},
      where: "k = ?",
      whereArgs: ["groupMaxSeq_$groupID"],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> queryGroupMaxSeq(
    String groupID, {
    Transaction? txn,
  }) async {
    List<Map<String, dynamic>>? list = await (txn ?? _database)?.query(
      tableName,
      where: "k = ?",
      whereArgs: ["groupMaxSeq_$groupID"],
    );
    if (list != null && list.isNotEmpty) {
      return list.first["v"];
    }
    return null;
  }
}
