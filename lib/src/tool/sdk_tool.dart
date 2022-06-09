import 'dart:convert';
import 'package:uuid/uuid.dart';

class SDKTool {
  static const Uuid _uuid = Uuid();

  static String getClientMsgID() {
    return _uuid.v1().replaceAll("-", "");
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
      if (diff > 0) {
        return List.generate(diff, (index) {
          return maxSeq + index + 1;
        });
      }
    }
    return [];
  }
}
