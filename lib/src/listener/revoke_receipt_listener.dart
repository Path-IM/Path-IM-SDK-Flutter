import 'package:path_im_sdk_flutter/src/model/message_model.dart';

/// 撤回回执监听
class RevokeReceiptListener {
  final Function(MessageModel message)? onRevoke; // 撤回消息

  RevokeReceiptListener({
    this.onRevoke,
  });

  void revoke(MessageModel message) {
    if (onRevoke != null) onRevoke!(message);
  }
}
