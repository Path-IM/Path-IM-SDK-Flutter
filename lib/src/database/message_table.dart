import 'package:sqflite/sqflite.dart';

class MessageTable {
  Database? _database;

  void onCreate(Database database) {
    _database = database;
  }

  Future<void> _create(String tableName) async {
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
  }

  Future<int?> insert(
    String tableName,
    Map<String, dynamic> values,
  ) async {
    Future<int?> insert() async {
      return await _database?.insert(
        tableName,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    int? id;
    try {
      id = await insert();
    } catch (_) {
      await _create(tableName);
      id = await insert();
    }
    return id;
  }

  Future<int?> delete(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    Future<int?> delete() async {
      return await _database?.delete(
        tableName,
        where: where,
        whereArgs: whereArgs,
      );
    }

    int? count;
    try {
      count = await delete();
    } catch (_) {
      await _create(tableName);
      count = await delete();
    }
    return count;
  }

  Future<int?> update(
    String tableName,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    Future<int?> update() async {
      return await _database?.update(
        tableName,
        values,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    int? count;
    try {
      count = await update();
    } catch (_) {
      await _create(tableName);
      count = await update();
    }
    return count;
  }

  Future<List<Map<String, dynamic>>?> query(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    Future<List<Map<String, dynamic>>?> query() async {
      return await _database?.query(
        tableName,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
    }

    List<Map<String, dynamic>>? list;
    try {
      list = await query();
    } catch (_) {
      await _create(tableName);
      list = await query();
    }
    return list;
  }
}
