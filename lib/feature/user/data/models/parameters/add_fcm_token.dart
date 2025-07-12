import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../domain/entities/parameters/add_fcm_token.dart';
import '../../../domain/enums/field.dart';

final class AddFcmTokenParametersDTO extends AddFcmTokenParameters {
  const AddFcmTokenParametersDTO({
    required super.platform,
    required super.token,
  });

  AddFcmTokenParametersDTO copyWith({
    TargetPlatform? platform,
    String? token,
  }) {
    return AddFcmTokenParametersDTO(
      platform: platform ?? this.platform,
      token: token ?? this.token,
    );
  }

  factory AddFcmTokenParametersDTO.fromJson(String json) {
    return AddFcmTokenParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory AddFcmTokenParametersDTO.fromMap(Map<String, dynamic> json) {
    return AddFcmTokenParametersDTO(
      platform: TargetPlatform.values.firstWhere(
        (element) => element.name == json[UserField.platform.value] as String,
      ),
      token: json[UserField.token.value] as String,
    );
  }

  factory AddFcmTokenParametersDTO.fromEntity(AddFcmTokenParameters entity) {
    return AddFcmTokenParametersDTO(
      platform: entity.platform,
      token: entity.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.platform.value: platform== TargetPlatform.android?1:2,
      UserField.token.value: token,
    };
  }
}
