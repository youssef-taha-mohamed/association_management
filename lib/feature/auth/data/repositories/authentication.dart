import '../../../user/data/models/user.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/login_credentials.dart';
import '../../domain/entities/logout_params.dart';
import '../../domain/entities/otp_confirmation_parameters.dart';
import '../../domain/entities/password_reset_request_params.dart';
import '../../domain/entities/register_credentials.dart';
import '../../domain/entities/reset_password_parameters.dart';
import '../../domain/entities/social_media_credentials.dart';
import '../../domain/repositories/authentication.dart';
import '../data_sources/base/data_source.dart';

final class AuthenticationRepository implements AuthenticationBaseRepository {
  const AuthenticationRepository({
    required AuthenticationDataSource dataSource,
  }) : _dataSource = dataSource;

  final AuthenticationDataSource _dataSource;

  @override
  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  }) {
    return _dataSource.confirmOtpToResetPassword(parameters: parameters);
  }

  @override
  Future<User> login({
    required LoginCredentials credentials,
  }) async {
    final json = await _dataSource.login(credentials: credentials);

    return UserDTO.fromMap(json);
  }

  @override
  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  }) async {
    final json = await _dataSource.loginWithSocialMedia(
      credentials: credentials,
    );

    return UserDTO.fromMap(json);
  }

  @override
  Future<void> logout({
    required LogoutParameters parameters,
  }) {
    return _dataSource.logout(parameters: parameters);
  }

  @override
  Future<User> register({
    required RegisterCredentials credentials,
  }) async {
    final json = await _dataSource.register(credentials: credentials);

    return UserDTO.fromMap(json);
  }

  @override
  Future<String> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  }) {
    return _dataSource.sendOtpToResetPassword(parameters: parameters);
  }

  @override
  Future<User> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  }) async {
    final json = await _dataSource.resetPasswordByOtp(parameters: parameters);

    return UserDTO.fromMap(json);
  }
}
