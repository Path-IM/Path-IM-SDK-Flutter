import 'package:isar/isar.dart';

part 'config_model.g.dart';

@Collection()
class ConfigModel {
  @Id()
  int? id;

  @Index()
  String key;
  int value;

  ConfigModel({
    required this.key,
    required this.value,
  });
}
