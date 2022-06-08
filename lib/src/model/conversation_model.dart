import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class ConversationModel {
  String conversationID;
  MessageModel? message;
  int? messageTime;
  int? unreadCount;
  DraftTextModel? draftText;
  bool? isPinned;

  ConversationModel({
    required this.conversationID,
    this.message,
    this.messageTime,
    this.unreadCount,
    this.draftText,
    this.isPinned,
  });

  static ConversationModel fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        conversationID: json["conversationID"],
        message: MessageModel.fromJson(json["message"]),
        messageTime: json["messageTime"],
        unreadCount: json["unreadCount"],
        draftText: DraftTextModel.fromJson(json["draftText"]),
        isPinned: json["isPinned"],
      );

  Map<String, dynamic> toJson() => {
        "conversationID": conversationID,
        "message": message?.toJson(),
        "messageTime": messageTime,
        "unreadCount": unreadCount,
        "draftText": draftText?.toJson(),
        "isPinned": isPinned,
      };
}

class DraftTextModel {
  String text;
  int time;

  DraftTextModel({
    required this.text,
    required this.time,
  });

  static DraftTextModel fromJson(Map<String, dynamic> json) => DraftTextModel(
        text: json["text"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "time": time,
    };
  }
}
