/// 总未读数监听
class TotalUnreadListener {
  final Function(int count)? onTotalUnread; // 未读总数

  TotalUnreadListener({
    this.onTotalUnread,
  });

  void totalUnread(int count) {
    if (onTotalUnread != null) onTotalUnread!(count);
  }
}
