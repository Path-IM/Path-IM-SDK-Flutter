import 'dart:convert';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:uuid/uuid.dart';

class SDKTool {
  static const Uuid _uuid = Uuid();

  static String getClientMsgID() {
    return _uuid.v1().replaceAll("-", "");
  }

  static String getConversationID(
    int conversationType,
    String receiveID,
  ) {
    String conversationID;
    if (conversationType == ConversationType.single) {
      conversationID = "single_$receiveID";
    } else {
      conversationID = "group_$receiveID";
    }
    return conversationID;
  }

  static String decode(dynamic content) {
    if (content is List<int>) {
      return utf8.decode(content);
    }
    return content;
  }

  static List<int> encode(String content) {
    return utf8.encode(content);
  }

  static List<int> generateSeqList(int seq, int? maxSeq) {
    if (maxSeq != null && maxSeq != 0) {
      int diff = seq - maxSeq;
      if (diff > 1) {
        return List.generate(diff, (index) {
          return maxSeq + index + 1;
        });
      }
    }
    return [];
  }
}
