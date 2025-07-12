import '../../../domain/entities/login_credentials.dart';
import '../../../domain/entities/logout_params.dart';
import '../../../domain/entities/otp_confirmation_parameters.dart';
import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/entities/register_credentials.dart';
import '../../../domain/entities/reset_password_parameters.dart';
import '../../../domain/entities/social_media_credentials.dart';

abstract interface class AuthenticationDataSource {
  const AuthenticationDataSource();

  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  });

  Future<Map<String, dynamic>> login({
    required LoginCredentials credentials,
  });

  Future<Map<String, dynamic>> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  Future<void> logout({
    required LogoutParameters parameters,
  });

  Future<Map<String, dynamic>> register({
    required RegisterCredentials credentials,
  });

  Future<String> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  });

  Future<Map<String, dynamic>> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  });
}
