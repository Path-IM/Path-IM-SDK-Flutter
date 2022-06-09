/// 输入回执监听
class TypingReceiptListener {
  final Function(String userID, bool focus)? onTyping; // 正在输入

  TypingReceiptListener({
    this.onTyping,
  });

  void typing(String userID, bool focus) {
    if (onTyping != null) onTyping!(userID, focus);
  }
}
