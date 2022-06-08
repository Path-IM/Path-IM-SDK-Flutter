import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

class MessageModel {
  String clientMsgID;
  String? serverMsgID;
  int conversationType;
  String sendID;
  String receiveID;
  int contentType;
  String content;
  List<String>? atUserIDList;
  int clientTime;
  int? serverTime;
  int? seq;
  OfflinePushModel? offlinePush;
  MsgOptionsModel msgOptions;
  int? sendStatus;
  MsgReadModel? msgRead;
  MsgRevokeModel? msgRevoke;

  MessageModel({
    required this.clientMsgID,
    this.serverMsgID,
    required this.conversationType,
    required this.sendID,
    required this.receiveID,
    required this.contentType,
    required this.content,
    this.atUserIDList,
    required this.clientTime,
    this.serverTime,
    this.seq,
    this.offlinePush,
    required this.msgOptions,
    this.sendStatus,
    this.msgRead,
    this.msgRevoke,
  });

  static MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel(
      clientMsgID: json["clientMsgID"],
      serverMsgID: json["serverMsgID"],
      conversationType: json["conversationType"],
      sendID: json["sendID"],
      receiveID: json["receiveID"],
      contentType: json["contentType"],
      content: SDKTool.decode(json["content"]),
      atUserIDList: json["atUserIDList"],
      clientTime: json["clientTime"],
      serverTime: json["serverTime"],
      seq: json["seq"],
      offlinePush: OfflinePushModel.fromJson(json["offlinePush"]),
      msgOptions: MsgOptionsModel.fromJson(json["msgOptions"]),
      sendStatus: json["sendStatus"],
      msgRead: MsgReadModel.fromJson(json["msgRead"]),
      msgRevoke: MsgRevokeModel.fromJson(json["msgRevoke"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "clientMsgID": clientMsgID,
      "serverMsgID": serverMsgID,
      "conversationType": conversationType,
      "sendID": sendID,
      "receiveID": receiveID,
      "contentType": contentType,
      "content": content,
      "atUserIDList": atUserIDList,
      "clientTime": clientTime,
      "serverTime": serverTime,
      "seq": seq,
      "offlinePush": offlinePush?.toJson(),
      "msgOptions": msgOptions.toJson(),
      "sendStatus": sendStatus,
      "msgRead": msgRead?.toJson(),
      "msgRevoke": msgRevoke?.toJson(),
    };
  }
}

class OfflinePushModel {
  String title;
  String desc;
  String ex;
  String iOSPushSound;
  bool iOSBadgeCount;

  OfflinePushModel({
    required this.title,
    required this.desc,
    required this.ex,
    required this.iOSPushSound,
    required this.iOSBadgeCount,
  });

  static OfflinePushModel fromJson(Map<String, dynamic> json) =>
      OfflinePushModel(
        title: json["title"],
        desc: json["desc"],
        ex: json["ex"],
        iOSPushSound: json["iOSPushSound"],
        iOSBadgeCount: json["iOSBadgeCount"],
      );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "desc": desc,
      "ex": ex,
      "iOSPushSound": iOSPushSound,
      "iOSBadgeCount": iOSBadgeCount,
    };
  }
}

class MsgOptionsModel {
  bool persistent;
  bool history;
  bool local;
  bool updateUnreadCount;
  bool updateConversation;

  MsgOptionsModel({
    required this.persistent,
    required this.history,
    required this.local,
    required this.updateUnreadCount,
    required this.updateConversation,
  });

  static MsgOptionsModel fromJson(Map<String, dynamic> json) => MsgOptionsModel(
        persistent: json["persistent"],
        history: json["history"],
        local: json["local"],
        updateUnreadCount: json["updateUnreadCount"],
        updateConversation: json["updateConversation"],
      );

  Map<String, dynamic> toJson() {
    return {
      "persistent": persistent,
      "history": history,
      "local": local,
      "updateUnreadCount": updateUnreadCount,
      "updateConversation": updateConversation,
    };
  }
}

class MsgReadModel {
  bool isRead;
  int count;

  MsgReadModel({
    required this.isRead,
    required this.count,
  });

  static MsgReadModel fromJson(Map<String, dynamic> json) => MsgReadModel(
        isRead: json["isRead"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() {
    return {
      "isRead": isRead,
      "count": count,
    };
  }
}

class MsgRevokeModel {
  bool isRevoke;
  String content;

  MsgRevokeModel({
    required this.isRevoke,
    required this.content,
  });

  static MsgRevokeModel fromJson(Map<String, dynamic> json) => MsgRevokeModel(
        isRevoke: json["isRevoke"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() {
    return {
      "isRevoke": isRevoke,
      "content": content,
    };
  }
}
