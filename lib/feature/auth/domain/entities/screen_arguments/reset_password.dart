import 'package:equatable/equatable.dart';

final class ResetPasswordViewParameters extends Equatable {
  const ResetPasswordViewParameters({
     this.phone,
     this.email,
    required this.otp,
  });

  final String? phone;
  final String? email;
  final String otp;

  @override
  List<Object> get props {
    return <Object>[
      phone??'',
      email??'',
      otp,
    ];
  }
}
