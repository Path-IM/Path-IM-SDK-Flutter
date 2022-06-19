# Path-IM-SDK-Flutter

[![Pub](https://img.shields.io/pub/v/path_im_sdk_flutter.svg?style=flat-square)](https://pub.dev/packages/path_im_sdk_flutter)

支持Flutter5端开发。实现收发消息、会话和消息列表、草稿置顶、已读撤回等功能。

具体使用参考：[DEMO](https://github.com/Path-IM/Path-IM-SDK-Flutter-Demo)

## 初始化

     PathIMSDK.instance.init(
       wsUrl: "",
       autoPull: true, // 自动拉取
       pullTime: const Duration(seconds: 30), // 拉取间隔时间
       autoRetry: true, // 自动重试
       retryTime: const Duration(seconds: 3), // 重试间隔时间
       groupIDCallback: GroupIDCallback(
         onGroupIDList: () async {
           // 返回登录用户群聊ID
           return [];
         },
       ),
       connectListener: ConnectListener(
         onConnecting: () {
           // 连接中
         },
         onSuccess: () {
           // 连接成功
         },
         onError: (error) {
           // 发生错误
         },
         onClose: () {
           // 连接关闭
         },
       ),
       conversationListener: ConversationListener(
         onAdded: (conversation) {
           // 新增会话
         },
         onUpdate: (conversation) {
           // 更新会话
         },
       ),
       messageListener: MessageListener(
         onReceiveMsg: (message) {
           // 接收消息
         },
         onSendSuccess: (clientMsgID) {
           // 发送消息成功
         },
         onSendFailed: (clientMsgID, errMsg) {
           // 发送消息失败
         },
         onSendLimit: (clientMsgID, errMsg) {
           // 发送消息限流
         },
       ),
       typingReceiptListener: TypingReceiptListener(
         onTyping: (userID, focus) {
           // 正在输入
         },
       ),
       readReceiptListener: ReadReceiptListener(
         onRead: (message) {
           // 消息被读
         },
       ),
       revokeReceiptListener: RevokeReceiptListener(
         onRevoke: (message) {
           // 消息撤回
         },
       ),
       totalUnreadListener: TotalUnreadListener(
         onTotalUnread: (count) {
           // 总未读数
         },
       ),
     );
