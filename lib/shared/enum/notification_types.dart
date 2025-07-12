enum NotificationTypes {
  crowd(id: 0, name: 'Crowd'),
  scan(id: 1, name: 'Scan'),
  verifyAccount(id: 2, name: 'VerifyAccount'),
  package(id: 3, name: 'Package'),
  target(id: 4, name: 'Target'),
  crowdReview(id: 5, name: 'CrowdReview'),
  businessReview(id: 6, name: 'BusinessReview'),
  notification(name: 'notification');

  const NotificationTypes({
    this.id,
    required this.name,
  });

  final int? id;
  final String name;

  static NotificationTypes fromId(int? value) {
    return value == null ? NotificationTypes.notification : values.firstWhere((element) => element.id == value);
  }
}