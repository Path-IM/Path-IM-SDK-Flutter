import 'dart:io';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/database/sdk_database.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/read_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/revoke_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/total_unread_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/typing_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';

class PathIMSDK {
  factory PathIMSDK() => _getInstance();

  static PathIMSDK get instance => _getInstance();
  static PathIMSDK? _instance;

  static PathIMSDK _getInstance() {
    return _instance ??= PathIMSDK._internal();
  }

  PathIMSDK._internal();

  SDKManager? _sdkManager;
  late ConversationManager conversationManager;
  late MessageManager messageManager;

  /// 初始化
  void init({
    required String wsUrl,
    bool autoPull = true,
    Duration pullTime = const Duration(seconds: 30),
    bool autoRetry = true,
    Duration retryTime = const Duration(seconds: 3),
    GroupIDCallback? groupIDCallback,
    ConnectListener? connectListener,
    ConversationListener? conversationListener,
    MessageListener? messageListener,
    TypingReceiptListener? typingReceiptListener,
    ReadReceiptListener? readReceiptListener,
    RevokeReceiptListener? revokeReceiptListener,
    TotalUnreadListener? totalUnreadListener,
  }) {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    _sdkManager = SDKManager(
      groupIDCallback: groupIDCallback,
      conversationListener: conversationListener,
      messageListener: messageListener,
      typingReceiptListener: typingReceiptListener,
      readReceiptListener: readReceiptListener,
      revokeReceiptListener: revokeReceiptListener,
      totalUnreadListener: totalUnreadListener,
    );
    _sdkManager!.init();
    messageManager = MessageManager(_sdkManager!);
    conversationManager = ConversationManager(_sdkManager!, messageManager);
    ConfigTable configTable = _sdkManager!.configTable;
    PathIMCore.instance.init(
      wsUrl: wsUrl,
      autoPull: autoPull,
      pullTime: pullTime,
      autoRetry: autoRetry,
      retryTime: retryTime,
      userCallback: UserCallback(
        onMaxSeq: () async {
          return await configTable.queryMaxSeq() ?? 0;
        },
      ),
      groupCallback: GroupCallback(
        onGroupIDList: () async {
          return await groupIDCallback?.groupIDList() ?? [];
        },
        onGroupMaxSeq: (groupID) async {
          return await configTable.queryGroupMaxSeq(groupID) ?? 0;
        },
      ),
      connectListener: connectListener,
      receiveMsgListener: ReceiveMsgListener(
        onReceive: _sdkManager!.receiveMsg,
      ),
      sendMsgListener: SendMsgListener(
        onSuccess: (sendMsgResp) {
          _sdkManager!.sendMsgReceipt(
            sendMsgResp,
            SendStatus.success,
          );
        },
        onFailed: (sendMsgResp, errMsg) {
          _sdkManager!.sendMsgReceipt(
            sendMsgResp,
            SendStatus.failed,
            errMsg: errMsg,
          );
        },
        onLimit: (sendMsgResp, errMsg) {
          _sdkManager!.sendMsgReceipt(
            sendMsgResp,
            SendStatus.limit,
            errMsg: errMsg,
          );
        },
      ),
    );
  }

  /// 登录
  Future login({
    required String token,
    required String userID,
  }) async {
    await _sdkManager?.openDatabase(userID: userID);
    await PathIMCore.instance.login(
      token: token,
      userID: userID,
    );
  }

  /// 登出
  Future logout() async {
    await PathIMCore.instance.logout();
    await _sdkManager?.closeDatabase();
  }
}
