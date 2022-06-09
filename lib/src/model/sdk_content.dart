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
  List<String> msgIDs;

  ReadContent({
    required this.msgIDs,
  });

  static ReadContent decode(String content) {
    Map<String, dynamic> map = json.decode(content);
    return ReadContent(msgIDs: map["msgIDs"]);
  }

  List<int> encode() {
    Map<String, dynamic> map = {
      "msgIDs": msgIDs,
    };
    return SDKTool.encode(json.encode(map));
  }
}
