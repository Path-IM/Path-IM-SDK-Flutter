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
  OfflinePush? offlinePush;
  MsgOptions msgOptions;

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
      offlinePush: msg.offlinePush,
      msgOptions: msg.msgOptions,
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
      offlinePush: OfflinePush.fromJson(json["offlinePush"].toString()),
      msgOptions: MsgOptions.fromJson(json["msgOptions"].toString()),
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
      "offlinePush": offlinePush?.writeToJsonMap(),
      "msgOptions": msgOptions.writeToJsonMap(),
      "sendStatus": sendStatus,
      "markRead": markRead,
      "readCount": readCount,
      "markRevoke": markRevoke,
      "revokeContent": revokeContent,
    };
  }
}
