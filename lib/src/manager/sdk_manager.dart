import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/read_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/total_unread_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/user_typing_listener.dart';
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
  final UserTypingListener? userTypingListener;
  final ReadReceiptListener? readReceiptListener;
  final TotalUnreadListener? totalUnreadListener;

  SDKManager({
    this.groupIDCallback,
    this.conversationListener,
    this.messageListener,
    this.userTypingListener,
    this.readReceiptListener,
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
    MessageModel message = MessageModel.fromJson(
      msg.writeToJsonMap(),
    );
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
      conversationID = "group-${message.receiveID}";
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
        message.toJson(),
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
      ConversationModel conversation = ConversationModel.fromJson(list.first);
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.serverTime ?? message.clientTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        int unreadCount = conversation.unreadCount!;
        conversation.unreadCount = ++unreadCount;
      }
      await conversationTable.update(
        conversation.toJson(),
        where: "conversationID = ?",
        whereArgs: [conversationID],
      );
      conversationListener?.update(conversation);
    } else {
      ConversationModel conversation = ConversationModel(
        conversationID: conversationID,
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
        conversation.toJson(),
      );
      conversationListener?.added(conversation);
    }
    _calculateTotalUnread();
  }

  /// 正在输入
  void _updateTyping(MessageModel message) {
    if (message.sendID == userID) return;
    TypingContent content = TypingContent.decode(message.content);
    userTypingListener?.typing(message.sendID, content.focus);
  }

  /// 读取消息
  void _updateRead(String conversationID, MessageModel message) async {
    ReadContent content = ReadContent.decode(message.content);
    if (content.msgIDs.isEmpty) return;
    for (String msgID in content.msgIDs) {
      List<Map<String, dynamic>>? list = await messageTable.query(
        conversationID,
        where: "clientMsgID = ?",
        whereArgs: [msgID],
      );
      if (list == null || list.isEmpty) continue;
      MessageModel messageModel = MessageModel.fromJson(list.first);
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
        {
          "markRead": true,
          "readCount": readCount,
        },
        where: "clientMsgID = ?",
        whereArgs: [msgID],
      );
      if (value != null) {
        if (message.sendID == userID) {
          List<Map<String, dynamic>>? list = await conversationTable.query(
            where: "conversationID = ?",
            whereArgs: [conversationID],
          );
          if (list == null || list.isEmpty) return;
          ConversationModel conversationModel = ConversationModel.fromJson(
            list.first,
          );
          int? unreadCount = conversationModel.unreadCount;
          if (unreadCount != null && unreadCount > 0) {
            await conversationTable.update(
              {"unreadCount": --unreadCount},
              where: "conversationID = ?",
              whereArgs: [conversationID],
            );
            conversationListener?.update(conversationModel);
            _calculateTotalUnread();
          }
        } else {
          if (message.conversationType == ConversationType.single) {
            readReceiptListener?.singleReceipt(msgID);
          } else {
            readReceiptListener?.groupReceipt(msgID, readCount);
          }
        }
      }
    }
  }

  /// 计算总未读数
  void _calculateTotalUnread() async {
    int value = await conversationTable.queryTotalUnread();
    totalUnreadListener?.totalUnread(value);
  }

  /// 撤回消息
  void _updateRevoke(String conversationID, MessageModel message) {}

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
      conversationID = "group-${sendMsgResp.receiveID}";
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
        "serverTime": sendMsgResp.serverTime,
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
