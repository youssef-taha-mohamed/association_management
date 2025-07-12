import '../../../user/domain/entities/user.dart';
import '../entities/login_credentials.dart';
import '../repositories/authentication.dart';

final class Login {
  const Login({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<User> call({
    required LoginCredentials credentials,
  }) async {
    return _repository.login(credentials: credentials);
  }
}
