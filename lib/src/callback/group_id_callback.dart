/// 返回用户群聊IDList
class GroupIDCallback {
  final Future<List<String>> Function() onGroupIDList; // 返回用户群聊IDList

  GroupIDCallback({
    required this.onGroupIDList,
  });

  Future<List<String>> groupIDList() {
    return onGroupIDList();
  }
}
