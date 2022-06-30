import 'package:isar/isar.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class ConversationManager {
  final SDKManager _sdkManager;
  final MessageManager _messageManager;

  ConversationManager(this._sdkManager, this._messageManager);

  /// 获取会话列表
  Future<List<ConversationModel>> getConversationList() async {
    return getCustomConversationList(
      sortBy: [
        const SortProperty(
          property: "isPinned",
          sort: Sort.desc,
        ),
        const SortProperty(
          property: "draftText",
          sort: Sort.desc,
        ),
        const SortProperty(
          property: "messageTime",
          sort: Sort.desc,
        ),
      ],
    );
  }

  /// 获取自定义会话列表
  Future<List<ConversationModel>> getCustomConversationList({
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
        .conversationModels()
        .buildQuery<ConversationModel>(
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

  /// 设置会话草稿
  Future<bool> setConversationDraft({
    required String conversationID,
    String? text,
  }) async {
    DraftTextModel? draftText;
    if (text != null) {
      draftText = DraftTextModel(
        text: text,
        time: DateTime.now().millisecondsSinceEpoch,
      );
    }
    ConversationModel? model = await _sdkManager
        .conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (model != null) {
      model.draftText = draftText;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.conversationModels().put(model);
      });
      return true;
    }
    return false;
  }

  /// 设置会话置顶
  Future<bool> setConversationPinned({
    required String conversationID,
    required bool isPinned,
  }) async {
    ConversationModel? model = await _sdkManager
        .conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (model != null) {
      model.isPinned = isPinned;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.conversationModels().put(model);
      });
      return true;
    }
    return false;
  }

  /// 标记会话已读
  Future<bool> markConversationRead({
    required String conversationID,
  }) async {
    List<MessageModel> list = await _messageManager.getCustomMessageList(
      whereClauses: [
        IndexWhereClause.equalTo(
          indexName: "conversationID",
          value: [conversationID],
        ),
      ],
      filter: FilterGroup.and([
        FilterCondition(
          type: ConditionType.eq,
          property: "sendID",
          value: _sdkManager.userID,
        ),
        FilterCondition(
          type: ConditionType.eq,
          property: "markRead",
          value: 0,
        ),
      ]),
    );
    if (list.isNotEmpty) {
      List<String> clientMsgIDList = [];
      for (MessageModel message in list) {
        clientMsgIDList.add(message.clientMsgID);
      }
      _messageManager.markMessageRead(
        conversationID: conversationID,
        clientMsgIDList: clientMsgIDList,
      );
    }
    ConversationModel? model = await _sdkManager
        .conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (model != null) {
      model.unreadCount = 0;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.conversationModels().put(model);
      });
      return true;
    }
    return false;
  }

  /// 删除本地会话
  Future<bool> deleteLocalConversation({
    required String conversationID,
    bool clearLocalMessage = true,
  }) async {
    if (clearLocalMessage) {
      await _messageManager.clearLocalMessage(
        conversationID: conversationID,
      );
    }
    ConversationModel? conversation = await _sdkManager
        .conversationModels()
        .filter()
        .conversationIDEqualTo(conversationID)
        .findFirst();
    if (conversation != null) {
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.conversationModels().delete(conversation.id!);
      });
      return true;
    }
    return false;
  }

  /// 获取总未读数
  Future<int> getTotalUnread() async {
    return await _sdkManager
        .conversationModels()
        .where()
        .unreadCountProperty()
        .sum();
  }
}
