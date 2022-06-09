import 'dart:convert';

/// 正在输入
class TypingContent {
  bool focus;

  TypingContent({
    required this.focus,
  });

  static TypingContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return TypingContent(focus: map["focus"]);
  }

  String toJson() {
    return {
      "focus": focus,
    }.toString();
  }
}

/// 读取消息
class ReadContent {
  List<String> clientMsgIDList;

  ReadContent({
    required this.clientMsgIDList,
  });

  static ReadContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return ReadContent(clientMsgIDList: map["clientMsgIDList"]);
  }

  String toJson() {
    return {
      "clientMsgIDList": clientMsgIDList,
    }.toString();
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

  static RevokeContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RevokeContent(
      clientMsgID: map["clientMsgID"],
      revokeContent: map["revokeContent"],
    );
  }

  String toJson() {
    return {
      "clientMsgID": clientMsgID,
      "revokeContent": revokeContent,
    }.toString();
  }
}

/// 图片消息
class PictureContent {
  String pictureUrl;
  String? extend;

  PictureContent({
    required this.pictureUrl,
    this.extend,
  });

  static PictureContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return PictureContent(
      pictureUrl: map["pictureUrl"],
      extend: map["extend"],
    );
  }

  String toJson() {
    return {
      "pictureUrl": pictureUrl,
      "extend": extend,
    }.toString();
  }
}

/// 语音消息
class VoiceContent {
  String voiceUrl;
  int duration;
  String? extend;

  VoiceContent({
    required this.voiceUrl,
    required this.duration,
    this.extend,
  });

  static VoiceContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return VoiceContent(
      voiceUrl: map["voiceUrl"],
      duration: map["duration"],
      extend: map["extend"],
    );
  }

  String toJson() {
    return {
      "voiceUrl": voiceUrl,
      "duration": duration,
      "extend": extend,
    }.toString();
  }
}

/// 视频消息
class VideoContent {
  String videoUrl;
  int duration;
  String? extend;

  VideoContent({
    required this.videoUrl,
    required this.duration,
    this.extend,
  });

  static VideoContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return VideoContent(
      videoUrl: map["videoUrl"],
      duration: map["duration"],
      extend: map["extend"],
    );
  }

  String toJson() {
    return {
      "videoUrl": videoUrl,
      "duration": duration,
      "extend": extend,
    }.toString();
  }
}

/// 文件消息
class FileContent {
  String fileUrl;
  String type;
  int size;
  String? extend;

  FileContent({
    required this.fileUrl,
    required this.type,
    required this.size,
    this.extend,
  });

  static FileContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return FileContent(
      fileUrl: map["fileUrl"],
      type: map["type"],
      size: map["size"],
      extend: map["extend"],
    );
  }

  String toJson() {
    return {
      "fileUrl": fileUrl,
      "type": type,
      "size": size,
      "extend": extend,
    }.toString();
  }
}
