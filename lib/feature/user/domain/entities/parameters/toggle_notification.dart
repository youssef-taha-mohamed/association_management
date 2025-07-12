import 'package:equatable/equatable.dart';

base class ToggleNotificationParameters extends Equatable {
  const ToggleNotificationParameters({
    required this.notificationEnabled,
    required this.userId,
  });

  final bool notificationEnabled;
  final int userId;

  @override
  List<Object> get props {
    return <Object>[
      notificationEnabled,
      userId,
    ];
  }
}
