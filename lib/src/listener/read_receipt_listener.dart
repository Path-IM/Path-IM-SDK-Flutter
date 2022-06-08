/// 已读回执监听
class ReadReceiptListener {
  final Function(String clientMsgID)? onSingleReceipt; // 单聊消息被读回执
  final Function(String clientMsgID, int readCount)? onGroupReceipt; // 群聊消息被读回执

  ReadReceiptListener({
    this.onSingleReceipt,
    this.onGroupReceipt,
  });

  void singleReceipt(String clientMsgID) {
    if (onSingleReceipt != null) {
      onSingleReceipt!(clientMsgID);
    }
  }

  void groupReceipt(String clientMsgID, int readCount) {
    if (onGroupReceipt != null) {
      onGroupReceipt!(clientMsgID, readCount);
    }
  }
}
