abstract interface class AuthenticationEndpoints {
  const AuthenticationEndpoints();

  Uri get confirmOtpToResetPassword;

  Uri get login;

  Uri get loginWithSocialMedia;

  Uri get logout;

  Uri get register;

  Uri get resetPasswordByOtp;

  Uri get sendOtpToResetPassword;
}
