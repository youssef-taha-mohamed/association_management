import '../../../../feature/auth/domain/entities/login_credentials.dart';
import '../../../../feature/auth/domain/entities/register_credentials.dart';
import '../../../../feature/auth/domain/entities/social_media_credentials.dart';
import '../../../../feature/user/domain/entities/parameters/verify_account.dart';
import '../../../../feature/user/domain/entities/user.dart';

abstract interface class AuthenticationDelegate {
  const AuthenticationDelegate();

  User? get currentUser;

  Future<void> init();

  void dispose();

  Future<User> login({
    required LoginCredentials credentials,
  });

  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  void sinkUser(User user);

  Future<User> register({
    required RegisterCredentials credentials,
  });

  Future<void> logout();

  Future<void> logoutLocally();

  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  });

  Stream<User?> authStateChanges();

  Stream<User?> userChanges();

  Future<void> verifyToken();

  Future<void> refreshUser();

  Future<void> addFcmToken({
    required String token,
  });
}
