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

  /// 获取会话列表
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
    required String receiveID,
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
      where: "receiveID = ?",
      whereArgs: [receiveID],
    );
    return count != null;
  }

  /// 设置会话置顶
  Future<bool> setConversationPinned({
    required String receiveID,
    required bool isPinned,
  }) async {
    int? count = await _conversationTable.update(
      {"isPinned": isPinned ? 1 : 0},
      where: "receiveID = ?",
      whereArgs: [receiveID],
    );
    return count != null;
  }

  /// 标记会话已读
  Future<bool> markConversationRead({
    required int conversationType,
    required String receiveID,
  }) async {
    List<MessageModel> list = await _messageManager.getMessageList(
      receiveID: receiveID,
      where: "sendID != ? AND markRead = ?",
      whereArgs: [_sdkManager.userID, 0],
    );
    if (list.isNotEmpty) {
      List<String> clientMsgIDList = [];
      for (MessageModel message in list) {
        clientMsgIDList.add(message.clientMsgID);
      }
      _messageManager.markMessageRead(
        conversationType: conversationType,
        receiveID: receiveID,
        clientMsgIDList: clientMsgIDList,
      );
    }
    int? count = await _conversationTable.update(
      {"unreadCount": 0},
      where: "receiveID = ?",
      whereArgs: [receiveID],
    );
    return count != null;
  }

  /// 删除本地会话
  Future<bool> deleteLocalConversation({
    required String receiveID,
    bool clearLocalMessage = true,
  }) async {
    if (clearLocalMessage) {
      await _messageManager.clearLocalMessage(
        receiveID: receiveID,
      );
    }
    int? count = await _conversationTable.delete(
      where: "receiveID = ?",
      whereArgs: [receiveID],
    );
    return count != null;
  }

  /// 获取总未读数
  Future<int> getTotalUnread() async {
    return await _conversationTable.queryTotalUnread();
  }
}
