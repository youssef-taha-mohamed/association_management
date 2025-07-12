import '../../feature/auth/domain/entities/login_credentials.dart';
import '../../feature/auth/domain/entities/register_credentials.dart';
import '../../feature/auth/domain/entities/social_media_credentials.dart';
import '../../feature/user/domain/entities/parameters/verify_account.dart';
import '../../feature/user/domain/entities/user.dart';
import 'delegates/base/authentication.dart';

final class AuthenticationProvider implements AuthenticationDelegate {
  AuthenticationProvider._();
  bool isVerifing = false;
  static AuthenticationProvider get instance {
    if (!_delegateHasInit) {
      throw Exception(
        '''
\n
          AuthenticationProvider has not been initialized.
          You Must called "AuthenticationProvider.injectDelegate" first.
        ''',
      );
    }
    return AuthenticationProvider._();
  }

  static bool get isAuth => _delegate.currentUser != null;
  static late AuthenticationDelegate _delegate;
  static bool _delegateHasInit = false;

  static void injectDelegate({required AuthenticationDelegate delegate}) {
    if (delegate is AuthenticationProvider) {
      throw Exception('Cannot inject AuthenticationProvider as delegate');
    }

    _delegate = delegate;
    _delegateHasInit = true;
  }

  @override
  Stream<User?> authStateChanges() {
    return _delegate.authStateChanges();
  }

  @override
  User? get currentUser {
    return _delegate.currentUser;
  }

  @override
  Future<void> init() {
    return _delegate.init();
  }

  @override
  void dispose() {
    return _delegate.dispose();
  }

  @override
  Future<User> login({
    required LoginCredentials credentials,
  }) {
    return _delegate.login(credentials: credentials);
  }

  @override
  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  }) {
    return _delegate.loginWithSocialMedia(credentials: credentials);
  }

  @override
  Future<void> logout() {
    return _delegate.logout();
  }

  @override
  Future<User> register({
    required RegisterCredentials credentials,
  }) {
    return _delegate.register(credentials: credentials);
  }

  @override
  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  }) {
    return _delegate.verifyAccount(parameters: parameters);
  }

  @override
  Stream<User?> userChanges() {
    return _delegate.userChanges();
  }

  @override
  Future<void> verifyToken() {
    isVerifing = true;
    return _delegate.verifyToken()..then((value) => isVerifing = false);
  }

  @override
  Future<void> refreshUser() {
    return _delegate.refreshUser();
  }

  @override
  Future<void> addFcmToken({required String token}) {
    return _delegate.addFcmToken(token: token);
  }

  @override
  void sinkUser(User user) {
    return _delegate.sinkUser(user);
  }

  @override
  Future<void> logoutLocally() {
    return _delegate.logoutLocally();
  }
}
