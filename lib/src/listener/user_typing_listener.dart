/// 用户输入监听
class UserTypingListener {
  final Function(String userID, bool focus)? onTyping;

  UserTypingListener({
    this.onTyping,
  });

  void typing(String userID, bool focus) {
    if (onTyping != null) onTyping!(userID, focus);
  }
}
