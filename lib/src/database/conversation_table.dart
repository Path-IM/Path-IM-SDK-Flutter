import 'package:sqflite/sqflite.dart';

class ConversationTable {
  final String tableName = "conversation";

  Database? _database;

  Future<void> onCreate(Database database) async {
    _database = database;
    return await _database?.execute(
      "CREATE TABLE $tableName"
      "(conversationID TEXT PRIMARY KEY,"
      "message TEXT,"
      "messageTime INTEGER,"
      "unreadCount INTEGER,"
      "draftText TEXT,"
      "isPinned BOOLEAN)",
    );
  }

  Future<int?> insert(
    Map<String, Object?> values,
  ) async {
    return await _database?.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> delete({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await _database?.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int?> update(
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await _database?.update(
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
  }) async {
    return await _database?.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> queryTotalUnread() async {
    List<Map<String, Object?>>? list = await _database?.rawQuery(
      "SELECT sum(unreadCount) FROM $tableName",
    );
    if (list != null) {
      return Sqflite.firstIntValue(list) ?? 0;
    }
    return 0;
  }
}
