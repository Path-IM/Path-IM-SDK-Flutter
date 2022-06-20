import 'package:sqflite_common/sqlite_api.dart';

class MessageTable {
  Database? _database;

  void configure(Database database) {
    _database = database;
  }

  Future<void> _create(
    String tableName, {
    Transaction? txn,
  }) async {
    try {
      return await (txn ?? _database)?.execute(
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
    Map<String, dynamic> values, {
    Transaction? txn,
  }) async {
    await _create(tableName, txn: txn);
    return (txn ?? _database)?.insert(
      tableName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> delete(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
    Transaction? txn,
  }) async {
    await _create(tableName, txn: txn);
    return (txn ?? _database)?.delete(
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
    Transaction? txn,
  }) async {
    await _create(tableName, txn: txn);
    return (txn ?? _database)?.update(
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
    Transaction? txn,
  }) async {
    await _create(tableName, txn: txn);
    return (txn ?? _database)?.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }
}
