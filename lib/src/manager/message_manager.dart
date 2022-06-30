import 'package:isar/isar.dart';
import 'package:path_im_sdk_flutter/src/constant/content_type.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';
import 'package:path_im_sdk_flutter/src/model/sdk_content.dart';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

class MessageManager {
  final SDKManager _sdkManager;

  MessageManager(this._sdkManager);

  /// 获取消息列表
  Future<List<MessageModel>> getMessageList({
    required String conversationID,
    int? offset,
    int? limit,
  }) async {
    return await getCustomMessageList(
      whereClauses: [
        IndexWhereClause.equalTo(
          indexName: "conversationID",
          value: [conversationID],
        ),
      ],
      offset: offset,
      limit: limit,
    );
  }

  /// 获取自定义消息列表
  Future<List<MessageModel>> getCustomMessageList({
    List<WhereClause> whereClauses = const [],
    bool whereDistinct = false,
    Sort whereSort = Sort.asc,
    FilterOperation? filter,
    List<SortProperty> sortBy = const [],
    List<DistinctProperty> distinctBy = const [],
    int? offset,
    int? limit,
    String? property,
  }) async {
    return await _sdkManager
        .messageModels()
        .buildQuery<MessageModel>(
          whereClauses: whereClauses,
          whereDistinct: whereDistinct,
          whereSort: whereSort,
          filter: filter,
          sortBy: sortBy,
          distinctBy: distinctBy,
          offset: offset,
          limit: limit,
          property: property,
        )
        .findAll();
  }

  /// 发送文本消息
  Future<MessageModel> sendText({
    required String conversationID,
    required String text,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required PictureContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required VoiceContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required VideoContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required FileContent content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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

  /// 发送自定义消息
  Future<MessageModel> sendCustom({
    required String conversationID,
    required int contentType,
    required String content,
    List<String>? atUserIDList,
    OfflinePushModel? offlinePush,
    required MsgOptionsModel msgOptions,
  }) async {
    assert(contentType > ContentType.file);
    Map map = SDKTool.splitConversationID(conversationID);
    return _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
      contentType: contentType,
      content: content,
      atUserIDList: atUserIDList,
      offlinePush: offlinePush,
      msgOptions: msgOptions,
    );
  }

  /// 发送输入状态
  void sendTypingStatus({
    required String conversationID,
    required bool focus,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required List<String> clientMsgIDList,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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
    required String conversationID,
    required String clientMsgID,
    required String revokeContent,
  }) {
    Map map = SDKTool.splitConversationID(conversationID);
    _sdkManager.sendMsg(
      conversationType: map["conversationType"],
      receiveID: map["receiveID"],
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

  /// 删除本地消息
  Future<bool> deleteLocalMessage({
    required String conversationID,
    required String clientMsgID,
  }) async {
    MessageModel? message = await _sdkManager
        .messageModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .clientMsgIDEqualTo(clientMsgID)
        .findFirst();
    if (message != null) {
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.messageModels().delete(message.id!);
      });
      return true;
    }
    return false;
  }

  /// 清空本地消息
  Future<bool> clearLocalMessage({
    required String conversationID,
  }) async {
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager
          .messageModels()
          .filter()
          .conversationIDEqualTo(conversationID)
          .deleteAll();
    });
    return true;
  }
}
