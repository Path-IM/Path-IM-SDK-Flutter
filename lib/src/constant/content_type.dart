/// 内容类型
class ContentType {
  static const int text = 101; // 文本消息
  static const int picture = 102; // 图片消息
  static const int voice = 103; // 语音消息
  static const int video = 104; // 视频消息
  static const int file = 105; // 文件消息

  static const int typing = 1001; // 正在输入
  static const int read = 1002; // 读取消息
  static const int revoke = 1003; // 撤回消息
}
