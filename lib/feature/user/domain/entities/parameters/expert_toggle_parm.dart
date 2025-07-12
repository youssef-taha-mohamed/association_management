import 'package:equatable/equatable.dart';

base class ExpertToggleParameters extends Equatable {
  const ExpertToggleParameters({
    required this.enabled,
    required this.userId,
  });

  final bool enabled;
  final int userId;

  @override
  List<Object> get props {
    return <Object>[
      enabled,
      userId,
    ];
  }
}
