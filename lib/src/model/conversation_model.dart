import 'dart:convert';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class ConversationModel {
  String conversationID;
  MessageModel? message;
  int? messageTime;
  int? unreadCount;
  DraftText? draftText;
  bool? isPinned;

  ConversationModel({
    required this.conversationID,
    this.message,
    this.messageTime,
    this.unreadCount,
    this.draftText,
    this.isPinned,
  });

  static ConversationModel fromJsonMap(Map<String, dynamic> map) =>
      ConversationModel(
        conversationID: map["conversationID"],
        message: map["message"] != null
            ? MessageModel.fromJson(map["message"])
            : null,
        messageTime: map["messageTime"],
        unreadCount: map["unreadCount"],
        draftText: map["draftText"] != null
            ? DraftText.fromJson(map["draftText"])
            : null,
        isPinned: map["isPinned"],
      );

  Map<String, dynamic> toJsonMap() => {
        "conversationID": conversationID,
        "message": message?.toJson(),
        "messageTime": messageTime,
        "unreadCount": unreadCount,
        "draftText": draftText?.toJson(),
        "isPinned": isPinned,
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
