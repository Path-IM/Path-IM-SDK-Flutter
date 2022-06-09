import 'package:path_im_core_flutter/path_im_core_flutter.dart';
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

  static MessageModel fromProtobuf(MsgData msg) {
    return MessageModel(
      clientMsgID: msg.clientMsgID,
      serverMsgID: msg.serverMsgID,
      conversationType: msg.conversationType,
      sendID: msg.sendID,
      receiveID: msg.receiveID,
      contentType: msg.contentType,
      content: SDKTool.decode(msg.content),
      atUserIDList: msg.atUserIDList,
      clientTime: msg.clientTime.toInt(),
      serverTime: msg.serverTime.toInt(),
      seq: msg.seq,
      offlinePush: OfflinePushModel.fromProtobuf(msg.offlinePush),
      msgOptions: MsgOptionsModel.fromProtobuf(msg.msgOptions),
    );
  }

  static MessageModel fromJsonMap(Map<String, dynamic> json) {
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
      offlinePush: OfflinePushModel.fromJsonMap(json["offlinePush"]),
      msgOptions: MsgOptionsModel.fromJsonMap(json["msgOptions"]),
      sendStatus: json["sendStatus"],
      markRead: json["markRead"],
      readCount: json["readCount"],
      markRevoke: json["markRevoke"],
      revokeContent: json["revokeContent"],
    );
  }

  Map<String, dynamic> toJsonMap() {
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
      "offlinePush": offlinePush?.toJsonMap(),
      "msgOptions": msgOptions.toJsonMap(),
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

  static OfflinePushModel fromProtobuf(OfflinePush offlinePush) {
    return OfflinePushModel(
      title: offlinePush.title,
      desc: offlinePush.desc,
      ex: offlinePush.ex,
      iOSPushSound: offlinePush.iOSPushSound,
      iOSBadgeCount: offlinePush.iOSBadgeCount,
    );
  }

  static OfflinePushModel fromJsonMap(Map<String, dynamic> json) {
    return OfflinePushModel(
      title: json["title"],
      desc: json["desc"],
      ex: json["ex"],
      iOSPushSound: json["iOSPushSound"],
      iOSBadgeCount: json["iOSBadgeCount"],
    );
  }

  Map<String, dynamic> toJsonMap() {
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

  static MsgOptionsModel fromProtobuf(MsgOptions msgOptions) {
    return MsgOptionsModel(
      persistent: msgOptions.persistent,
      history: msgOptions.history,
      local: msgOptions.local,
      updateUnreadCount: msgOptions.updateUnreadCount,
      updateConversation: msgOptions.updateConversation,
    );
  }

  static MsgOptionsModel fromJsonMap(Map<String, dynamic> json) {
    return MsgOptionsModel(
      persistent: json["persistent"],
      history: json["history"],
      local: json["local"],
      updateUnreadCount: json["updateUnreadCount"],
      updateConversation: json["updateConversation"],
    );
  }

  Map<String, dynamic> toJsonMap() {
    return {
      "persistent": persistent,
      "history": history,
      "local": local,
      "updateUnreadCount": updateUnreadCount,
      "updateConversation": updateConversation,
    };
  }
}
