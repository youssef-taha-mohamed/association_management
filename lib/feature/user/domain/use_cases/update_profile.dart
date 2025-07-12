import '../entities/details.dart';
import '../entities/profile_modification_data.dart';
import '../repositories/user.dart';

final class UpdateProfile {
  const UpdateProfile({required UserBaseRepository repository})
      : _repository = repository;

  final UserBaseRepository _repository;

  Future<UserDetails> call({
    required ProfileModificationData parameter,
  }) async {
    return _repository.update(data: parameter);
  }
}
