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

  /// 接收消息
  void receiveMsg(MsgData msg) async {
    if (msg.serverMsgID.isEmpty) return;
    MessageModel message = MessageModel.fromProtobuf(msg);
    String conversationID;
    if (message.conversationType == ConversationType.single) {
      if (message.seq != null && message.seq != 0) {
        // 拉取缺失消息
        int? maxSeq = await configTable.queryMaxSeq();
        PathIMCore.instance.pullSingleMsg(
          seqList: SDKTool.generateSeqList(message.seq!, maxSeq),
        );
        configTable.updateMaxSeq(message.seq!);
      }
      if (message.sendID == userID) {
        conversationID = message.receiveID;
      } else {
        conversationID = message.sendID;
      }
    } else {
      if (message.seq != null && message.seq != 0) {
        // 拉取缺失消息
        int? maxSeq = await configTable.queryGroupMaxSeq(message.receiveID);
        PathIMCore.instance.pullGroupMsg(
          groupID: message.receiveID,
          seqList: SDKTool.generateSeqList(message.seq!, maxSeq),
        );
        configTable.updateGroupMaxSeq(message.receiveID, message.seq!);
      }
      conversationID = "group_${message.receiveID}";
    }
    message.sendStatus = SendStatus.success;
    await _updateMessage(conversationID, message);
    await _updateConversation(conversationID, message);
    if (message.conversationType == ConversationType.single &&
        message.contentType == ContentType.typing) {
      _updateTyping(message);
      return;
    }
    if (message.contentType == ContentType.read) {
      _updateRead(conversationID, message);
      return;
    }
    if (message.contentType == ContentType.revoke) {
      _updateRevoke(conversationID, message);
      return;
    }
    messageListener?.receiveMsg(message);
  }

  /// 更新消息
  Future _updateMessage(
    String conversationID,
    MessageModel message,
  ) async {
    if (!message.msgOptions.local) return;
    List<Map<String, dynamic>>? list = await messageTable.query(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [message.clientMsgID],
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
      );
    } else {
      await messageTable.insert(
        conversationID,
        message.toJsonMap(),
      );
    }
  }

  /// 更新会话
  Future _updateConversation(
    String conversationID,
    MessageModel message,
  ) async {
    MsgOptionsModel msgOptions = message.msgOptions;
    List<Map<String, dynamic>>? list = await conversationTable.query(
      where: "conversationID = ?",
      whereArgs: [conversationID],
    );
    if (list != null && list.isNotEmpty) {
      ConversationModel conversation = ConversationModel.fromJsonMap(
        list.first,
      );
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.serverTime ?? message.clientTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        int unreadCount = conversation.unreadCount!;
        conversation.unreadCount = ++unreadCount;
      }
      await conversationTable.update(
        conversation.toJsonMap(),
        where: "conversationID = ?",
        whereArgs: [conversationID],
      );
      conversationListener?.update(conversation);
    } else {
      ConversationModel conversation = ConversationModel(
        conversationID: conversationID,
        conversationType: message.conversationType,
      );
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.serverTime ?? message.clientTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        conversation.unreadCount = 1;
      } else {
        conversation.unreadCount = 0;
      }
      await conversationTable.insert(
        conversation.toJsonMap(),
      );
      conversationListener?.added(conversation);
    }
    _calculateTotalUnread();
  }

  /// 正在输入
  void _updateTyping(MessageModel message) {
    if (message.sendID == userID) return;
    TypingContent content = TypingContent.fromJson(message.content);
    typingReceiptListener?.typing(message.sendID, content.focus);
  }

  /// 读取消息
  void _updateRead(String conversationID, MessageModel message) async {
    ReadContent content = ReadContent.fromJson(message.content);
    if (content.clientMsgIDList.isEmpty) return;
    for (String clientMsgID in content.clientMsgIDList) {
      List<Map<String, dynamic>>? list = await messageTable.query(
        conversationID,
        where: "clientMsgID = ?",
        whereArgs: [clientMsgID],
      );
      if (list == null || list.isEmpty) continue;
      MessageModel messageModel = MessageModel.fromJsonMap(list.first);
      if (messageModel.markRead == true) continue;
      int readCount = 0;
      if (message.conversationType == ConversationType.single) {
        ++readCount;
      } else {
        if (messageModel.readCount != null) {
          readCount = messageModel.readCount!;
        }
        ++readCount;
      }
      int? value = await messageTable.update(
        conversationID,
        {"markRead": 1, "readCount": readCount},
        where: "clientMsgID = ?",
        whereArgs: [clientMsgID],
      );
      if (value != null) {
        if (message.sendID == userID) {
          List<Map<String, dynamic>>? list = await conversationTable.query(
            where: "conversationID = ?",
            whereArgs: [conversationID],
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
            );
            conversationListener?.update(conversation);
            _calculateTotalUnread();
          }
        } else {
          if (message.conversationType == ConversationType.single) {
            readReceiptListener?.single(clientMsgID);
          } else {
            readReceiptListener?.group(clientMsgID, readCount);
          }
        }
      }
    }
  }

  /// 撤回消息
  void _updateRevoke(String conversationID, MessageModel message) async {
    RevokeContent content = RevokeContent.fromJson(message.content);
    String clientMsgID = content.clientMsgID;
    List<Map<String, dynamic>>? list = await messageTable.query(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [clientMsgID],
    );
    if (list == null || list.isEmpty) return;
    int? value = await messageTable.update(
      conversationID,
      {"markRevoke": 1, "revokeContent": content.revokeContent},
      where: "clientMsgID = ?",
      whereArgs: [clientMsgID],
    );
    if (value != null) {
      revokeReceiptListener?.revoke(clientMsgID);
      List<Map<String, dynamic>>? list = await conversationTable.query(
        where: "conversationID = ?",
        whereArgs: [conversationID],
      );
      if (list == null || list.isEmpty) return;
      ConversationModel conversation = ConversationModel.fromJsonMap(
        list.first,
      );
      MessageModel? messageModel = conversation.message;
      if (messageModel != null && messageModel.clientMsgID == clientMsgID) {
        messageModel.markRevoke = true;
        messageModel.revokeContent = content.revokeContent;
        conversation.message = messageModel;
        await conversationTable.update(
          conversation.toJsonMap(),
          where: "conversationID = ?",
          whereArgs: [conversationID],
        );
        conversationListener?.update(conversation);
      }
    }
  }

  /// 计算总未读数
  void _calculateTotalUnread() async {
    int value = await conversationTable.queryTotalUnread();
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
    String conversationID;
    if (conversationType == ConversationType.single) {
      conversationID = receiveID;
    } else {
      conversationID = "group_$receiveID";
    }
    MessageModel messageModel = MessageModel(
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
    await messageTable.insert(
      conversationID,
      messageModel.toJsonMap(),
    );
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
    return messageModel;
  }

  /// 发送消息回执
  void sendMsgReceipt(
    SendMsgResp sendMsgResp,
    int status, {
    String? errMsg,
  }) async {
    String conversationID;
    if (sendMsgResp.conversationType == ConversationType.single) {
      conversationID = sendMsgResp.receiveID;
    } else {
      conversationID = "group_${sendMsgResp.receiveID}";
    }
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
