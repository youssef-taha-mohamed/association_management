import 'package:equatable/equatable.dart';
import '../../../../shared/enum/user_role.dart';

base class LoginCredentials extends Equatable {
  const LoginCredentials({
    required this.email,
    required this.password,
    required this.role,
  });

  final String email;
  final String password;
  final UserRole? role;

  @override
  List<Object> get props {
    return <Object>[
      email,
      password,
    ];
  }
}
