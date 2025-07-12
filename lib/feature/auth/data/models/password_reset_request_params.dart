import 'dart:convert';
import '../../domain/entities/password_reset_request_params.dart';
import '../../domain/enums/field.dart';

final class PasswordResetRequestParametersDTO
    extends PasswordResetRequestParameters {
  const PasswordResetRequestParametersDTO(
      {super.email, super.phone, super.countryId});

  PasswordResetRequestParametersDTO copyWith({
    String? email,
    String? phone,
    int? countryId,
  }) {
    return PasswordResetRequestParametersDTO(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryId: countryId ?? this.countryId,
    );
  }

  factory PasswordResetRequestParametersDTO.fromJson(String json) {
    return PasswordResetRequestParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory PasswordResetRequestParametersDTO.fromMap(Map<String, dynamic> json) {
    return PasswordResetRequestParametersDTO(
      email: json[AuthField.email.value] as String?,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory PasswordResetRequestParametersDTO.fromEntity(
    PasswordResetRequestParameters entity,
  ) {
    return PasswordResetRequestParametersDTO(
      email: entity.email,
      phone: entity.phone,
      countryId: entity.countryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.phone.value: phone,
      AuthField.countryId.value: countryId,
    }..removeWhere((key, value) => value==null,);
  }
}
