import 'dart:async';
import 'dart:convert';
import 'package:fixnum/fixnum.dart';
import 'package:isar/isar.dart';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/read_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/revoke_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/total_unread_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/typing_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/model/config_model.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';
import 'package:path_im_sdk_flutter/src/model/sdk_content.dart';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';
import 'package:path_provider/path_provider.dart';

export 'conversation_manager.dart';
export 'message_manager.dart';

class SDKManager {
  final bool isarInspector;
  final ConversationListener? conversationListener;
  final MessageListener? messageListener;
  final TypingReceiptListener? typingReceiptListener;
  final ReadReceiptListener? readReceiptListener;
  final RevokeReceiptListener? revokeReceiptListener;
  final TotalUnreadListener? totalUnreadListener;

  SDKManager({
    this.isarInspector = false,
    this.conversationListener,
    this.messageListener,
    this.typingReceiptListener,
    this.readReceiptListener,
    this.revokeReceiptListener,
    this.totalUnreadListener,
  });

  late String userID;
  late Isar isar;

  /// 打开数据库
  Future openDatabase({required String userID}) async {
    this.userID = userID;
    isar = await Isar.open(
      schemas: [
        ConfigModelSchema,
        ConversationModelSchema,
        MessageModelSchema,
      ],
      directory: (await getApplicationDocumentsDirectory()).path,
      name: userID,
      inspector: isarInspector,
    );
  }

  /// 配置表
  IsarCollection<ConfigModel> configModels() {
    return isar.configModels;
  }

  /// 会话表
  IsarCollection<ConversationModel> conversationModels() {
    return isar.conversationModels;
  }

  /// 消息表
  IsarCollection<MessageModel> messageModels() {
    return isar.messageModels;
  }

  /// 关闭数据库
  Future closeDatabase() {
    return isar.close();
  }

  /// 拉取消息
  void pullMsg(List<MsgData> msgList) async {
    await isar.writeTxn((isar) async {
      for (MsgData msg in msgList) {
        await _handleMsg(msg);
      }
    });
  }

  /// 推送消息
  void pushMsg(MsgData msg) async {
    await isar.writeTxn((isar) async {
      await _handleMsg(msg);
    });
  }

  /// 处理消息
  Future _handleMsg(MsgData msg) async {
    if (msg.serverMsgID.isEmpty) return;
    int conversationType = msg.conversationType;
    String receiveID = msg.receiveID;
    if (conversationType == ConversationType.single && msg.sendID != userID) {
      receiveID = msg.sendID;
    }
    await _updateSequence(conversationType, receiveID, msg.seq);
    String conversationID = SDKTool.getConversationID(
      conversationType,
      receiveID,
    );
    MessageModel message = MessageModel.fromProtobuf(msg, conversationID);
    message.sendStatus = SendStatus.success;
    await _updateMessage(conversationID, message);
    await _updateConversation(conversationID, message);
    if (message.contentType == ContentType.typing) {
      _updateTyping(message);
      return;
    }
    if (message.contentType == ContentType.read) {
      await _updateRead(conversationID, message);
      return;
    }
    if (message.contentType == ContentType.revoke) {
      await _updateRevoke(conversationID, message);
      return;
    }
    messageListener?.receiveMsg(message);
  }

  /// 更新序列
  Future _updateSequence(
    int conversationType,
    String receiveID,
    int seq,
  ) async {
    ConfigModel? model;
    if (conversationType == ConversationType.single) {
      model = await configModels()
          .filter()
          .keyEqualTo(
            "maxSeq",
          )
          .findFirst();
      if (model != null) {
        PathIMCore.instance.pullSingleMsg(
          seqList: SDKTool.generateSeqList(seq, model.value),
        );
        model.value = seq;
      } else {
        model = ConfigModel(
          key: "maxSeq",
          value: seq,
        );
      }
    } else {
      model = await configModels()
          .filter()
          .keyEqualTo(
            "groupMaxSeq_$receiveID",
          )
          .findFirst();
      if (model != null) {
        PathIMCore.instance.pullGroupMsg(
          groupID: receiveID,
          seqList: SDKTool.generateSeqList(seq, model.value),
        );
        model.value = seq;
      } else {
        model = ConfigModel(
          key: "groupMaxSeq_$receiveID",
          value: seq,
        );
      }
    }
    await configModels().put(model);
  }

  /// 更新消息
  Future _updateMessage(
    String conversationID,
    MessageModel message,
  ) async {
    if (!message.msgOptions.local) return;
    MessageModel? messageModel = await messageModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .and()
        .clientMsgIDEqualTo(message.clientMsgID)
        .findFirst();
    if (messageModel != null) {
      messageModel.serverMsgID = message.serverMsgID;
      messageModel.serverTime = message.serverTime;
      messageModel.seq = message.seq;
      await messageModels().put(messageModel);
    } else {
      await messageModels().put(message);
    }
  }

  /// 更新会话
  Future _updateConversation(
    String conversationID,
    MessageModel message,
  ) async {
    MsgOptionsModel msgOptions = message.msgOptions;
    if (!msgOptions.updateConversation && !msgOptions.updateUnreadCount) return;
    ConversationModel? conversation = await conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (conversation != null) {
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.serverTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        conversation.unreadCount = ++conversation.unreadCount;
      }
      await conversationModels().put(conversation);
      conversationListener?.update(conversation);
    } else {
      conversation = ConversationModel(
        conversationID: conversationID,
        conversationType: message.conversationType,
        receiveID: message.receiveID,
      );
      if (msgOptions.updateConversation) {
        conversation.message = message;
        conversation.messageTime = message.serverTime;
      }
      if (msgOptions.updateUnreadCount && message.sendID != userID) {
        conversation.unreadCount = 1;
      }
      await conversationModels().put(conversation);
      conversationListener?.added(conversation);
    }
    await _calculateTotalUnread();
  }

  /// 正在输入
  void _updateTyping(MessageModel message) {
    if (message.conversationType != ConversationType.single) return;
    if (message.sendID == userID) return;
    TypingContent content = TypingContent.fromJson(message.content);
    typingReceiptListener?.typing(message.sendID, content.focus);
  }

  /// 读取消息
  Future _updateRead(
    String conversationID,
    MessageModel message,
  ) async {
    ReadContent content = ReadContent.fromJson(message.content);
    if (content.clientMsgIDList.isEmpty) return;
    for (String clientMsgID in content.clientMsgIDList) {
      MessageModel? messageModel = await messageModels()
          .filter()
          .conversationIDEqualTo(conversationID)
          .and()
          .clientMsgIDEqualTo(clientMsgID)
          .findFirst();
      if (messageModel == null) continue;
      if (messageModel.markRead == true) continue;
      messageModel.markRead = true;
      int readCount = 0;
      if (message.conversationType == ConversationType.group) {
        readCount = messageModel.readCount;
      }
      messageModel.readCount = ++readCount;
      await messageModels().put(messageModel);
      if (message.sendID == userID) {
        ConversationModel? conversation = await conversationModels()
            .filter()
            .conversationIDEqualTo(conversationID)
            .findFirst();
        if (conversation == null) continue;
        int unreadCount = conversation.unreadCount;
        if (unreadCount > 0) {
          conversation.unreadCount = --unreadCount;
          await conversationModels().put(conversation);
          conversationListener?.update(conversation);
        }
        await _calculateTotalUnread();
      } else {
        readReceiptListener?.read(messageModel);
      }
    }
  }

  /// 撤回消息
  Future _updateRevoke(
    String conversationID,
    MessageModel message,
  ) async {
    RevokeContent content = RevokeContent.fromJson(message.content);
    String clientMsgID = content.clientMsgID;
    MessageModel? messageModel = await messageModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .and()
        .clientMsgIDEqualTo(clientMsgID)
        .findFirst();
    if (messageModel == null) return;
    messageModel.markRevoke = true;
    messageModel.revokeContent = content.revokeContent;
    await messageModels().put(messageModel);
    revokeReceiptListener?.revoke(messageModel);
    ConversationModel? conversation = await conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (conversation == null) return;
    messageModel = conversation.message;
    if (messageModel != null && messageModel.clientMsgID == clientMsgID) {
      messageModel.markRevoke = true;
      messageModel.revokeContent = content.revokeContent;
      conversation.message = messageModel;
      await conversationModels().put(conversation);
      conversationListener?.update(conversation);
    }
  }

  /// 计算总未读数
  Future _calculateTotalUnread() async {
    int count = await conversationModels().where().unreadCountProperty().sum();
    totalUnreadListener?.totalUnread(count);
  }

  /// 发送消息
  Future<MessageModel> sendMsg({
    required String conversationID,
    required int contentType,
    required String content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
    required MsgOptionsModel msgOptions,
  }) async {
    String clientMsgID = SDKTool.getClientMsgID();
    Map map = SDKTool.splitConversationID(conversationID);
    int conversationType = map["conversationType"];
    String receiveID = map["receiveID"];
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    MessageModel message = MessageModel(
      clientMsgID: clientMsgID,
      conversationID: conversationID,
      conversationType: conversationType,
      sendID: userID,
      receiveID: receiveID,
      contentType: contentType,
      content: content,
      atUserIDList: atUserIDList,
      clientTime: timestamp,
      serverTime: timestamp,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
    );
    await isar.writeTxn((isar) async {
      await _updateMessage(conversationID, message);
      await _updateConversation(conversationID, message);
    });
    PathIMCore.instance.sendMsg(
      clientMsgID: clientMsgID,
      conversationType: conversationType,
      sendID: userID,
      receiveID: receiveID,
      contentType: contentType,
      content: utf8.encode(content),
      atUserIDList: atUserIDList,
      clientTime: Int64(timestamp),
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
    MessageModel? message = await messageModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .and()
        .clientMsgIDEqualTo(sendMsgResp.clientMsgID)
        .findFirst();
    if (message == null) return;
    if (status == SendStatus.success) {
      message.serverMsgID = sendMsgResp.serverMsgID;
      message.serverTime = sendMsgResp.serverTime.toInt();
      message.sendStatus = SendStatus.success;
      messageListener?.sendSuccess(sendMsgResp.clientMsgID);
    } else if (status == SendStatus.failed) {
      message.sendStatus = SendStatus.failed;
      messageListener?.sendFailed(sendMsgResp.clientMsgID, errMsg!);
    } else if (status == SendStatus.limit) {
      message.sendStatus = SendStatus.limit;
      messageListener?.sendLimit(sendMsgResp.clientMsgID, errMsg!);
    }
    await isar.writeTxn((isar) async {
      await messageModels().put(message);
    });
  }
}
