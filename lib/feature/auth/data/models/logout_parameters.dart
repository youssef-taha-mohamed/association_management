import 'dart:convert';

import '../../domain/entities/logout_params.dart';
import '../../domain/enums/field.dart';

final class LogoutParametersDTO extends LogoutParameters {
  const LogoutParametersDTO({
    required super.fcmToken,
  });

  LogoutParametersDTO copyWith({
    required String? fcmToken,
  }) {
    return LogoutParametersDTO(
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  factory LogoutParametersDTO.fromJson(String json) {
    return LogoutParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory LogoutParametersDTO.fromMap(Map<String, dynamic> json) {
    return LogoutParametersDTO(
      fcmToken: json[AuthField.fcmToken.value] as String,
    );
  }

  factory LogoutParametersDTO.fromEntity(
    LogoutParameters entity,
  ) {
    return LogoutParametersDTO(
      fcmToken: entity.fcmToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.fcmToken.value: fcmToken,
    };
  }
}
