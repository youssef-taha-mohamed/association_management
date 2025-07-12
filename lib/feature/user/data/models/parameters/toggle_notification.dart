import 'dart:convert';

import '../../../domain/entities/parameters/toggle_notification.dart';
import '../../../domain/enums/field.dart';

final class ToggleNotificationParametersDto
    extends ToggleNotificationParameters {
  const ToggleNotificationParametersDto({
    required super.notificationEnabled,
    required super.userId,
  });

  ToggleNotificationParametersDto copyWith({
    bool? notificationEnabled,
    int? userId,
  }) {
    return ToggleNotificationParametersDto(
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      userId: userId ?? this.userId,
    );
  }

  factory ToggleNotificationParametersDto.fromJson(String json) {
    return ToggleNotificationParametersDto.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory ToggleNotificationParametersDto.fromMap(Map<String, dynamic> json) {
    return ToggleNotificationParametersDto(
      notificationEnabled: json[UserField.notificationEnabled.value] as bool,
      userId: json[UserField.userId.value] as int,
    );
  }

  factory ToggleNotificationParametersDto.fromEntity(
    ToggleNotificationParameters entity,
  ) {
    return ToggleNotificationParametersDto(
      notificationEnabled: entity.notificationEnabled,
      userId: entity.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.notificationEnabled.value: notificationEnabled?1:0,
      UserField.userId.value: userId,
    };
  }
}
