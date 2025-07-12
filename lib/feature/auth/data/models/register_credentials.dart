import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import '../../../../shared/enum/gender.dart';
import '../../domain/entities/register_credentials.dart';
import '../../domain/enums/field.dart';

final class RegisterCredentialsDTO extends RegisterCredentials {
  const RegisterCredentialsDTO({
    required super.countryId,
    required super.email,
    required super.userName,
    required super.firstName,
    required super.lastName,
    required super.password,
    required super.passwordConfirmation,
    super.bio,
    super.birthDay,
    super.gender,
    super.phone,
  });

  RegisterCredentialsDTO copyWith({
    String? bio,
    DateTime? birthDay,
    int? countryId,
    String? email,
    String? userName,
    String? firstName,
    Gender? gender,
    String? lastName,
    String? password,
    String? passwordConfirmation,
    String? phone,
  }) {
    return RegisterCredentialsDTO(
      bio: bio ?? this.bio,
      birthDay: birthDay ?? this.birthDay,
      countryId: countryId ?? this.countryId,
      email: email ?? this.email,
      userName: email ?? this.userName,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      phone: phone ?? this.phone,
    );
  }

  factory RegisterCredentialsDTO.fromJson(String json) {
    return RegisterCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return jsonEncode(toMap(dateFormat: dateFormat));
  }

  factory RegisterCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return RegisterCredentialsDTO(
      bio: json[AuthField.bio.value] as String?,
      birthDay: DateTime.tryParse(
        json[AuthField.birthDay.value] as String? ?? '',
      ),
      countryId: json[AuthField.countryId.value] as int,
      email: json[AuthField.email.value] as String,
      userName: json[AuthField.userName.value] as String,
      firstName: json[AuthField.firstName.value] as String,
      gender: Gender.tryParseById(json[AuthField.gender.value] as int?),
      lastName: json[AuthField.lastName.value] as String,
      password: json[AuthField.password.value] as String,
      passwordConfirmation:
          json[AuthField.passwordConfirmation.value] as String,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory RegisterCredentialsDTO.fromEntity(
    RegisterCredentials entity,
  ) {
    return RegisterCredentialsDTO(
      bio: entity.bio,
      birthDay: entity.birthDay,
      countryId: entity.countryId,
      email: entity.email,
      userName: entity.userName,
      firstName: entity.firstName,
      gender: entity.gender,
      lastName: entity.lastName,
      password: entity.password,
      passwordConfirmation: entity.passwordConfirmation,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return <String, dynamic>{
      AuthField.bio.value: bio,
      AuthField.birthDay.value: birthDay == null
          ? null
          : DateFormat(dateFormat).format(
              birthDay!,
            ),
      AuthField.countryId.value: countryId,
      AuthField.email.value: email,
      AuthField.userName.value: userName,
      AuthField.firstName.value: firstName,
      AuthField.gender.value: gender?.id,
      AuthField.lastName.value: lastName,
      AuthField.password.value: password,
      AuthField.passwordConfirmation.value: passwordConfirmation,
      AuthField.phone.value: phone,

      'device_type': Platform.isIOS ? 'ios' : 'android',
    };
  }
}
