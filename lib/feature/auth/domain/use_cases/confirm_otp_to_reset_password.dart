import '../entities/otp_confirmation_parameters.dart';
import '../repositories/authentication.dart';

final class ConfirmOtpToResetPassword {
  const ConfirmOtpToResetPassword({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<void> call({
    required OtpConfirmationParameters parameters,
  }) async {
    return _repository.confirmOtpToResetPassword(parameters: parameters);
  }
}
