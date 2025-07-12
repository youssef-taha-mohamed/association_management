import '../entities/parameters/toggle_notification.dart';
import '../repositories/user.dart';

final class UserToggleNotification {
  UserToggleNotification({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<bool> call({
    required ToggleNotificationParameters parameters,
  }) async {
    return _repository.toggleNotification(parameters: parameters);
  }
}
