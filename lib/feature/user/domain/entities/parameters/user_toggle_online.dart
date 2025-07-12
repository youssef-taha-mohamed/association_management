import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

base class UserToggleOnlineParameters extends Equatable {
  const UserToggleOnlineParameters({
    required this.isOnline,
    required this.platform,
  });

  final bool isOnline;
  final TargetPlatform platform;

  @override
  List<Object> get props {
    return <Object>[
      isOnline,
      platform,
    ];
  }
}
