import '../entities/parameters/verify_account.dart';
import '../entities/user.dart';
import '../repositories/user.dart';

final class VerifyAccount {
  const VerifyAccount({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<User> call({
    required VerifyAccountParameters parameters,
  }) {
    return _repository.verifyAccount(parameters: parameters);
  }
}
