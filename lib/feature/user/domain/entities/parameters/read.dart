import 'package:equatable/equatable.dart';

final class ReadUserParameters extends Equatable {
  const ReadUserParameters({
    required this.userId,
  });

  final int userId;

  @override
  List<Object> get props {
    return <Object>[
      userId,
    ];
  }
}
