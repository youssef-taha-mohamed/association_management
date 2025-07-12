import 'dart:convert';

import '../../../domain/entities/parameters/verify_account.dart';
import '../../../domain/enums/field.dart';

final class VerifyAccountParametersDTO extends VerifyAccountParameters {
  const VerifyAccountParametersDTO({
    required super.otp,
  });

  VerifyAccountParametersDTO copyWith({String? otp}) {
    return VerifyAccountParametersDTO(
      otp: otp ?? this.otp,
    );
  }

  factory VerifyAccountParametersDTO.fromJson(String json) {
    return VerifyAccountParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory VerifyAccountParametersDTO.fromMap(Map<String, dynamic> json) {
    return VerifyAccountParametersDTO(
      otp: json[UserField.otp.value] as String,
    );
  }

  factory VerifyAccountParametersDTO.fromEntity(
    VerifyAccountParameters entity,
  ) {
    return VerifyAccountParametersDTO(
      otp: entity.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.otp.value: otp,
    };
  }
}
