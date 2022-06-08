import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';

/// 会话变化监听
class ConversationListener {
  final Function(ConversationModel conversation)? onAdded; // 新增会话
  final Function(ConversationModel conversation)? onUpdate; // 更新会话

  ConversationListener({
    this.onAdded,
    this.onUpdate,
  });

  void added(ConversationModel conversation) {
    if (onAdded != null) onAdded!(conversation);
  }

  void update(ConversationModel conversation) {
    if (onUpdate != null) onUpdate!(conversation);
  }
}
