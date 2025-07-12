import '../entities/parameters/user_by_token.dart';
import '../entities/user.dart';
import '../repositories/user.dart';

final class FetchUserByToken {
  const FetchUserByToken({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<User> call({
    required UserByTokenParameters parameters,
  }) {
    return _repository.userByToken(parameters: parameters);
  }
}
