import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class ConversationManager {
  final SDKManager _sdkManager;
  final MessageManager _messageManager;
  late ConversationTable _conversationTable;

  ConversationManager(this._sdkManager, this._messageManager) {
    _conversationTable = _sdkManager.conversationTable;
  }

  /// 获取所有会话列表
  Future<List<ConversationModel>> getAllConversationList() async {
    return getConversationList(
      orderBy: "isPinned DESC, draftText DESC, messageTime DESC",
    );
  }

  /// 自定义条件获取会话列表
  Future<List<ConversationModel>> getConversationList({
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    List<Map<String, dynamic>>? list = await _conversationTable.query(
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
    if (list != null && list.isNotEmpty) {
      return list.map((json) {
        return ConversationModel.fromJsonMap(json);
      }).toList();
    }
    return [];
  }

  /// 设置会话草稿
  Future<bool> setConversationDraft({
    required String conversationID,
    String? text,
  }) async {
    DraftText? draftText;
    if (text != null) {
      draftText = DraftText(
        text: text,
        time: DateTime.now().millisecondsSinceEpoch,
      );
    }
    int? count = await _conversationTable.update(
      {"draftText": draftText?.toJson() ?? ""},
      where: "conversationID = ?",
      whereArgs: [conversationID],
    );
    return count != null;
  }

  /// 设置会话置顶
  Future<bool> setConversationPinned({
    required String conversationID,
    required bool isPinned,
  }) async {
    int? count = await _conversationTable.update(
      {"isPinned": isPinned ? 1 : 0},
      where: "conversationID = ?",
      whereArgs: [conversationID],
    );
    return count != null;
  }

  /// 已读会话
  Future<bool> markConversationRead({
    required int conversationType,
    required String conversationID,
  }) async {
    String receiveID = conversationID;
    if (conversationType == ConversationType.group) {
      receiveID = receiveID.replaceFirst("group_", "");
    }
    List<MessageModel> list = await _messageManager.getMessageList(
      conversationID: conversationID,
      where: "receiveID = ? AND markRead = ?",
      whereArgs: [receiveID, 0],
    );
    if (list.isNotEmpty) {
      List<String> clientMsgIDList = [];
      for (MessageModel messageModel in list) {
        clientMsgIDList.add(messageModel.clientMsgID);
      }
      _messageManager.markMessageRead(
        conversationType: conversationType,
        receiveID: receiveID,
        clientMsgIDList: clientMsgIDList,
      );
    }
    int? count = await _conversationTable.update(
      {"unreadCount": 0},
      where: "conversationID = ?",
      whereArgs: [conversationID],
    );
    return count != null;
  }

  /// 删除会话
  Future<bool> deleteConversation({
    required String conversationID,
    bool clearMessage = true,
  }) async {
    if (clearMessage) {
      await _messageManager.clearMessage(
        conversationID: conversationID,
      );
    }
    int? count = await _conversationTable.delete(
      where: "conversationID = ?",
      whereArgs: [conversationID],
    );
    return count != null;
  }

  /// 获取总未读消息数
  Future<int> getTotalUnread() async {
    return await _conversationTable.queryTotalUnread();
  }
}
