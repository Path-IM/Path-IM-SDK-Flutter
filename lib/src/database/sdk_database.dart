import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/database/config_table.dart';
import 'package:path_im_sdk_flutter/src/database/conversation_table.dart';
import 'package:path_im_sdk_flutter/src/database/message_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

export 'config_table.dart';
export 'conversation_table.dart';
export 'message_table.dart';
export 'package:sqflite/sqflite.dart';
export 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SDKDatabase {
  final ConfigTable configTable;
  final ConversationTable conversationTable;
  final MessageTable messageTable;
  final GroupIDCallback? groupIDCallback;

  SDKDatabase({
    required this.configTable,
    required this.conversationTable,
    required this.messageTable,
    this.groupIDCallback,
  });

  Database? database;

  Future open({required String userID}) async {
    database = await openDatabase(
      join(await getDatabasesPath(), "$userID.db"),
      version: 1,
      onConfigure: (db) {
        configTable.configure(db);
        conversationTable.configure(db);
        messageTable.configure(db);
      },
      onCreate: (db, version) async {
        await configTable.create();
        await conversationTable.create();
      },
      onOpen: (db) async {
        int? maxSeq = await configTable.queryMaxSeq();
        if (maxSeq == null) {
          configTable.initMaxSeq();
        }
        if (groupIDCallback == null) return;
        List groupIDList = await groupIDCallback!.groupIDList();
        for (String groupID in groupIDList) {
          int? groupMaxSeq = await configTable.queryGroupMaxSeq(groupID);
          if (groupMaxSeq == null) {
            configTable.initGroupMaxSeq(groupID);
          }
        }
      },
    );
  }

  Future close() async {
    await database?.close();
  }
}
