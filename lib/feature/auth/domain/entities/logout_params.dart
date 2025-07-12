import 'package:equatable/equatable.dart';

base class LogoutParameters extends Equatable {
  const LogoutParameters({
    required this.fcmToken,
  });

  final String fcmToken;

  @override
  List<Object> get props {
    return <Object>[
      fcmToken,
    ];
  }
}
