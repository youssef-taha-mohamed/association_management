import 'dart:convert';
import 'dart:io';
import '../../../../shared/enum/user_role.dart';
import '../../domain/entities/login_credentials.dart';
import '../../domain/enums/field.dart';

final class LoginCredentialsDTO extends LoginCredentials {
  const LoginCredentialsDTO({
    required super.email,
    required super.password,
    required super.role,
  });

  LoginCredentialsDTO copyWith({
    String? email,
    String? password,
    UserRole? role,
  }) {
    return LoginCredentialsDTO(
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role);
  }

  factory LoginCredentialsDTO.fromJson(String json) {
    return LoginCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory LoginCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return LoginCredentialsDTO(
      email: json[AuthField.email.value] as String,
      password: json[AuthField.password.value] as String,
      role: UserRole.fromId(json[AuthField.role.value] as int? ??0,),
    );
  }

  factory LoginCredentialsDTO.fromEntity(LoginCredentials entity) {
    return LoginCredentialsDTO(
      email: entity.email,
      password: entity.password,
      role: entity.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.password.value: password,
      AuthField.role.value: role?.name,
      'device_type': Platform.isIOS ? 'ios' : 'android',
      //  "role":"user"
    };
  }
}
