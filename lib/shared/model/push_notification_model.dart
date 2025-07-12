import 'package:equatable/equatable.dart';

import '../enum/notification_types.dart';

class PushNotiModel extends Equatable {
  final String? entityId;
  final String? notificationId;
  final NotificationTypes? notificationType;

  const PushNotiModel({
    this.entityId,
    this.notificationId,
    this.notificationType,
  });

  PushNotiModel copyWith({
    String? entityId,
    String? notificationId,
    NotificationTypes? notificationType,
  }) {
    return PushNotiModel(
      entityId: entityId ?? this.entityId,
      notificationId: notificationId ?? this.notificationId,
      notificationType: notificationType ?? this.notificationType,
    );
  }

  factory PushNotiModel.fromJson(Map<String, dynamic> json) {
    return PushNotiModel(
      entityId: json['EntityId'],
      notificationId: json['NotificationId'],
      notificationType: NotificationTypes.fromId(json['NotificationType'] != null ? int.tryParse(json['NotificationType']) : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EntityId': entityId,
      'NotificationId': notificationId,
      'NotificationType': notificationType,
    };
  }

  @override
  List<Object?> get props {
    return [
      entityId,
      notificationId,
      notificationType,
    ];
  }
}
