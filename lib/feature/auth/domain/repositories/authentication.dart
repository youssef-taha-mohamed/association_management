import '../../../user/domain/entities/user.dart';
import '../entities/login_credentials.dart';
import '../entities/logout_params.dart';
import '../entities/otp_confirmation_parameters.dart';
import '../entities/password_reset_request_params.dart';
import '../entities/register_credentials.dart';
import '../entities/reset_password_parameters.dart';
import '../entities/social_media_credentials.dart';

abstract interface class AuthenticationBaseRepository {
  const AuthenticationBaseRepository();

  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  });

  Future<User> login({
    required LoginCredentials credentials,
  });

  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  Future<void> logout({
    required LogoutParameters parameters,
  });

  Future<String> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  });

  Future<User> register({
    required RegisterCredentials credentials,
  });

  Future<User> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  });
}
