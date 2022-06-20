import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common/utils/utils.dart';

class ConversationTable {
  final String tableName = "conversation";

  Database? _database;

  void configure(Database database) {
    _database = database;
  }

  Future<void> create() async {
    return await _database?.execute(
      "CREATE TABLE $tableName"
      "(conversationID TEXT PRIMARY KEY,"
      "conversationType INTEGER,"
      "receiveID TEXT,"
      "message TEXT,"
      "messageTime INTEGER,"
      "unreadCount INTEGER,"
      "draftText TEXT,"
      "isPinned BOOLEAN)",
    );
  }

  Future<int?> insert(
    Map<String, Object?> values, {
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> delete({
    String? where,
    List<Object?>? whereArgs,
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int?> update(
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>?> query({
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
    Transaction? txn,
  }) async {
    return await (txn ?? _database)?.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> queryTotalUnread({
    Transaction? txn,
  }) async {
    List<Map<String, Object?>>? list = await (txn ?? _database)?.rawQuery(
      "SELECT sum(unreadCount) FROM $tableName",
    );
    if (list != null) {
      return firstIntValue(list) ?? 0;
    }
    return 0;
  }
}
