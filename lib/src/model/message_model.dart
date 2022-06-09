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

  bool? markRead;
  int? readCount;

  bool? markRevoke;
  String? revokeContent;

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
    this.markRead,
    this.readCount,
    this.markRevoke,
    this.revokeContent,
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
      markRead: json["markRead"],
      readCount: json["readCount"],
      markRevoke: json["markRevoke"],
      revokeContent: json["revokeContent"],
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
      "markRead": markRead,
      "readCount": readCount,
      "markRevoke": markRevoke,
      "revokeContent": revokeContent,
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
