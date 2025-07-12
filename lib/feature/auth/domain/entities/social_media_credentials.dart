import 'package:equatable/equatable.dart';

import '../enums/social_media.dart';

base class SocialMediaCredentials extends Equatable {
  const SocialMediaCredentials({
    required this.token,
    required this.socialMedia,
  });

  final String token;
  final SocialMediaAuthentication socialMedia;

  @override
  List<Object> get props {
    return <Object>[
      token,
      socialMedia,
    ];
  }
}
