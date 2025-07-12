import '../base/authentication.dart';

final class AuthenticationEndpointsV1 implements AuthenticationEndpoints {
  const AuthenticationEndpointsV1();

  @override
  Uri get sendOtpToResetPassword {
    return Uri.parse('api/v1/forget-password');
  }

  @override
  Uri get login {
    return Uri.parse('api/v1/login');
  }

  @override
  Uri get loginWithSocialMedia {
    return Uri.parse('api/v1/social/auth');
  }

  @override
  Uri get logout {
    return Uri.parse('api/v1/logout');
  }

  @override
  Uri get register {
    return Uri.parse('api/v1/register');
  }

  @override
  Uri get confirmOtpToResetPassword {
    return Uri.parse('api/v1/check-reset-password-otp');
  }

  @override
  Uri get resetPasswordByOtp {
    return Uri.parse('api/v1/reset-password');
  }
}
