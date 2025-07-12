import '../../../user/domain/entities/user.dart';
import '../entities/social_media_credentials.dart';
import '../repositories/authentication.dart';

final class LoginWithSocialMedia {
  const LoginWithSocialMedia({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<User> call({
    required SocialMediaCredentials credentials,
  }) async {
    return _repository.loginWithSocialMedia(credentials: credentials);
  }
}
