import 'package:equatable/equatable.dart';

import '../../../../shared/enum/gender.dart';

base class RegisterCredentials extends Equatable {
  const RegisterCredentials({
    required this.countryId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.passwordConfirmation,
    required this.userName,
    this.bio,
    this.birthDay,
    this.gender,
    this.phone,
  }) : assert(password == passwordConfirmation, 'Passwords must match.');

  final String? bio;
  final DateTime? birthDay;
  final int countryId;
  final String email;
  final String userName;
  final String firstName;
  final Gender? gender;
  final String lastName;
  final String password;
  final String passwordConfirmation;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      bio,
      birthDay,
      countryId,
      email,
      firstName,
      gender,
      lastName,
      password,
      passwordConfirmation,
      phone,
      userName,
    ];
  }
}
