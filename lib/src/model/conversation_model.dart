import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:path_im_sdk_flutter/src/model/converter/conversation_converter.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

part 'conversation_model.g.dart';

@Collection()
class ConversationModel {
  @Id()
  int? id;

  @Index()
  String conversationID;
  int conversationType;
  String receiveID;
  @MessageConverter()
  MessageModel? message;
  int? messageTime;
  int? unreadCount;
  @DraftTextConverter()
  DraftTextModel? draftText;
  bool? isPinned;

  ConversationModel({
    required this.conversationID,
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
        conversationID: map["conversationID"],
        conversationType: map["conversationType"],
        receiveID: map["receiveID"],
        message: map["message"].isNotEmpty
            ? MessageModel.fromJson(map["message"])
            : null,
        messageTime: map["messageTime"],
        unreadCount: map["unreadCount"],
        draftText: map["draftText"].isNotEmpty
            ? DraftTextModel.fromJson(map["draftText"])
            : null,
        isPinned: map["isPinned"] == 1,
      );

  Map<String, dynamic> toJsonMap() => {
        "conversationID": conversationID,
        "conversationType": conversationType,
        "receiveID": receiveID,
        "message": message?.toJson() ?? "",
        "messageTime": messageTime ?? 0,
        "unreadCount": unreadCount ?? 0,
        "draftText": draftText?.toJson() ?? "",
        "isPinned": isPinned == true ? 1 : 0,
      };
}

class DraftTextModel {
  String text;
  int time;

  DraftTextModel({
    required this.text,
    required this.time,
  });

  static DraftTextModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return DraftTextModel(
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
