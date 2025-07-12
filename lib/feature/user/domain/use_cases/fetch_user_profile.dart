import '../entities/details.dart';
import '../entities/parameters/read.dart';
import '../repositories/user.dart';

final class FetchUserProfile {
  const FetchUserProfile({required UserBaseRepository repository})
      : _repository = repository;

  final UserBaseRepository _repository;

  Future<UserDetails> call({required ReadUserParameters parameters}) async {
    return _repository.read(parameters: parameters);
  }
}
