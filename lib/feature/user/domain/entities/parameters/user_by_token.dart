import 'package:equatable/equatable.dart';

final class UserByTokenParameters extends Equatable {
  const UserByTokenParameters({
    required this.token,
  });

  final String token;

  @override
  List<Object> get props {
    return <Object>[
      token,
    ];
  }
}
