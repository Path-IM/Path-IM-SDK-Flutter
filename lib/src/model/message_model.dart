import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:path_im_core_flutter/path_im_core_flutter.dart';
import 'package:path_im_sdk_flutter/src/constant/send_status.dart';
import 'package:path_im_sdk_flutter/src/model/converter/message_converter.dart';
import 'package:path_im_sdk_flutter/src/tool/sdk_tool.dart';

part 'message_model.g.dart';

@Collection()
class MessageModel {
  @Id()
  int? id;

  @Index()
  String clientMsgID;
  String? serverMsgID;
  @Index()
  String conversationID;
  int conversationType;
  String sendID;
  String receiveID;
  @Index()
  int contentType;
  @Index()
  String content;
  List<String>? atUserIDList;
  int clientTime;
  int? serverTime;
  int? seq;
  @OfflinePushConverter()
  OfflinePushModel? offlinePush;
  @MsgOptionsConverter()
  MsgOptionsModel msgOptions;
  int sendStatus;
  bool markRead;
  int readCount;
  bool markRevoke;
  String revokeContent;

  MessageModel({
    required this.clientMsgID,
    this.serverMsgID,
    required this.conversationID,
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
    this.sendStatus = SendStatus.sending,
    this.markRead = false,
    this.readCount = 0,
    this.markRevoke = false,
    this.revokeContent = "",
  });

  static MessageModel fromProtobuf(MsgData msg, String conversationID) {
    return MessageModel(
      clientMsgID: msg.clientMsgID,
      serverMsgID: msg.serverMsgID,
      conversationID: conversationID,
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
      conversationID: map["conversationID"],
      conversationType: map["conversationType"],
      sendID: map["sendID"],
      receiveID: map["receiveID"],
      contentType: map["contentType"],
      content: SDKTool.decode(map["content"]),
      atUserIDList: map["atUserIDList"].toString().split(","),
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
      "conversationID": conversationID,
      "conversationType": conversationType,
      "sendID": sendID,
      "receiveID": receiveID,
      "contentType": contentType,
      "content": content,
      "atUserIDList": atUserIDList?.join(",") ?? "",
      "clientTime": clientTime,
      "serverTime": serverTime,
      "seq": seq,
      "offlinePush": offlinePush?.toJson() ??
          OfflinePushModel(
            title: "",
            desc: "",
            ex: "",
            iOSPushSound: "",
            iOSBadgeCount: false,
          ).toJson(),
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
