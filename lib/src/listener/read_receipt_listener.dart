/// 已读回执监听
class ReadReceiptListener {
  final Function(String clientMsgID)? onSingle; // 单聊被读
  final Function(String clientMsgID, int readCount)? onGroup; // 群聊被读

  ReadReceiptListener({
    this.onSingle,
    this.onGroup,
  });

  void single(String clientMsgID) {
    if (onSingle != null) {
      onSingle!(clientMsgID);
    }
  }

  void group(String clientMsgID, int readCount) {
    if (onGroup != null) {
      onGroup!(clientMsgID, readCount);
    }
  }
}
