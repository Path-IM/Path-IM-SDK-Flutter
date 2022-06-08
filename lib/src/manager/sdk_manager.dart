import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

export 'conversation_manager.dart';
export 'message_manager.dart';

class SDKManager {
  final GroupIDCallback? groupIDCallback;
  final ConversationListener? conversationListener;
  final MessageListener? messageListener;

  SDKManager({
    this.groupIDCallback,
    this.conversationListener,
    this.messageListener,
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
    if (msg.contentType == ContentType.typing) {
      return;
    }
    if (msg.contentType == ContentType.read) {
      return;
    }
    if (msg.contentType == ContentType.revoke) {
      return;
    }
    MessageModel message = MessageModel.fromJson(
      msg.writeToJsonMap(),
    );
    String conversationID;
    if (message.conversationType == ConversationType.single) {
      if (message.seq != null && message.seq != 0) {
        int? maxSeq = await configTable.queryMaxSeq();
        PathIMCore.instance.pullSingleMsg(
          seqList: SDKTool.generateSeqList(message.seq!, maxSeq),
        );
        configTable.updateMaxSeq(message.seq!);
      }
      conversationID = message.receiveID;
    } else {
      if (message.seq != null && message.seq != 0) {
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
    _updateMessage(conversationID, message);
    _updateConversation(conversationID, message);
    messageListener?.receiveMsg(message);
  }

  /// 更新消息
  void _updateMessage(
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
      await messageTable.update(
        conversationID,
        message.toJson(),
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
  void _updateConversation(
    String conversationID,
    MessageModel message,
  ) async {
    MsgOptionsModel msgOptions = message.msgOptions;
    if (!msgOptions.updateConversation && !msgOptions.updateUnreadCount) return;
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
  }

  /// 发送成功
  void sendSuccess(SendMsgResp sendMsgResp) {
    Map<String, dynamic> values = sendMsgResp.writeToJsonMap();
    values["sendStatus"] = SendStatus.success;
    _updateReceiptMsg(sendMsgResp, values);
    messageListener?.sendSuccess(sendMsgResp.clientMsgID);
  }

  /// 发送失败
  void sendFailed(SendMsgResp sendMsgResp, String errMsg) {
    Map<String, dynamic> values = {"sendStatus": SendStatus.failed};
    _updateReceiptMsg(sendMsgResp, values);
    messageListener?.sendFailed(sendMsgResp.clientMsgID, errMsg);
  }

  /// 发送限流
  void sendLimit(SendMsgResp sendMsgResp, String errMsg) {
    Map<String, dynamic> values = {"sendStatus": SendStatus.limit};
    _updateReceiptMsg(sendMsgResp, values);
    messageListener?.sendLimit(sendMsgResp.clientMsgID, errMsg);
  }

  /// 更新回执消息
  void _updateReceiptMsg(SendMsgResp sendMsgResp, Map<String, dynamic> values) {
    String conversationID;
    if (sendMsgResp.conversationType == ConversationType.single) {
      conversationID = sendMsgResp.receiveID;
    } else {
      conversationID = "group-${sendMsgResp.receiveID}";
    }
    messageTable.update(
      conversationID,
      values,
      where: "clientMsgID = ?",
      whereArgs: [sendMsgResp.clientMsgID],
    );
  }
}
