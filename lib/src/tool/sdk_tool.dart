import 'dart:convert';
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
    return "${conversationType}_$receiveID";
  }

  static Map splitConversationID(
    String conversationID,
  ) {
    int conversationType = int.parse(conversationID.substring(0, 1));
    String receiveID = conversationID.substring(2, conversationID.length);
    return {
      "conversationType": conversationType,
      "receiveID": receiveID,
    };
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
