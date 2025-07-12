import 'dart:convert';
import 'dart:io';
import '../../domain/entities/otp_confirmation_parameters.dart';
import '../../domain/enums/field.dart';

final class OtpConfirmationParametersDTO extends OtpConfirmationParameters {
  const OtpConfirmationParametersDTO({
    required super.otp,
    super.phone,
    super.email,
  });

  OtpConfirmationParametersDTO copyWith({
   String? email,
    String? otp,
   String? phone,
  }) {
    return OtpConfirmationParametersDTO(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      phone: phone ?? this.phone,
    );
  }

  factory OtpConfirmationParametersDTO.fromJson(String json) {
    return OtpConfirmationParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory OtpConfirmationParametersDTO.fromMap(Map<String, dynamic> json) {
    return OtpConfirmationParametersDTO(
      email: json[AuthField.email.value] as String?,
      otp: json[AuthField.otp.value] as String,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory OtpConfirmationParametersDTO.fromEntity(
    OtpConfirmationParameters entity,
  ) {
    return OtpConfirmationParametersDTO(
      email: entity.email,
      otp: entity.otp,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.otp.value: otp,
      AuthField.phone.value: phone,

      'device_type': Platform.isIOS ? 'ios' : 'android',
    }..removeWhere( (key, value) => value == null);
  }
}
