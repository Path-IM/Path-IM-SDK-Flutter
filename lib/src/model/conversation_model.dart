import 'dart:convert';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class ConversationModel {
  int conversationType;
  String receiveID;
  MessageModel? message;
  int? messageTime;
  int? unreadCount;
  DraftText? draftText;
  bool? isPinned;

  ConversationModel({
    required this.conversationType,
    required this.receiveID,
    this.message,
    this.messageTime,
    this.unreadCount,
    this.draftText,
    this.isPinned,
  });

  static ConversationModel fromJsonMap(Map<String, dynamic> map) =>
      ConversationModel(
        conversationType: map["conversationType"],
        receiveID: map["receiveID"],
        message: map["message"].isNotEmpty
            ? MessageModel.fromJson(map["message"])
            : null,
        messageTime: map["messageTime"],
        unreadCount: map["unreadCount"],
        draftText: map["draftText"].isNotEmpty
            ? DraftText.fromJson(map["draftText"])
            : null,
        isPinned: map["isPinned"] == 1,
      );

  Map<String, dynamic> toJsonMap() => {
        "conversationType": conversationType,
        "receiveID": receiveID,
        "message": message?.toJson() ?? "",
        "messageTime": messageTime ?? 0,
        "unreadCount": unreadCount ?? 0,
        "draftText": draftText?.toJson() ?? "",
        "isPinned": isPinned == true ? 1 : 0,
      };
}

class DraftText {
  String text;
  int time;

  DraftText({
    required this.text,
    required this.time,
  });

  static DraftText fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return DraftText(
      text: map["text"],
      time: map["time"],
    );
  }

  String toJson() {
    return json.encode({
      "text": text,
      "time": time,
    });
  }
}
