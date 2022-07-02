# Path-IM-SDK-Flutter

[![Pub](https://img.shields.io/pub/v/path_im_sdk_flutter.svg?style=flat-square)](https://pub.dev/packages/path_im_sdk_flutter)

支持Flutter5端开发。实现收发消息、会话和消息列表、草稿置顶、已读撤回等功能。

使用参考：[DEMO](https://github.com/Path-IM/Path-IM-SDK-Flutter-Demo)

它是空安全的，为什么没有空安全标识？
问题参考：[flutter](https://github.com/flutter/flutter/issues/44937)
问题参考：[pana](https://github.com/dart-lang/pana/issues/891)

不影响使用和构建，因为它：💪 Building with sound null safety 💪

## 初始化

     PathIMSDK.instance.init(
       wsUrl: "",
       autoPull: true, // 自动拉取
       autoPullTime: const Duration(seconds: 25), // 自动拉取时间
       inspector: false, // 连接数据库
       groupIDCallback: GroupIDCallback(
         onGroupIDList: () async {
           // 返回用户群聊IDList
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

## 登录

     PathIMSDK.instance.login(
       token: "",
       userID: "",
     );

## 登出

     PathIMSDK.instance.logout();
