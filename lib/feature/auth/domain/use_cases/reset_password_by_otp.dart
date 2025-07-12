import '../../../user/domain/entities/user.dart';
import '../entities/reset_password_parameters.dart';
import '../repositories/authentication.dart';

final class ResetPasswordByOtp {
  const ResetPasswordByOtp({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<User> call({
    required ResetPasswordParameters parameters,
  }) async {
    return _repository.resetPasswordByOtp(parameters: parameters);
  }
}
