import 'dart:convert';
import '../../domain/entities/details.dart';
import '../../domain/entities/user.dart';
import '../../domain/enums/field.dart';
import 'user_details.dart';

final class UserDTO extends User {
  const UserDTO({
    required super.accessToken,
    required super.details,
  });

  UserDTO copyWith({
    String? accessToken,
    UserDetails? details,
  }) {
    return UserDTO(
      accessToken: accessToken ?? this.accessToken,
      details: details ?? this.details,
    );
  }

  factory UserDTO.fromJson(String json) {
    return UserDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory UserDTO.fromMap(Map<String, dynamic> json) {
    return UserDTO(
      accessToken: json[UserField.accessToken.value] as String,
      details: UserDetailsDTO.fromMap(
        Map<String, dynamic>.from(json[UserField.userDetails.value] as Map),
      ),
    );
  }

  factory UserDTO.fromEntity(User entity) {
    return UserDTO(
      accessToken: entity.accessToken,
      details: entity.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.accessToken.value: accessToken,
      UserField.userDetails.value: UserDetailsDTO.fromEntity(details).toMap(),
    };
  }
}
