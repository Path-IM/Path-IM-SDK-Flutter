import 'package:path_im_sdk_flutter/src/model/message_model.dart';

/// 消息变化监听
class MessageListener {
  final Function(MessageModel message)? onReceiveMsg; // 接收消息
  final Function(String clientMsgID)? onSendSuccess; // 发送成功
  final Function(String clientMsgID, String errMsg)? onSendFailed; // 发送失败
  final Function(String clientMsgID, String errMsg)? onSendLimit; // 发送限流

  MessageListener({
    this.onReceiveMsg,
    this.onSendSuccess,
    this.onSendFailed,
    this.onSendLimit,
  });

  void receiveMsg(MessageModel message) {
    if (onReceiveMsg != null) onReceiveMsg!(message);
  }

  void sendSuccess(String clientMsgID) {
    if (onSendSuccess != null) onSendSuccess!(clientMsgID);
  }

  void sendFailed(String clientMsgID, String errMsg) {
    if (onSendFailed != null) onSendFailed!(clientMsgID, errMsg);
  }

  void sendLimit(String clientMsgID, String errMsg) {
    if (onSendLimit != null) onSendLimit!(clientMsgID, errMsg);
  }
}
