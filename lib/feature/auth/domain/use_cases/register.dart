import '../../../user/domain/entities/user.dart';
import '../entities/register_credentials.dart';
import '../repositories/authentication.dart';

final class Register {
  const Register({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<User> call({
    required RegisterCredentials credentials,
  }) async {
    return _repository.register(credentials: credentials);
  }
}
