import 'dart:convert';

class SDKTool {
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
