import 'dart:convert';
import '../../domain/entities/reset_password_parameters.dart';
import '../../domain/enums/field.dart';

final class ResetPasswordParametersDTO extends ResetPasswordParameters {
  const ResetPasswordParametersDTO({
    required super.otp,
    required super.password,
    required super.passwordConfirmation,
    super.phone,
    super.email,
  });

  ResetPasswordParametersDTO copyWith({
    String? email,
    String? otp,
    String? password,
    String? passwordConfirmation,
    String? phone,
  }) {
    return ResetPasswordParametersDTO(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      phone: phone ?? this.phone,
    );
  }

  factory ResetPasswordParametersDTO.fromJson(String json) {
    return ResetPasswordParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory ResetPasswordParametersDTO.fromMap(Map<String, dynamic> json) {
    return ResetPasswordParametersDTO(
      email: json[AuthField.email.value] as String?,
      otp: json[AuthField.otp.value] as String,
      password: json[AuthField.password.value] as String,
      passwordConfirmation:
          json[AuthField.passwordConfirmation.value] as String,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory ResetPasswordParametersDTO.fromEntity(
    ResetPasswordParameters entity,
  ) {
    return ResetPasswordParametersDTO(
      email: entity.email,
      otp: entity.otp,
      password: entity.password,
      passwordConfirmation: entity.passwordConfirmation,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.otp.value: otp,
      AuthField.password.value: password,
      AuthField.passwordConfirmation.value: passwordConfirmation,
      AuthField.phone.value: phone,
    };
  }
}
