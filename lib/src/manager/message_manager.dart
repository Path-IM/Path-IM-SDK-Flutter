import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';
import 'package:path_im_sdk_flutter/src/model/sdk_content.dart';

class MessageManager {
  final SDKManager _sdkManager;
  late MessageTable _messageTable;

  MessageManager(this._sdkManager) {
    _messageTable = _sdkManager.messageTable;
  }

  /// 获取消息列表
  Future<List<MessageModel>> getMessageList({
    required String conversationID,
    String? where,
    List<Object?>? whereArgs,
    String orderBy = "clientTime DESC",
    int? limit,
    int? offset,
  }) async {
    List<Map<String, dynamic>>? list = await _messageTable.query(
      conversationID,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
    if (list != null && list.isNotEmpty) {
      return list.map((json) {
        return MessageModel.fromJsonMap(json);
      }).toList();
    }
    return [];
  }

  /// 发送文本消息
  Future<MessageModel> sendText({
    required int conversationType,
    required String receiveID,
    required String text,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.text,
      content: text,
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: true,
        updateUnreadCount: true,
        updateConversation: true,
      ),
    );
  }

  /// 发送图片消息
  Future<MessageModel> sendPicture({
    required int conversationType,
    required String receiveID,
    required PictureContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.picture,
      content: content.toJson(),
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: true,
        updateUnreadCount: true,
        updateConversation: true,
      ),
    );
  }

  /// 发送语音消息
  Future<MessageModel> sendVoice({
    required int conversationType,
    required String receiveID,
    required VoiceContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.voice,
      content: content.toJson(),
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: true,
        updateUnreadCount: true,
        updateConversation: true,
      ),
    );
  }

  /// 发送视频消息
  Future<MessageModel> sendVideo({
    required int conversationType,
    required String receiveID,
    required VideoContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.video,
      content: content.toJson(),
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: true,
        updateUnreadCount: true,
        updateConversation: true,
      ),
    );
  }

  /// 发送文件消息
  Future<MessageModel> sendFile({
    required int conversationType,
    required String receiveID,
    required FileContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.file,
      content: content.toJson(),
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: true,
        updateUnreadCount: true,
        updateConversation: true,
      ),
    );
  }

  /// 发送输入状态
  void sendTypingStatus({
    required String receiveID,
    required bool focus,
  }) {
    _sdkManager.sendMsg(
      conversationType: ConversationType.single,
      receiveID: receiveID,
      contentType: ContentType.typing,
      content: TypingContent(focus: focus).toJson(),
      msgOptions: MsgOptionsModel(
        persistent: false,
        history: false,
        local: false,
        updateUnreadCount: false,
        updateConversation: false,
      ),
    );
  }

  /// 标记消息已读
  void markMessageRead({
    required int conversationType,
    required String receiveID,
    required List<String> clientMsgIDList,
  }) {
    _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.read,
      content: ReadContent(clientMsgIDList: clientMsgIDList).toJson(),
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: false,
        updateUnreadCount: false,
        updateConversation: false,
      ),
    );
  }

  /// 标记消息撤回
  void markMessageRevoke({
    required int conversationType,
    required String receiveID,
    required String clientMsgID,
    required String revokeContent,
  }) {
    _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: ContentType.revoke,
      content: RevokeContent(
        clientMsgID: clientMsgID,
        revokeContent: revokeContent,
      ).toJson(),
      msgOptions: MsgOptionsModel(
        persistent: true,
        history: true,
        local: false,
        updateUnreadCount: false,
        updateConversation: false,
      ),
    );
  }

  /// 发送自定义消息
  Future<MessageModel> sendCustom({
    required int conversationType,
    required String receiveID,
    required int contentType,
    required String content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
    required MsgOptionsModel msgOptions,
  }) async {
    assert(contentType > ContentType.file);
    return _sdkManager.sendMsg(
      conversationType: conversationType,
      receiveID: receiveID,
      contentType: contentType,
      content: content,
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
    );
  }

  /// 删除消息
  Future<bool> deleteMessage({
    required String conversationID,
    required String clientMsgID,
  }) async {
    int? count = await _messageTable.delete(
      conversationID,
      where: "clientMsgID = ?",
      whereArgs: [clientMsgID],
    );
    return count != null && count != 0;
  }

  /// 清空消息
  Future<bool> clearMessage({
    required String conversationID,
  }) async {
    int? count = await _messageTable.delete(conversationID);
    return count != null && count != 0;
  }
}
