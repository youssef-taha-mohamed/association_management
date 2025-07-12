import '../entities/parameters/add_fcm_token.dart';
import '../repositories/user.dart';

final class AddFcmToken {
  const AddFcmToken({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<void> call({required AddFcmTokenParameters parameters}) {
    return _repository.addFcmToken(parameters: parameters);
  }
}
