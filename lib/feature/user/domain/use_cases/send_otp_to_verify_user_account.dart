import '../repositories/user.dart';

final class SendOtpToVerifyUserAccount {
  const SendOtpToVerifyUserAccount({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<void> call() {
    return _repository.sendOtpToVerifyUserAccount();
  }
}
