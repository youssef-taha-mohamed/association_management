import 'package:equatable/equatable.dart';

base class VerifyAccountParameters extends Equatable {
  const VerifyAccountParameters({
    required this.otp,
  });

  final String otp;

  @override
  List<Object> get props {
    return <Object>[
      otp,
    ];
  }
}
