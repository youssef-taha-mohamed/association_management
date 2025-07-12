import '../repositories/user.dart';

final class DeleteAccount {
  const DeleteAccount({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<void> deleteAccount() async {
    return _repository.delete();
  }
}
