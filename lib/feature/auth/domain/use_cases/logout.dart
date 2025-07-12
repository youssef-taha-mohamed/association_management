import '../entities/logout_params.dart';
import '../repositories/authentication.dart';

final class Logout {
  const Logout({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<void> call({
    required LogoutParameters parameters,
  }) async {
    return _repository.logout(parameters: parameters);
  }
}
