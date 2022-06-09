/// 撤回回执监听
class RevokeReceiptListener {
  final Function(String clientMsgID)? onRevoke; // 撤回消息

  RevokeReceiptListener({
    this.onRevoke,
  });

  void revoke(String clientMsgID) {
    if (onRevoke != null) {
      onRevoke!(clientMsgID);
    }
  }
}
