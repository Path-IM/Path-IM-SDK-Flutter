import 'package:path_im_sdk_flutter/src/model/message_model.dart';

/// 已读回执监听
class ReadReceiptListener {
  final Function(MessageModel message)? onRead; // 被读消息

  ReadReceiptListener({
    this.onRead,
  });

  void read(MessageModel message) {
    if (onRead != null) onRead!(message);
  }
}
