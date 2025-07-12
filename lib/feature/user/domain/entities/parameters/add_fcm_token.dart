import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

base class AddFcmTokenParameters extends Equatable {
  const AddFcmTokenParameters({
    required this.platform,
    required this.token,
  });

  final TargetPlatform platform;
  final String token;

  @override
  List<Object> get props {
    return <Object>[
      platform,
      token,
    ];
  }
}
