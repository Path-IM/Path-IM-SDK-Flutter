import 'package:isar/isar.dart';
import 'package:path_im_sdk_flutter/src/model/message_model.dart';

class OfflinePushConverter extends TypeConverter<OfflinePushModel?, String> {
  const OfflinePushConverter();

  @override
  OfflinePushModel? fromIsar(String object) {
    return object.isNotEmpty ? OfflinePushModel.fromJson(object) : null;
  }

  @override
  String toIsar(OfflinePushModel? object) {
    return object?.toJson() ?? "";
  }
}

class MsgOptionsConverter extends TypeConverter<MsgOptionsModel, String> {
  const MsgOptionsConverter();

  @override
  MsgOptionsModel fromIsar(String object) {
    return MsgOptionsModel.fromJson(object);
  }

  @override
  String toIsar(MsgOptionsModel object) {
    return object.toJson();
  }
}
