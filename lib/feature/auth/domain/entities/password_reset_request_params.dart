import 'package:equatable/equatable.dart';

base class PasswordResetRequestParameters extends Equatable {
  const PasswordResetRequestParameters({
    this.email,
    this.phone,
    this.countryId,
  }) : assert(
          email != null || phone != null,
          'Either email or phone must be provided',
        );

  final String? email;
  final int? countryId;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      email,
      phone,
    ];
  }
}
