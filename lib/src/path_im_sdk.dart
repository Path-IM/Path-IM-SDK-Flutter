import 'package:isar/isar.dart';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/callback/group_id_callback.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/listener/conversation_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/message_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/read_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/revoke_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/total_unread_listener.dart';
import 'package:path_im_sdk_flutter/src/listener/typing_receipt_listener.dart';
import 'package:path_im_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:path_im_sdk_flutter/src/model/config_model.dart';

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
    Duration autoPullTime = const Duration(seconds: 25),
    bool isarInspector = false,
    GroupIDCallback? groupIDCallback,
    ConnectListener? connectListener,
    ConversationListener? conversationListener,
    MessageListener? messageListener,
    TypingReceiptListener? typingReceiptListener,
    ReadReceiptListener? readReceiptListener,
    RevokeReceiptListener? revokeReceiptListener,
    TotalUnreadListener? totalUnreadListener,
  }) {
    _sdkManager = SDKManager(
      isarInspector: isarInspector,
      conversationListener: conversationListener,
      messageListener: messageListener,
      typingReceiptListener: typingReceiptListener,
      readReceiptListener: readReceiptListener,
      revokeReceiptListener: revokeReceiptListener,
      totalUnreadListener: totalUnreadListener,
    );
    messageManager = MessageManager(_sdkManager!);
    conversationManager = ConversationManager(_sdkManager!, messageManager);
    PathIMCore.instance.init(
      wsUrl: wsUrl,
      autoPull: autoPull,
      autoPullTime: autoPullTime,
      userCallback: UserCallback(
        onMaxSeq: () async {
          ConfigModel? model = await _sdkManager!
              .configModels()
              .filter()
              .keyEqualTo("maxSeq")
              .findFirst();
          return model?.value ?? 0;
        },
      ),
      groupCallback: GroupCallback(
        onGroupIDList: () async {
          return await groupIDCallback?.groupIDList() ?? [];
        },
        onGroupMaxSeq: (groupID) async {
          ConfigModel? model = await _sdkManager!
              .configModels()
              .filter()
              .keyEqualTo("groupMaxSeq_$groupID")
              .findFirst();
          return model?.value ?? 0;
        },
      ),
      connectListener: connectListener,
      receiveMsgListener: ReceiveMsgListener(
        onPullMsg: _sdkManager!.pullMsg,
        onPushMsg: _sdkManager!.pushMsg,
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
