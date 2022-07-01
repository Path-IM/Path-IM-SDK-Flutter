import 'package:isar/isar.dart';
import 'package:path_im_sdk_flutter/src/model/conversation_model.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class MessageConverter extends TypeConverter<MessageModel?, String> {
  const MessageConverter();

  @override
  MessageModel? fromIsar(String object) {
    return object.isNotEmpty ? MessageModel.fromJson(object) : null;
  }

  @override
  String toIsar(MessageModel? object) {
    return object?.toJson() ?? "";
  }
}

class DraftTextConverter extends TypeConverter<DraftTextModel?, String> {
  const DraftTextConverter();

  @override
  DraftTextModel? fromIsar(String object) {
    return object.isNotEmpty ? DraftTextModel.fromJson(object) : null;
  }

  @override
  String toIsar(DraftTextModel? object) {
    return object?.toJson() ?? "";
  }
}
