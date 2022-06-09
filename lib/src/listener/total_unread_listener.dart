/// 总未读数监听
class TotalUnreadListener {
  final Function(int count)? onTotalUnread;

  TotalUnreadListener({
    this.onTotalUnread,
  });

  void totalUnread(int count) {
    if (onTotalUnread != null) onTotalUnread!(count);
  }
}
