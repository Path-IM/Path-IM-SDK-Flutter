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

  static ConversationModel fromJsonMap(Map<String, dynamic> json) =>
      ConversationModel(
        conversationID: json["conversationID"],
        message: MessageModel.fromJsonMap(json["message"]),
        messageTime: json["messageTime"],
        unreadCount: json["unreadCount"],
        draftText: DraftText.fromJsonMap(json["draftText"]),
        isPinned: json["isPinned"],
      );

  Map<String, dynamic> toJsonMap() => {
        "conversationID": conversationID,
        "message": message?.toJsonMap(),
        "messageTime": messageTime,
        "unreadCount": unreadCount,
        "draftText": draftText?.toJsonMap(),
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

  static DraftText fromJsonMap(Map<String, dynamic> json) => DraftText(
        text: json["text"],
        time: json["time"],
      );

  Map<String, dynamic> toJsonMap() {
    return {
      "text": text,
      "time": time,
    };
  }
}
