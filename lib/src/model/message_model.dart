import 'dart:convert';
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

  static MessageModel fromJson(String source) {
    return fromJsonMap(json.decode(source));
  }

  String toJson() {
    return json.encode(toJsonMap());
  }

  static MessageModel fromJsonMap(Map<String, dynamic> map) {
    return MessageModel(
      clientMsgID: map["clientMsgID"],
      serverMsgID: map["serverMsgID"],
      conversationType: map["conversationType"],
      sendID: map["sendID"],
      receiveID: map["receiveID"],
      contentType: map["contentType"],
      content: SDKTool.decode(map["content"]),
      atUserIDList: map["atUserIDList"],
      clientTime: map["clientTime"],
      serverTime: map["serverTime"],
      seq: map["seq"],
      offlinePush: OfflinePushModel.fromJson(map["offlinePush"]),
      msgOptions: MsgOptionsModel.fromJson(map["msgOptions"]),
      sendStatus: map["sendStatus"],
      markRead: map["markRead"],
      readCount: map["readCount"],
      markRevoke: map["markRevoke"],
      revokeContent: map["revokeContent"],
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

  static OfflinePushModel fromProtobuf(OfflinePush offlinePush) {
    return OfflinePushModel(
      title: offlinePush.title,
      desc: offlinePush.desc,
      ex: offlinePush.ex,
      iOSPushSound: offlinePush.iOSPushSound,
      iOSBadgeCount: offlinePush.iOSBadgeCount,
    );
  }

  static OfflinePushModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return OfflinePushModel(
      title: map["title"],
      desc: map["desc"],
      ex: map["ex"],
      iOSPushSound: map["iOSPushSound"],
      iOSBadgeCount: map["iOSBadgeCount"],
    );
  }

  String toJson() {
    return json.encode({
      "title": title,
      "desc": desc,
      "ex": ex,
      "iOSPushSound": iOSPushSound,
      "iOSBadgeCount": iOSBadgeCount,
    });
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

  static MsgOptionsModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgOptionsModel(
      persistent: map["persistent"],
      history: map["history"],
      local: map["local"],
      updateUnreadCount: map["updateUnreadCount"],
      updateConversation: map["updateConversation"],
    );
  }

  String toJson() {
    return json.encode({
      "persistent": persistent,
      "history": history,
      "local": local,
      "updateUnreadCount": updateUnreadCount,
      "updateConversation": updateConversation,
    });
  }
}
