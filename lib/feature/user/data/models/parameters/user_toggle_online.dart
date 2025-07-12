import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../domain/entities/parameters/user_toggle_online.dart';
import '../../../domain/enums/field.dart';

final class UserToggleOnlineParametersDTO extends UserToggleOnlineParameters {
  const UserToggleOnlineParametersDTO({
    required super.isOnline,
    required super.platform,
  });

  UserToggleOnlineParametersDTO copyWith({
    bool? isOnline,
    TargetPlatform? platform,
  }) {
    return UserToggleOnlineParametersDTO(
      isOnline: isOnline ?? this.isOnline,
      platform: platform ?? this.platform,
    );
  }

  factory UserToggleOnlineParametersDTO.fromJson(String json) {
    return UserToggleOnlineParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory UserToggleOnlineParametersDTO.fromMap(Map<String, dynamic> json) {
    return UserToggleOnlineParametersDTO(
      isOnline: json[UserField.isOnline.value] as bool,
      platform: TargetPlatform.values.firstWhere(
        (e) => e.name == json[UserField.deviceType.value] as String,
      ),
    );
  }

  factory UserToggleOnlineParametersDTO.fromEntity(
    UserToggleOnlineParameters entity,
  ) {
    return UserToggleOnlineParametersDTO(
      isOnline: entity.isOnline,
      platform: entity.platform,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.isOnline.value: isOnline,
      UserField.deviceType.value: platform ==TargetPlatform.iOS ? 'ios' : 'android',
    };
  }
}
