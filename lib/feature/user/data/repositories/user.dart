import '../../domain/entities/details.dart';
import '../../domain/entities/parameters/add_fcm_token.dart';
import '../../domain/entities/parameters/read.dart';
import '../../domain/entities/parameters/toggle_notification.dart';
import '../../domain/entities/parameters/user_by_token.dart';
import '../../domain/entities/parameters/verify_account.dart';
import '../../domain/entities/profile_modification_data.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user.dart';
import '../data_sources/base/data_source.dart';
import '../models/user.dart';
import '../models/user_details.dart';

final class UserRepository implements UserBaseRepository {
  const UserRepository({
    required UserDataSource dataSource,
  }) : _dataSource = dataSource;

  final UserDataSource _dataSource;

  @override
  Future<void> addFcmToken({
    required AddFcmTokenParameters parameters,
  }) {
    return _dataSource.addFcmToken(parameters: parameters);
  }

  @override
  Future<void> delete() {
    return _dataSource.deleteAccount();
  }

  @override
  Future<UserDetails> read({
    required ReadUserParameters parameters,
  }) async {
    final json = await _dataSource.read(parameters: parameters);

    return UserDetailsDTO.fromMap(json);
  }

  @override
  Future<void> sendOtpToVerifyUserAccount() {
    return _dataSource.sendOtpToVerifyUserAccount();
  }

  @override
  Future<User> userByToken({
    required UserByTokenParameters parameters,
  }) async {
    final json = await _dataSource.userByToken(parameters: parameters);

    return UserDTO.fromMap(json);
  }

  @override
  Future<UserDetails> update({
    required ProfileModificationData data,
  }) async {
    final json = await _dataSource.update(data: data);

    return UserDetailsDTO.fromMap(json);
  }

  @override
  Future<bool> toggleNotification({
    required ToggleNotificationParameters parameters,
  }) {
    return _dataSource.toggleNotification(parameters: parameters);
  }

  @override
  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  }) async {
    final json = await _dataSource.verifyAccount(parameters: parameters);

    return UserDTO.fromMap(json);
  }
}
