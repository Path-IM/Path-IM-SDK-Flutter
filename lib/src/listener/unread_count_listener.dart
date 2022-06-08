/// 未读数量监听
class UnreadCountListener {
  final Function(int count)? onUnreadCount;

  UnreadCountListener({
    this.onUnreadCount,
  });

  void unreadCount(int count) {
    if (onUnreadCount != null) onUnreadCount!(count);
  }
}
