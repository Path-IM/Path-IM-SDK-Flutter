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
  int messageTime;
  @Index()
  int unreadCount;
  @DraftTextConverter()
  DraftTextModel? draftText;
  bool isPinned;

  ConversationModel({
    required this.conversationID,
    required this.conversationType,
    required this.receiveID,
    this.message,
    this.messageTime = 0,
    this.unreadCount = 0,
    this.draftText,
    this.isPinned = false,
  });
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
