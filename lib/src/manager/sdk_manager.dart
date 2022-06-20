import 'dart:async';
import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/read_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/revoke_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/total_unread_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/typing_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';
import 'package:path_im_sdk_flutter/src/model/sdk_content.dart';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

export 'conversation_manager.dart';
export 'message_manager.dart';

class SDKManager {
  final GroupIDCallback? groupIDCallback;
  final ConversationListener? conversationListener;
  final MessageListener? messageListener;
  final TypingReceiptListener? typingReceiptListener;
  final ReadReceiptListener? readReceiptListener;
  final RevokeReceiptListener? revokeReceiptListener;
  final TotalUnreadListener? totalUnreadListener;

  SDKManager({
    this.groupIDCallback,
    this.conversationListener,
    this.messageListener,
    this.typingReceiptListener,
    this.readReceiptListener,
    this.revokeReceiptListener,
    this.totalUnreadListener,
  });

  late ConfigTable configTable;
  late ConversationTable conversationTable;
  late MessageTable messageTable;
  late SDKDatabase sdkDatabase;

  late String userID;

  /// 初始化
  void init() {
    sqfliteFfiInit();
    configTable = ConfigTable();
    conversationTable = ConversationTable();
    messageTable = MessageTable();
    sdkDatabase = SDKDatabase(
      configTable: configTable,
      conversationTable: conversationTable,
      messageTable: messageTable,
      groupIDCallback: groupIDCallback,
    );
  }

  /// 打开数据库
  Future openDatabase({required String userID}) {
    this.userID = userID;
    return sdkDatabase.open(userID: userID);
  }

  /// 关闭数据库
  Future closeDatabase() {
    return sdkDatabase.close();
  }

  /// 拉取消息
  void pullMsg(List<MsgData> msgList) async {
    for (MsgData msg in msgList) {
      pushMsg(msg);
    }
  }

  /// 推送消息
  void pushMsg(MsgData msg) async {
    if (msg.serverMsgID.isEmpty) return;
    MessageModel message = MessageModel.fromProtobuf(msg);
    message.sendStatus = SendStatus.success;
    await sdkDatabase.database!.transaction((txn) async {
      int conversationType = message.conversationType;
      String receiveID = message.receiveID;
      if (conversationType == ConversationType.single &&
          message.sendID != userID) {
        receiveID = message.sendID;
      }
      int? seq = message.seq;
      if (seq != null && seq != 0) {
        await _pullDefectMessage(conversationType, receiveID, seq, txn);
      }
      String conversationID = SDKTool.getConversationID(
        conversationType,
        receiveID,
      );
      await _updateMessage(conversationID, message, txn);
      await _updateConversation(conversationID, message, txn);
      if (conversationType == ConversationType.single &&
          message.contentType == ContentType.typing) {
        _updateTyping(message);
        return;
      }
      if (message.contentType == ContentType.read) {
        await _updateRead(conversationID, message, txn);
        return;
      }
      if (message.contentType == ContentType.revoke) {
        await _updateRevoke(conversationID, message, txn);
        return;
      }
      messageListener?.receiveMsg(message);
    });
  }

  /// 拉取缺失消息
  Future _pullDefectMessage(
    int conversationType,
    String receiveID,
    int seq,
    Transaction txn,
  ) async {
    if (conversationType == ConversationType.single) {
      int? maxSeq = await configTable.queryMaxSeq(txn: txn);
      PathIMCore.instance.pullSingleMsg(
        seqList: SDKTool.generateSeqList(seq, maxSeq),
      );
      configTable.updateMaxSeq(seq, txn: txn);
    } else {
      int? maxSeq = await configTable.queryGroupMaxSeq(receiveID, txn: txn);
      PathIMCore.instance.pullGroupMsg(
        groupID: receiveID,
        seqList: SDKTool.generateSeqList(seq, maxSeq),
      );
      configTable.updateGroupMaxSeq(receiveID, seq, txn: txn);
    }
  }

  /// 更新消息
  Future _updateMessage(
    String conversationID,
    MessageModel message,
    Transaction txn,
  ) async {
    if (!message.msgOptions.local) return;
    List<Map<String, dynamic>>? list = await messageTable.query(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [message.clientMsgID],
      txn: txn,
    );
    if (list != null && list.isNotEmpty) {
      Map<String, dynamic> values = {
        "serverMsgID": message.serverMsgID,
        "serverTime": message.serverTime,
        "seq": message.seq,
      };
      await messageTable.update(
        conversationID,
        values,
        where: "clientMsgID = ?",
        whereArgs: [message.clientMsgID],
        txn: txn,
      );
    } else {
      await messageTable.insert(
        conversationID,
        message.toJsonMap(),
        txn: txn,
      );
    }
  }

  /// 更新会话
  Future _updateConversation(
    String conversationID,
    MessageModel message,
    Transaction txn,
  ) async {
    MsgOptionsModel msgOptions = message.msgOptions;
    if (!msgOptions.updateConversation && !msgOptions.updateUnreadCount) {
      return;
    }
    List<Map<String, dynamic>>? list = await conversationTable.query(
      where: "conversationID = ?",
      whereArgs: [conversationID],
      txn: txn,
    );
    if (list != null && list.isNotEmpty) {
      ConversationModel conversation = ConversationModel.fromJsonMap(
        list.first,
      );
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.clientTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        int unreadCount = conversation.unreadCount!;
        conversation.unreadCount = ++unreadCount;
      }
      await conversationTable.update(
        conversation.toJsonMap(),
        where: "conversationID = ?",
        whereArgs: [conversationID],
        txn: txn,
      );
      conversationListener?.update(conversation);
    } else {
      ConversationModel conversation = ConversationModel(
        conversationID: conversationID,
        conversationType: message.conversationType,
        receiveID: message.receiveID,
      );
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.clientTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        conversation.unreadCount = 1;
      } else {
        conversation.unreadCount = 0;
      }
      await conversationTable.insert(
        conversation.toJsonMap(),
        txn: txn,
      );
      conversationListener?.added(conversation);
    }
    await _calculateTotalUnread(txn);
  }

  /// 正在输入
  void _updateTyping(MessageModel message) {
    if (message.sendID == userID) return;
    TypingContent content = TypingContent.fromJson(message.content);
    typingReceiptListener?.typing(message.sendID, content.focus);
  }

  /// 读取消息
  Future _updateRead(
    String conversationID,
    MessageModel message,
    Transaction txn,
  ) async {
    ReadContent content = ReadContent.fromJson(message.content);
    if (content.clientMsgIDList.isEmpty) return;
    for (String clientMsgID in content.clientMsgIDList) {
      List<Map<String, dynamic>>? list = await messageTable.query(
        conversationID,
        where: "clientMsgID = ?",
        whereArgs: [clientMsgID],
        txn: txn,
      );
      if (list == null || list.isEmpty) continue;
      MessageModel messageModel = MessageModel.fromJsonMap(list.first);
      if (messageModel.markRead == true) continue;
      messageModel.markRead = true;
      int readCount = 0;
      if (message.conversationType == ConversationType.group) {
        if (messageModel.readCount != null) {
          readCount = messageModel.readCount!;
        }
      }
      messageModel.readCount = ++readCount;
      int? value = await messageTable.update(
        conversationID,
        {"markRead": 1, "readCount": messageModel.readCount},
        where: "clientMsgID = ?",
        whereArgs: [clientMsgID],
        txn: txn,
      );
      if (value != null) {
        if (message.sendID == userID) {
          List<Map<String, dynamic>>? list = await conversationTable.query(
            where: "conversationID = ?",
            whereArgs: [conversationID],
            txn: txn,
          );
          if (list == null || list.isEmpty) return;
          ConversationModel conversation = ConversationModel.fromJsonMap(
            list.first,
          );
          int? unreadCount = conversation.unreadCount;
          if (unreadCount != null && unreadCount > 0) {
            await conversationTable.update(
              {"unreadCount": --unreadCount},
              where: "conversationID = ?",
              whereArgs: [conversationID],
              txn: txn,
            );
            conversationListener?.update(conversation);
          }
          await _calculateTotalUnread(txn);
        } else {
          readReceiptListener?.read(messageModel);
        }
      }
    }
  }

  /// 撤回消息
  Future _updateRevoke(
    String conversationID,
    MessageModel message,
    Transaction txn,
  ) async {
    RevokeContent content = RevokeContent.fromJson(message.content);
    String clientMsgID = content.clientMsgID;
    List<Map<String, dynamic>>? list = await messageTable.query(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [clientMsgID],
      txn: txn,
    );
    if (list == null || list.isEmpty) return;
    MessageModel? messageModel = MessageModel.fromJsonMap(list.first);
    messageModel.markRevoke = true;
    messageModel.revokeContent = content.revokeContent;
    int? value = await messageTable.update(
      conversationID,
      {"markRevoke": 1, "revokeContent": messageModel.revokeContent},
      where: "clientMsgID = ?",
      whereArgs: [clientMsgID],
      txn: txn,
    );
    if (value != null) {
      revokeReceiptListener?.revoke(messageModel);
      List<Map<String, dynamic>>? list = await conversationTable.query(
        where: "conversationID = ?",
        whereArgs: [conversationID],
        txn: txn,
      );
      if (list == null || list.isEmpty) return;
      ConversationModel conversation = ConversationModel.fromJsonMap(
        list.first,
      );
      messageModel = conversation.message;
      if (messageModel != null && messageModel.clientMsgID == clientMsgID) {
        messageModel.markRevoke = true;
        messageModel.revokeContent = content.revokeContent;
        conversation.message = messageModel;
        await conversationTable.update(
          {"message": messageModel.toJson()},
          where: "conversationID = ?",
          whereArgs: [conversationID],
          txn: txn,
        );
        conversationListener?.update(conversation);
      }
    }
  }

  /// 计算总未读数
  Future _calculateTotalUnread(Transaction txn) async {
    int value = await conversationTable.queryTotalUnread(txn: txn);
    totalUnreadListener?.totalUnread(value);
  }

  /// 发送消息
  Future<MessageModel> sendMsg({
    required int conversationType,
    required String receiveID,
    required int contentType,
    required String content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
    required MsgOptionsModel msgOptions,
  }) async {
    String clientMsgID = SDKTool.getClientMsgID();
    int clientTime = DateTime.now().millisecondsSinceEpoch;
    MessageModel message = MessageModel(
      clientMsgID: clientMsgID,
      conversationType: conversationType,
      sendID: userID,
      receiveID: receiveID,
      contentType: contentType,
      content: content,
      atUserIDList: atUserIDList,
      clientTime: clientTime,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
      sendStatus: SendStatus.sending,
    );
    await sdkDatabase.database!.transaction((txn) async {
      String conversationID = SDKTool.getConversationID(
        conversationType,
        receiveID,
      );
      await _updateMessage(conversationID, message, txn);
      await _updateConversation(conversationID, message, txn);
    });
    PathIMCore.instance.sendMsg(
      clientMsgID: clientMsgID,
      conversationType: conversationType,
      sendID: userID,
      receiveID: receiveID,
      contentType: contentType,
      content: utf8.encode(content),
      atUserIDList: atUserIDList,
      clientTime: Int64(clientTime),
      offlinePush: offlinePush != null
          ? OfflinePush(
              title: offlinePush.title,
              desc: offlinePush.desc,
              ex: offlinePush.ex,
              iOSPushSound: offlinePush.iOSPushSound,
              iOSBadgeCount: offlinePush.iOSBadgeCount,
            )
          : null,
      msgOptions: MsgOptions(
        persistent: msgOptions.persistent,
        history: msgOptions.history,
        local: msgOptions.local,
        updateUnreadCount: msgOptions.updateUnreadCount,
        updateConversation: msgOptions.updateConversation,
      ),
    );
    return message;
  }

  /// 发送消息回执
  void sendMsgReceipt(
    SendMsgResp sendMsgResp,
    int status, {
    String? errMsg,
  }) async {
    String conversationID = SDKTool.getConversationID(
      sendMsgResp.conversationType,
      sendMsgResp.receiveID,
    );
    List<Map<String, dynamic>>? list = await messageTable.query(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [sendMsgResp.clientMsgID],
    );
    if (list == null || list.isEmpty) return;
    Map<String, dynamic> values = {};
    if (status == SendStatus.success) {
      values = {
        "serverMsgID": sendMsgResp.serverMsgID,
        "serverTime": sendMsgResp.serverTime.toInt(),
        "sendStatus": SendStatus.success,
      };
      messageListener?.sendSuccess(sendMsgResp.clientMsgID);
    } else if (status == SendStatus.failed) {
      values = {"sendStatus": SendStatus.failed};
      messageListener?.sendFailed(sendMsgResp.clientMsgID, errMsg!);
    } else if (status == SendStatus.limit) {
      values = {"sendStatus": SendStatus.limit};
      messageListener?.sendLimit(sendMsgResp.clientMsgID, errMsg!);
    }
    if (values.isEmpty) return;
    messageTable.update(
      conversationID,
      values,
      where: "clientMsgID = ?",
      whereArgs: [sendMsgResp.clientMsgID],
    );
  }
}
