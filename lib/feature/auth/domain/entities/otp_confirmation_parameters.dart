import 'package:equatable/equatable.dart';

base class OtpConfirmationParameters extends Equatable {
  const OtpConfirmationParameters({
    required this.otp,
    this.email,
    this.phone,
  }) : assert(
          email != null || phone != null,
          'Either email or phone must be provided',
        );

  final String? email;
  final String otp;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      email,
      otp,
      phone,
    ];
  }
}
