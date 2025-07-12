import 'package:equatable/equatable.dart';

base class ResetPasswordParameters extends Equatable {
  const ResetPasswordParameters({
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
    this.email,
    this.phone,
  });

  final String? email;
  final String otp;
  final String password;
  final String passwordConfirmation;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      email,
      otp,
      password,
      passwordConfirmation,
      phone,
    ];
  }
}
