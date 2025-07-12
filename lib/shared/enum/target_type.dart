enum TargetType {
  pushMessage(id: 1, value: 'PUSHMESSAGE'),
  blog(id: 2, value: 'BLOG'),
  dream(id: 3, value: 'DREAM'),
  package(id: 4, value: 'PACKAGE'),
  expert(id: 5, value: 'EXPERT'),
  contactUs(id: 6, value: 'CONTACTUS'),
  comment(id: 7, value: 'COMMENT'),
  dreamComment(id: 8, value: 'DREAMCOMMENT'),
  payment(id: 9, value: 'PAYMENT'),
  dreamReport(id: 10, value: 'DREAMREPORT'),
  liveChat(id: 11, value: 'LIVECHAT'),
  liveChatMessage(id: 12, value: 'LIVECHATMESSAGE');

  const TargetType({
    required this.id,
    required this.value,
  });

  final int id;
  final String value;

  static TargetType fromId(int id) {
    return values.firstWhere((element) => element.id == id);
  }

  static TargetType fromValue(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
