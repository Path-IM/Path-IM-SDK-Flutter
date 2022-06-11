import 'package:sqflite/sqflite.dart';

class MessageTable {
  Database? _database;

  void configure(Database database) {
    _database = database;
  }

  Future<void> _create(String tableName) async {
    try {
      return await _database?.execute(
        "CREATE TABLE $tableName"
        "(clientMsgID TEXT PRIMARY KEY,"
        "serverMsgID TEXT,"
        "conversationType INTEGER,"
        "sendID TEXT,"
        "receiveID TEXT,"
        "contentType INTEGER,"
        "content TEXT,"
        "atUserIDList TEXT,"
        "clientTime INTEGER,"
        "serverTime INTEGER,"
        "seq INTEGER,"
        "offlinePush TEXT,"
        "msgOptions TEXT,"
        "sendStatus INTEGER,"
        "markRead BOOLEAN,"
        "readCount INTEGER,"
        "markRevoke BOOLEAN,"
        "revokeContent TEXT)",
      );
    } catch (_) {}
  }

  Future<int?> insert(
    String tableName,
    Map<String, dynamic> values,
  ) async {
    await _create(tableName);
    return _database?.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> delete(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await _create(tableName);
    return _database?.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int?> update(
    String tableName,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await _create(tableName);
    return _database?.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>?> query(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    await _create(tableName);
    return _database?.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }
}
