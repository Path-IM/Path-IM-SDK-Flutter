/// 内容类型
class ContentType {
  static const int typing = 101; // 正在输入
  static const int read = 102; // 读取消息
  static const int revoke = 103; // 撤回消息

  static const int text = 1001; // 文本消息
  static const int picture = 1002; // 图片消息
  static const int voice = 1003; // 语音消息
  static const int video = 1004; // 视频消息
  static const int file = 1005; // 文件消息
}
