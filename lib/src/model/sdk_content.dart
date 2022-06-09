import 'dart:convert';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

/// 正在输入
class TypingContent {
  bool focus;

  TypingContent({
    required this.focus,
  });

  static TypingContent decode(String content) {
    Map<String, dynamic> map = json.decode(content);
    return TypingContent(focus: map["focus"]);
  }

  List<int> encode() {
    Map<String, dynamic> map = {
      "focus": focus,
    };
    return SDKTool.encode(json.encode(map));
  }
}

/// 读取消息
class ReadContent {
  List<String> clientMsgIDList;

  ReadContent({
    required this.clientMsgIDList,
  });

  static ReadContent decode(String content) {
    Map<String, dynamic> map = json.decode(content);
    return ReadContent(clientMsgIDList: map["clientMsgIDList"]);
  }

  List<int> encode() {
    Map<String, dynamic> map = {
      "clientMsgIDList": clientMsgIDList,
    };
    return SDKTool.encode(json.encode(map));
  }
}

/// 撤回消息
class RevokeContent {
  String clientMsgID;
  String revokeContent;

  RevokeContent({
    required this.clientMsgID,
    required this.revokeContent,
  });

  static RevokeContent decode(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RevokeContent(
      clientMsgID: map["clientMsgID"],
      revokeContent: map["revokeContent"],
    );
  }

  List<int> encode() {
    Map<String, dynamic> map = {
      "clientMsgID": clientMsgID,
      "revokeContent": revokeContent,
    };
    return SDKTool.encode(json.encode(map));
  }
}
